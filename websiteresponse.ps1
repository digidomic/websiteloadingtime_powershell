$url = @{
# first website to check
DomBlox = "https://domblox.de";
# second website to check
GitHub = "https://github.com";

# you can add more websites like the entries above

}

#Create Table object
$table = New-Object system.Data.DataTable "Loadingtime"

#Define Columns
$col1 = New-Object system.Data.DataColumn Website,([string])
$col2 = New-Object system.Data.DataColumn "Loadingtime in ms",([string])

#Add the Columns
$table.columns.add($col1)
$table.columns.add($col2)

foreach ($vst in $url.GetEnumerator() )
{
  # track execution time:
$timeTaken = Measure-Command -Expression {
  $site = Invoke-WebRequest -Uri $vst.value
}

$milliseconds = $timeTaken.TotalMilliseconds

$milliseconds = [Math]::Round($milliseconds, 1)


#Create a row
$row = $table.NewRow()

#Enter data in the row
$row.website = "$($vst.name)" 
$row."Loadingtime in ms" = "$milliseconds" 

#Add the row to the table
$table.Rows.Add($row)

$influxdbserver = "http://192.168.9.20:8087"
$username = "admin"
$password = ConvertTo-SecureString "mysecurepassword" -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
Write-Influx -Measure loadingtimems -Tags @{website=$($vst.name)} -Metrics @{loadingtime=$milliseconds} -Database webloadingtime -Server $influxdbserver -Credential $cred -Verbose

}

#Display the table
$table | format-table -AutoSize
