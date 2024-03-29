# Place in /config/puma/production.rb

rails_env = "production"
environment rails_env

app_dir = "/home/deploy/trippy-tarsier" # Update me with your root rails app path

bind  "unix://#{app_dir}/var/run/trippy.sock"
pidfile "#{app_dir}/puma.pid"
state_path "#{app_dir}/puma.state"
directory "#{app_dir}/current"

stdout_redirect "#{app_dir}/var/log/puma.stdout.log", "#{app_dir}/var/log/puma.stderr.log", true

workers 2
threads 1,2

activate_control_app "unix://#{app_dir}/pumactl.sock"

prune_bundler