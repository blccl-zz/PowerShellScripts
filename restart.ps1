$machines = get-content "C:\temp\rebootreboot.txt"
foreach($machine in $machines){
restart-computer -computername $machine -force
}