$temp = get-wmiobject -namespace root\OpenHardwareMonitor -query 'select value,name,Parent from Sensor where SensorType="Temperature" and Name LIKE "%CPU Package%"'
Foreach ($i in $temp) {Write-Host -nonewline "win_cpu_temp,cpu=$($i.Parent.Replace('/intelcpu/', '')) temp=$($i.value) `n"}
