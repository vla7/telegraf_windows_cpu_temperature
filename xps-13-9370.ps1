# This works on a dell xps-13 9370 and provides cpu cores and package temps
# 
$temp = get-wmiobject -namespace root\OpenHardwareMonitor -query 'select value,name from Sensor where SensorType="Temperature" and Name LIKE "%CPU%"'
Foreach ($i in $temp) {Write-Host -nonewline "temp,sensor=$($i.Name.Replace('#','').Replace(' ','\ ')) temp=$($i.value) `n"}
