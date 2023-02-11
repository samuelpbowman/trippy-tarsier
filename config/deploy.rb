set :application_name, 'trippy-tarsier'
set :domain, 'thebowmans.wedding'
set :user, 'deploy'
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application_name)}"
set :repo_url, 'git@github.com:samuelpbowman/trippy-tarsier.git'
set :branch, 'main'

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

append :linked_files, "config/master.key"
