$servers = get-content "hosts.txt"
foreach ($server in $servers) {
  $addresses = [System.Net.Dns]::GetHostAddresses($server)
  foreach($a in $addresses) {
    $output = Test-Connection -ComputerName $a -quiet
    "{0},{1},{1}" -f $server, $a.IPAddressToString, $output | Out-File -FilePath Results.txt -Append
  }
}
