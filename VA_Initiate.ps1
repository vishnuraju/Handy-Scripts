$hosts = get-content "hosts.txt"
foreach ($server in $hosts) {
  $addresses = [System.Net.Dns]::GetHostAddresses($server)
  
  foreach($a in $addresses) {
    $output = Test-Connection -ComputerName $a.IPAddressToString -quiet
    $result = $server +','+ $a.IPAddressToString  +','+  $output
    Write-Output $result
    $server, $a.IPAddressToString, $output -join ',' | Out-File -FilePath results.csv -Append
  }
}
