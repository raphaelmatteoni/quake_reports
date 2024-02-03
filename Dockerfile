# syntax=docker/dockerfile:1
FROM ruby:3.2.2

# Instalação de dependências
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client git

# Configuração do diretório de trabalho
WORKDIR /quake_reports

# Cópia dos arquivos de configuração e instalação das gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Adição do código da aplicação
COPY . .

# Adição de um script para ser executado toda vez que o contêiner iniciar
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Adição do script de inicialização
COPY init.sh /usr/bin/
RUN chmod +x /usr/bin/init.sh

# Exposição da porta 3000
EXPOSE 3000

# Configuração do processo principal a ser executado ao rodar a imagem
ENTRYPOINT ["init.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
