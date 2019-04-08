# config valid only for current version of Capistrano
lock '3.9.1'

set :application, 'portfolio'
set :repo_url, 'git@github.com:hide0129/portfolio.git'
set :user, 'root'
set :password, "hyde0129lec"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :log_level, :debug

set :rbenv_type, :user # :system or :user
set :rbenv_ruby, '2.4.0'

set :linked_dirs, %w{log}

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    on roles(:app) do
      execute :sudo, "apt-get -y update"
      execute :sudo, "apt-get -y upgrade --show-upgraded"
      execute :sudo, "apt-get -y install build-essential"
      execute :sudo, "apt-get -y install curl git"
      execute :sudo, "apt-get -y install libxslt-dev libxml2-dev"
      execute :sudo, "apt-get -y install libdjvulibre-dev libjpeg-dev libtiff-dev libwmf-dev libmagickcore-dev libmagickwand-dev libmagick++-dev"
      execute :sudo, "apt-get -y install imagemagick"
      execute :sudo, "apt-get -y install libcurl4-openssl-dev libffi-dev"
      execute :sudo, "apt-get -y install libav-tools"
      execute :sudo, "apt-get -y install libmysqlclient-dev"
      execute :sudo, "apt-get -y install language-pack-ja"
      execute :sudo, "apt-get -y install libsqlite3-dev"
      execute :sudo, "apt-get -y install mysql-client"
    end
  end
  after "deploy:install", "monit:install"
  after "deploy:install", "node:install"
  after "deploy:install", "rbenv:install"
  after "deploy:install", "nginx:install"

  desc "initialize server"
  task :init do
    invoke 'deploy:install'
    invoke 'unicorn:setup'
    invoke 'nginx:setup'
    invoke 'deploy'
    invoke 'unicorn:start'
  end

  after :published, "unicorn:restart"
end
