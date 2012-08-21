require "bundler/capistrano"
load 'deploy/assets'

set :application, 'nhs-patientlist'
set :scm,         :git
set :repository,  "git@github.com:edgecase/nhs-patientlist.git"
set :rails_env,   :production
set :use_sudo,    false
set :user,        "hack_day_user"
set :deploy_to,   "/u/apps/#{application}"
set :deploy_server, "84.45.13.49"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# deployment servers
role :web, deploy_server                    # Web server (Nginx)
role :app, deploy_server                    # App server (unicorn)
role :db,  deploy_server, :primary => true  # db server  (postgres)

before "deploy:assets:precompile", "symlink_config_files"
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :seed, :roles => :app do
    run "cd #{release_path} && /usr/bin/env rake db:seed RAILS_ENV=production"
  end
end

task :symlink_config_files, :roles => :app do
  run "cd #{release_path}/config && rm -f database.yml && ln -s #{shared_path}/config/database.yml"
end



after 'deploy:update_code', 'symlink_config_files'

def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end
