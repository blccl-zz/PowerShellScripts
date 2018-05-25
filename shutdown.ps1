$machines = get-content "C:\temp\rebootreboot.txt"
foreach($machine in $machines){
Stop-Computer -computername $machine -force
}