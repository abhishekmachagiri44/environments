$Jobs = @()

@('ubuntu-latest', 'windows-latest') | ForEach-Object {
  $Jobs += @{
    job_name = "Run $_ jobs"
    os = $_
    command = "$_ command"
  }
}

$matrixJson = $Jobs | ConvertTo-JSON -Compress
$matrixJson | Out-File -Append -FilePath "matrix.json"

Write-Host "Matrix appended to matrix.json file."
