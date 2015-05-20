
def _cset(name, *args, &block)
  unless name.nil?
    set(name, *args, &block)
  end
end

# Set the user of your application
set :user, 'Donsell'

#Set the application name on the server
set :application, 'obs2'

# Set the name of your branch
set :branch, :master

# The amount of release you want to keep
set :keep_releases, 3

# Do you deploy as a sudo user
set :use_sudo, false

# Set true if you deploy to a shared environment
set :group_writable, false

set :deploy_via, :remote_cache

# Where do you want to deploy
set :deploy_to, "var/www/#{:application}"




set :scm, :git

# Enable submodule to be updated
set :git_enable_submodules, 1

# Only deploy shallow clone, this will not clone the whole git history, just the latest state.
set :git_shallow_clone, 1

# Asks for a password for your repository but authentication via ssh is recmmended
#set :scm_password, Proc.new {CLI.password_prompt 'GIT Password: '}

# Set password for scm, using ssh key is recommended
# set :scm_passphrase, "p@ssw0rd"  # The deploy user's password




_cset :configs, [:database]







begin
  require 'bundler/capistrano'
rescue LoadError
  raise "\nbundler gem not found. Please install it with '(sudo) gem install bundler'."
end



# Must be set for the password prompt from git to work
default_run_options[:pty] = true

# Default action to clean older versions
after :deploy, 'deploy:cleanup'





namespace :configs do
  configs.each do |name|
    namespace name do
      desc "Create #{name}.yml in shared/config"
      task :copy do
        run "mkdir -p #{shared_path}/config"

        config = YAML.load_file(%Q{./config/#{name}.yml})[rails_env.to_s]
        put({rails_env => config}.to_yaml, "#{shared_path}/config/#{name}.yml")
      end

      desc "Link the #{name}.yml"
      task :link do
        run "ln -nfs #{shared_path}/config/#{name}.yml #{release_path}/config/#{name}.yml"
      end
    end

    after 'deploy:setup', "configs:#{name}:copy"
    after 'deploy:finalize_update', "configs:#{name}:link"
  end
end



desc 'Prompts if new migrations are available and runs them if you want to'
namespace :deploy do
  task :needs_migrations, :roles => :db, :only => {:primary => true} do
    migrations_changed = if previous_release.nil?
      true # propably first deploy, so no migrations to compare
    else
      old_rev = capture("cd #{previous_release} && git log --pretty=format:'%H' -n 1 | cat").strip
      new_rev = capture("cd #{latest_release} && git log --pretty=format:'%H' -n 1 | cat").strip
      capture("cd #{latest_release} && git diff #{old_rev} #{new_rev} --name-only | cat").include?('db/migrate')
    end
    if migrations_changed && Capistrano::CLI.ui.ask("New migrations pending. Enter 'yes' to run db:migrate") == 'yes'
      migrate
    end
  end
end
after 'deploy:update_code', 'deploy:needs_migrations'



