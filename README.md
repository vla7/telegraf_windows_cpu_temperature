# Telegraf PowerShell script to collect CPU temperature via OpenHardwareMonitor on Windows

Require OpenHardwareMonitor installed and started.
Use nssm to run OpenHardwareMonitor as windows service.
## Metrics
### ohm.ps1
- win_cpu_temp
  - tags:
      - cpu
  - fields:
    - temp (float, celcius)
### xps-13-9370.ps1
- temp
  - tags:
    - CPU Core 1
    - CPU Core 2
    - CPU Core 3
    - CPU Core 4
    - CPU Package
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
### ohm.ps1
```
win_cpu_temp,cpu=0 temp=35 
win_cpu_temp,cpu=1 temp=34
```
### xps-13-9370.ps1
```
temp,sensor=CPU\ Core\ 1 temp=81
temp,sensor=CPU\ Core\ 2 temp=80
temp,sensor=CPU\ Core\ 3 temp=76
temp,sensor=CPU\ Core\ 4 temp=74
temp,sensor=CPU\ Package temp=77
```
## Debug
run
```
powershell -executionpolicy bypass -File "C:\Program Files\telegraf\ohm.ps1"
```
