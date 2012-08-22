namespace :spec do
  desc "run unit tests"
  task :unit do
    dirs = Dir["spec/*"].reject { |path| File.file?(path) || ["requests","javascripts","support"].include?(File.basename(path)) } 
    sh "bundle exec rspec #{dirs.join(" ")}"
  end
end
