set :env_id, 'portfolio-production'
set :instance_count, 1
set :branch, :master

set :password, "hyde0129lec"
set :use_sudo, true

set :stage, :production
set :rails_env, :production

set :bundle_binstubs, nil
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/shared public/uploads node_modules}

role :app, %w{root@118.27.5.234}
role :web, %w{root@118.27.5.234}
role :db, %w{root@118.27.5.234}

set :ssh_options, {
  keys: [File.expand_path('~/.ssh/portfolio')],
  forward_agent: true,
  port: 22,
  auth_methods: %w(publickey),
  password: "hyde0129lec"
}
