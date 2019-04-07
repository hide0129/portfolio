namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration"
  task :setup do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/config"
      template "unicorn.rb.erb", "#{shared_path}/config/unicorn.rb"
      template "unicorn_init.erb", "/tmp/unicorn_init"
      execute "chmod +x /tmp/unicorn_init"
      execute :sudo, "mv /tmp/unicorn_init /etc/init.d/unicorn_#{fetch(:application)}"
      execute :sudo, "update-rc.d -f unicorn_#{fetch(:application)} defaults"
    end
  end

  desc "Update Unicorn configuration"
  task :update do
    on roles(:app) do
      template "unicorn.rb.erb", "#{shared_path}/config/unicorn.rb"
    end
  end

  desc "Start unicorn"
  task :start do
    on roles(:app) do
      execute "service unicorn_#{fetch(:application)} start"
    end
  end
  desc "Stop unicorn"
  task :stop do
    on roles(:app) do
      execute "service unicorn_#{fetch(:application)} stop"
    end
  end
  desc "Restart application"
  task :restart do
    on roles(:app), in: :groups, limit: 3, wait: 6 do
      execute "service unicorn_#{fetch(:application)} restart"
    end
  end
end
