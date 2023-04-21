$port = 8080
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://127.0.0.1:$port/")
$listener.Start()
Write-Host "Listening on port $port..."

while ($listener.IsListening) {
  $context = $listener.GetContext()
  $request = $context.Request
  $response = $context.Response

  if ($request.HttpMethod -eq "POST") {
    $command = $request.InputStream
    $commandReader = New-Object System.IO.StreamReader($command)
    $commandBody = $commandReader.ReadToEnd()

    $output = & cmd.exe /C $commandBody 2>&1

    $response.ContentType = "text/plain"
    $response.ContentEncoding = [System.Text.Encoding]::UTF8

    $responseString = $output
    $buffer = [System.Text.Encoding]::UTF8.GetBytes($responseString)

    $response.ContentLength64 = $buffer.Length
    $response.OutputStream.Write($buffer, 0, $buffer.Length)
    $response.OutputStream.Close()

    Write-Host $output
  } else {
    $response.StatusCode = 405
  }
}
