# Appscript_reverseProxy_Github_README
### APPscript版本
#### Victim
- ./appscript_client.ps1

#### Attacker server
- 先用postman頂著用
### Reverse shell版本
#### Victim
- rev_shell_client.ps1啟動即可
- 自行更改Server IP,port
####  Attacker server
- 在Ubuntu執行
```
nc- l 11111
```
- port:11111

### Binding shell版本
#### Victim

- bindshell_client.ps1啟動即可
- - 自行更改IP,port
####  Attacker server
```
nc client_IP Port
```
### AppScriptProxy
#### victim

- appscript_client.ps1啟動即可
#### Attacker server
- 暫用postman發請求==
- ![](https://i.imgur.com/kmf2AUX.png)
