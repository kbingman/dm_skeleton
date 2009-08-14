desc 'Default task: run all tests'
task :default => [:test]

task :test do
  exec "thor monk:test"
end

namespace :db do
  desc 'Auto-migrate the database (destroys data)'
  task :migrate do
    exec "thor monk:migrate"

  desc 'Auto-upgrade the database (preserves data)'
  task :upgrade do
    exec "thor monk:upgrade"
  end
end
