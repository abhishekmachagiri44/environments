$Jobs = @()

@('ubuntu-latest', 'windows-latest') | ForEach-Object {
  $Jobs += @{
    job_name = "Run $_ jobs"
    os = $_
    command = "$_ command"
  }
}

Write-Host "::set-output name=matrix::$($Jobs | ConvertTo-JSON -Compress))"
