# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "198.13.32.48", user: "root", roles: %w{app db web}
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
 set :ssh_options, {
   keys: %w(/Users/yqwoe/.ssh/id_rsa.pub),
#    forward_agent: false,
#    auth_methods: %w(password)
 }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }

# set :sidekiq_roles, -> { :app }
# set :sidekiq_systemd_unit_name, "sidekiq@#{fetch(:stage)}"

# namespace :sidekiq do
#   desc 'Quiet sidekiq (stop fetching new tasks from Redis)'
#   task :quiet do
#     on roles fetch(:sidekiq_roles) do
#       # See: https://github.com/mperham/sidekiq/wiki/Signals#tstp
#       execute :systemctl, '--user', 'kill', '-s', 'SIGTSTP', fetch(:sidekiq_systemd_unit_name), raise_on_non_zero_exit: false
#     end
#   end

#   desc 'Stop sidekiq (graceful shutdown within timeout, put unfinished tasks back to Redis)'
#   task :stop do
#     on roles fetch(:sidekiq_roles) do
#       # See: https://github.com/mperham/sidekiq/wiki/Signals#tstp
#       execute :systemctl, '--user', 'kill', '-s', 'SIGTERM', fetch(:sidekiq_systemd_unit_name), raise_on_non_zero_exit: false
#     end
#   end

#   desc 'Start sidekiq'
#   task :start do
#     on roles fetch(:sidekiq_roles) do
#       execute :systemctl, '--user', 'start', fetch(:sidekiq_systemd_unit_name)
#     end
#   end

#   desc 'Restart sidekiq'
#   task :restart do
#     on roles fetch(:sidekiq_roles) do
#       execute :systemctl, '--user', 'restart', fetch(:sidekiq_systemd_unit_name)
#     end
#   end
# end


namespace :puma do
    desc 'Create Directories for Puma Pids and Socket'
    task :make_dirs do
      on roles(:app) do
        execute "mkdir #{shared_path}/tmp/sockets -p"
        execute "mkdir #{shared_path}/tmp/pids -p"
      end
    end
  
    before :start, :make_dirs
  end
  
  namespace :deploy do
    desc "Make sure local git is in sync with remote."
    task :check_revision do
      on roles(:app) do
        unless `git rev-parse HEAD` == `git rev-parse origin/master`
          puts "WARNING: HEAD is not the same as origin/master"
          puts "Run `git push` to sync changes."
          exit
        end
      end
    end

    task :rake_list do
      on roles(:app) do

        execute "bundle exec rake init:area_import"
        execute "bundle exec rake init:city_import"
        execute "bundle exec rake init:villages_import"
        execute "bundle exec rake init:village_import"
        execute " bundle exec rake init:position_import"
        execute " bundle exec rake init:property_import"
        execute " bundle exec rake init:house_import"
      end
    end
  
    desc 'Initial Deploy'
    task :initial do
      on roles(:app) do
        before 'deploy:restart', 'puma:start'
        invoke 'deploy'
      end
    end
  
    desc 'Restart application'
    task :restart do
      on roles(:app), in: :sequence, wait: 5 do
        invoke 'puma:restart'
      end
    end
  
    before :starting,     :check_revision
    # after :finishing,     :rake_list
    after  :finishing,    :cleanup
    after  :finishing,    :restart
  end


after 'deploy:starting', 'sidekiq:quiet'
after 'deploy:updated', 'sidekiq:stop'
after 'deploy:published', 'sidekiq:start'
after 'deploy:failed', 'sidekiq:restart'