# Instalação simplificada

Instalando o Odoo 16 com apenas um comando.

(Suporta várias instâncias na mesma máquina.)


Instalar primeiramente na sua máquina o [docker](https://docs.docker.com/get-docker/) e o [docker-compose](https://docs.docker.com/compose/install/) para que seja possível fazer a instalação. 

Vamos usar a ferramenta cURL ("URL do cliente"), para fazer as tranferências de dados, assim, devese-se checar se há o cURL instalado:

``` bash
curl --version
```
Se não tiver instalado, fazê-lo com o seguinte código:

``` bash
$ sudo apt-get install curl
# ou
$ sudo yum install curl
```

Agora, rodar a instalação do Odoo16 através do seguinte código:

``` bash
curl -s https://raw.githubusercontent.com/ronaldopadula/odoo-16-br-docker-compose/master/instalar.sh | sudo bash -s odoo16-one 10016 20016
```

para configurar a primeira instância do Odoo16 @ 'localhost:10016' (senha mestra padrão: 'ronaldo.padula')

e

``` bash
curl -s https://raw.githubusercontent.com/ronaldopadula/odoo-16-br-docker-compose/master/instalar.sh | sudo bash -s odoo16-two 11016 21016
```

para configurar uma segunda instância do Odoo @ 'localhost:11016' (senha mestra padrão: 'ronaldo.padula')

Nos links anteriores, :
* Primeiro Argumento (**odoo16-one**): Pasta de deploy do Odoo16
* Segundo argumento (**10016**): Porta para o Odoo
* Terceiro argumento (**20016**): porta para o live chat

# Usando

Iniciar o container:
``` sh
docker-compose up
```

* Posteriormente abrir `localhost:10016` para acessar a instalação do Odoo 16. Se precisar inciar o servidor Odoo em uma porta diferente, mudar **10016** para outro valor referente a porta escolhida no arquivo **docker-compose.yml**:

```
ports:
 - "10016:8069"
```

Executar o contêiner Odoo no modo desanexado (ser capaz de fechar o terminal sem parar Odoo):

```
docker-compose up -d
```

**Se receber mensagem com o problema de permissão**, altere a permissão da pasta para certificar-se de que o contêiner é capaz de acessar o diretório:

``` sh
$ git clone https://github.com/ronaldopadula/odoo-16-br-docker-compose.git
$ sudo chmod -R 777 addons
$ sudo chmod -R 777 etc
$ mkdir -p postgresql
$ sudo chmod -R 777 postgresql
```

Para evitar erros quando executamos várias instâncias do Odoo., deve-se aumentar o número máximo de arquivos em execução de 8192 (padrão) para 524288. Esta é uma etapa opcional, que no ubuntu é feita com os seguintes comandos:

```
$ if grep -qF "fs.inotify.max_user_watches" /etc/sysctl.conf; then echo $(grep -F "fs.inotify.max_user_watches" /etc/sysctl.conf); else echo "fs.inotify.max_user_watches = 524288" | sudo tee -a /etc/sysctl.conf; fi
$ sudo sysctl -p    # apply new config immediately
```

# Custom addons

A pasta addons/ conportará addons personalizados. Basta colocar seus addons personalizados, se você tiver algum.

# Configuração e log do Odoo

* Para mudar as configurações do odoo, editar o arquivo: **etc/odoo.conf**.
* O arquivo de log do Odoo é : **etc/odoo-server.log**
* O password padrão da base de dados (**admin_passwd**) é `ronaldo.padula`, mas você pode mudar isso em @ [etc/odoo.conf#L60](/etc/odoo.conf#L60)

# Para administrar os containeres

**Run Odoo**:

``` bash
docker-compose up -d
```

**Restart Odoo**:

``` bash
docker-compose restart
```

**Stop Odoo**:

``` bash
docker-compose down
```

# Live chat

Em [docker-compose.yml#L21](docker-compose.yml#L21), nós expomos a porta **20016** para o host do live-chat.

Configurar o **nginx** para ativar o recurso de live-chat (em produção):

``` conf
#...
server {
    #...
    location /longpolling/ {
        proxy_pass http://0.0.0.0:20016/longpolling/;
    }
    #...
}
#...
```

# docker-compose.yml

* odoo:16.0
* postgres:14

# Odoo 16 screenshots

<img src="screenshots/odoo-16-welcome-screenshot.png" width="50%">

<img src="screenshots/odoo-16-apps-screenshot.png" width="100%">

<img src="screenshots/odoo-16-sales-screen.png" width="100%">

<img src="screenshots/odoo-16-product-form.png" width="100%">
