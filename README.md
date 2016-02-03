# Backchat
Unified user feedback/contact system allowing simple HTML form POSTs to become quantifiable and actionable user feedback.

## Lifecycle of a submission
Submission is received as HTTP POST form or JSON, user sent back to thankyou
Validated; does it match a form uuid, do the fields validate
Store submission in DB
Create output objects to track progress of submissions into other systems
Create output jobs to action outputs asynchronously including for objects with no jobs


## Installing on OSX Development
```
#install homebrew 
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#install rbenv
brew install rbenv ruby-build

# Add rbenv to bash so that it loads every time you open a terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

# Install Ruby
rbenv install 2.2.3

#missing openssl.h
brew install openssl
brew link openssl --force
#Can't find the 'libpq-fe.h header
brew install postgresql
initdb /usr/local/var/postgres
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
# logs etc. in /usr/local/var/postgres/
createdb backchat_development
echo "CREATE extension IF NOT EXISTS pgcrypto;" | psql -d backchat_development
#install deps
bundle install

# setup db
bin/rake db:setup
# rebuild db
bin/rake db:drop
bin/rake db:create
echo "CREATE extension IF NOT EXISTS pgcrypto;" | psql -d backchat_development
bin/rake db:migrate
bin/rake db:setup
# create admin + user
bin/rake db:seed
```