# mqtt_server

1. Configuração Inicial do Projeto
    gem install rails

    rails new mttt_server --api --database=postgresql
    cd mttt_server

2. Configuração do Banco de Dados
    development:
    adapter: postgresql
    encoding: unicode
    database: mttt_server_development
    pool: 5
    username: your_username
    password: your_password

    rails db:create

3. Modelos e Recursos
    rails generate model Message sender:string receiver:string content:text
    rails db:migrate

4. Configuração do WebSocket (ActionCable)
    gem 'redis'
    bundle install
    rails generate channel Message

    Isso criará o canal app/channels/message_channel.rb

5. Controladores e Rotas
    rails generate controller Messages

6. Iniciando o Servidor
    rails s

