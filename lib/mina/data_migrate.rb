
set :data_migration_dirs, ['db/data']

namespace :rails do
  desc 'Migrate database'
  task :db_data_migrate do
    ensure!(:deploy_block, message: "Can't be run outside deploy do block. Please use mina 'rake[db_data_migrate]' instead")
    if fetch(:force_migrate)
      comment %(Migrating database with data)
      command %(#{fetch(:rake)} db:migrate:with_data)
    else
      command check_for_changes_script(
                at: fetch(:migration_dirs) + fetch(:data_migration_dirs),
                skip: %(echo "-----> DB/data migrations unchanged; skipping migration"),
                changed: %(echo "-----> Migrating database with data"
          #{echo_cmd("#{fetch(:rake)} db:migrate:with_data")})
              ), quiet: true
    end
  end
end
