### coragyps

#### uso

Utilize o script com `xclip` para montar a string com ip + domínio:
```bash
./main.sh <ip> | xclip -sel clip
```

### todo

- [ ] adicionar o (sub)domínio em /etc/hosts automaticamente
- [ ] fazer scan do alvo com rustscan e gerar JSON com os dados
- [ ] enumeração de subdomínios com o ffuf
- [ ] modo de enumeração com wordlists prédefinidas, por exemplo para API utiliza-se a wordlist api-endpoints
- [ ] caçar cves em alguma api com as versões de software que forem expostas nos responde bodies.
