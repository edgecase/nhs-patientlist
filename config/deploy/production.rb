set :deploy_to, "/u/apps/patient_list"
set :branch,    "production"
set :rails_env, "production"
set :user,      "patient_list"
set(:current_path) { File.join(deploy_to, current_dir) }

task :symlink_config_files, :roles => :app do
  run "cd #{latest_release}/config && rm -f database.yml && ln -s #{shared_path}/config/database.yml"
  run "cd #{latest_release}/config && rm -f unicorn.rb   && ln -s #{shared_path}/config/unicorn.rb"
  run "cd #{latest_release}/public && ln -s #{shared_path}/pngs"
end
before "deploy:assets:precompile", "symlink_config_files"

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
  task :graceful_stop, :roles => :app,
  :except => { :no_release => true } do
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
