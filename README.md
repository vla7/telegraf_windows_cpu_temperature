# Telegraf PowerShell script to collect CPU temperature via OpenHardwareMonitor on Windows

Require OpenHardwareMonitor installed and started.
Use nssm to run OpenHardwareMonitor as windows service.
## Metrics
- win_cpu_temp
  - tags:
      - cpu
- fields:
  - temp (float, celcius)
  
## Configuration
```
[[inputs.exec]]
   interval = "30s"
   commands = ['powershell -executionpolicy bypass -File "C:\\Program Files\\telegraf\\ohm.ps1"']
   data_format = "influx"
```
## Example output
```
win_cpu_temp,cpu=0 temp=35 
win_cpu_temp,cpu=1 temp=34
```
## Debug
run
```
powershell -executionpolicy bypass -File "C:\Program Files\telegraf\ohm.ps1"
```
