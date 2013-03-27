set :application, "DataApp"
set :repository,  "git@github.com:kumquatexpress/YelpHelp.git"
set :user, "ubuntu"
set :use_sudo, false

require 'capistrano-unicorn'
after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
after 'deploy:restart', 'unicorn:restart'  # app preloaded
set :unicorn_env, "production"


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#for ec2
ssh_options[:keys] = ["/home/kumquat/keys/RailsTester.pem"]


role :web, "http://174.129.210.6"                          # Your HTTP server, Apache/etc
role :app, "http://174.129.210.6"                          # This may be the same as your `Web` server
role :db,  "http://174.129.210.6", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
