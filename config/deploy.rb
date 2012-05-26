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

task :symlink_config_files, :roles => :app do
  run "cd #{release_path}/config && rm -f database.yml && ln -s #{shared_path}/config/database.yml"
  run "cd #{release_path}/config && rm -f unicorn.rb   && ln -s #{shared_path}/config/unicorn.rb"
end
after 'deploy:update_code', 'symlink_config_files'

def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end
