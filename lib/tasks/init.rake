task :init => %w[db:create db:migrate db:seed db:customer:create db:customer:migrate]
