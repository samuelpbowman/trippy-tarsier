# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'trippy-tarsier'
set :domain, 'thebowmans.wedding'
set :user, 'deploy'
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application_name)}"
set :repository, 'git@github.com:samuelpbowman/trippy-tarsier.git'
set :branch, 'main'

# Optional settings:
set :user, 'deploy'          # Username in the server to SSH to.
set :port, '3456'           # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
# set :shared_dirs, fetch(:shared_dirs, []).push('public/assets')
# set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')
set :shared_dirs, fetch(:shared_dirs, []).push('public/packs', 'node_modules')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  ruby_version = File.read('.ruby-version').strip
  raise "Couldn't determine Ruby version: Do you have a file .ruby-version in your project root?" if ruby_version.empty?

  invoke :'rbenv:load', ruby_version
end
=begin
# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do

  in_path(fetch(:shared_path)) do

    command %[mkdir -p config]

    # Create database.yml for Postgres if it doesn't exist
    path_database_yml = "config/database.yml"
    database_yml = %[production:
  database: #{fetch(:user)}
  adapter: postgresql
  pool: 5
  timeout: 5000]
    command %[test -e #{path_database_yml} || echo "#{database_yml}" > #{path_database_yml}]

    # Create secrets.yml if it doesn't exist
    path_secrets_yml = "config/secrets.yml"
    secrets_yml = %[production:\n  secret_key_base:\n    #{`bundle exec rake secret`.strip}]
    command %[test -e #{path_secrets_yml} || echo "#{secrets_yml}" > #{path_secrets_yml}]
    
    # Remove others-permission for config directory
    command %[chmod -R o-rwx config]
  end

end
=end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
