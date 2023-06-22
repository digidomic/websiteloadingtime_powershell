# Website loading time monitoring
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate?hosted_button_id=TDVLA45EDEXRC)


---
<img src="https://github.com/digidomic/websiteloadingtime_powershell/blob/main/img/grafanadashboard.jpg">
---

## Powershell

For running the powershell script you first need to install this module:
https://github.com/markwragg/PowerShell-Influx  
Edit the first lines for changing the websites you want to track.  
Edit the last lines in the script to connect to yout influxdb instance.


## InfluxDB

You need a running influxdb instance with a database named "webloadingtime".
If you don't have one you can run the docker-compose file.

## Grafana

Import and edit the json file for the grafana dashboard.

---

## License

GNU General Public License v3  
You can change the source code and use this software for commercial usage.  
You are not allowed to make profit with this software.




