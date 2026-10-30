# Odoo 16 com Docker Compose — projeto unificado

> **Este repositório foi unificado.** A instalação do Odoo 14, 15 e 16 agora fica em um só projeto,
> mais seguro e mais simples de usar:
>
> ### ➜ [ronaldopadula/odoo-15-br-docker-compose](https://github.com/ronaldopadula/odoo-15-br-docker-compose)

## Instalar o Odoo 16

No servidor (Ubuntu ou Debian), rode:

``` bash
curl -fsSLO https://raw.githubusercontent.com/ronaldopadula/odoo-15-br-docker-compose/master/instalar.sh
sudo VERSAO=16 bash instalar.sh odoo16 10016
```

Ao final, o instalador mostra o endereço de acesso e as senhas. O passo a passo completo, com
imagens, está no [README do projeto unificado](https://github.com/ronaldopadula/odoo-15-br-docker-compose#readme).

O comando antigo deste repositório continua funcionando: o `instalar.sh` daqui é apenas um atalho
que chama o instalador unificado com `VERSAO=16`.

## Se você instalou com a versão antiga deste repositório

A versão antiga usava uma **senha mestra fixa e pública** e deixava a porta do Odoo aberta para a
internet. Em toda instalação feita com ela:

1. **Troque a senha mestra**: edite `admin_passwd` em `etc/odoo.conf` e reinicie
   (`sudo docker-compose restart`).
2. De preferência, **migre para o projeto unificado**: faça backup das bases pelo Gerenciador de Bancos,
   instale com o comando acima e restaure as bases na instalação nova.

A senha antiga continua visível no histórico deste repositório; por isso a troca é necessária mesmo
depois desta atualização.

> O Odoo 16 não tem mais imagem oficial mantida pela Odoo. Use atrás de HTTPS, com senhas fortes.
