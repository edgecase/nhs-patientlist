require "bundler/capistrano"
load 'deploy/assets'

set :application, 'nhs-patientlist'
set :scm,         :git
set :repository,  "git@github.com:edgecase/nhs-patientlist.git"
set :rails_env,   :production
set :use_sudo,    false
set :user,        application
set :deploy_to,   "/u/apps/#{application}"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# deployment servers
role :web, "chef.test"                    # Web server (Nginx)
role :app, "chef.test"                    # App server (unicorn)
role :db,  "chef.test", :primary => true  # db server  (postgres)

task :symlink_config_files, :roles => :app do
  run "cd #{release_path}/config && rm -f database.yml && ln -s #{shared_path}/config/database.yml"
  run "cd #{release_path}/config && rm -f unicorn.rb   && ln -s #{shared_path}/config/unicorn.rb"
end
after 'deploy:update_code', 'symlink_config_files'

# unicorn tasks
set :unicorn_binary, "bundle exec unicorn"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid,    "#{current_path}/tmp/pids/unicorn.pid"

namespace :unicorn do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    if remote_file_exists?(unicorn_pid)
      stop
    end
    start
  end
end
after "deploy:restart", "unicorn:restart"

def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end
