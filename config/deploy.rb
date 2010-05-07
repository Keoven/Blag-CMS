set :application, "Blag"
set :repository, "git://github.com/Keoven/Blag-CMS.git"

set :scm, :git

role :web, "175.41.165.67"
role :app, "175.41.165.67"
role :db,  "175.41.165.67", :primary => true
#role :db,  "your slave db-server here"

set :use_sudo, false
set :deploy_to, "/mnt/webapps/#{application}"
set :user, "nelvin"

namespace :deploy do

  desc "Restart the mongrel cluster"
  task :restart do
    run "/ecclabs/ecc_restart_app.sh #{application}"
  end

  desc "Setup application via simple script"
  task :config_app do
    run "/ecclabs/ecc_create_app.rb #{application}"
  end    
          
  #hooks 
  after "deploy:setup", "deploy:config_app"

end
