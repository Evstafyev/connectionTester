Import-CSV ".\source\hosts.csv" -header("ComputerName") | ForEach {
$ComputerName = $_.ComputerName 
$echoRequest = Test-Connection -ComputerName $ComputerName -Count 3 -Quiet
if ($echoRequest) {
  Write-Output "$ComputerName" | Out-file .\hosts-up.csv -Append
} 
else {
  Write-Output "$ComputerName" | Out-File .\hosts-down.csv -Append
}
}
