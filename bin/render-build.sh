set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
# after initial deployment remove db:seed line out
bundle exec rake db:seed
