export INFOPATH=/Users/scott/Developer/Cellar/emacs/23.2/share/info
export ARCHFLAGS="-arch x86_64"
export LC_CTYPE=en_US.UTF-8
# export RAILS_ENV=development
export CC_BUILD_ARTIFACTS=~/tmp/build_artifacts
export DEVELOPER=scott
export EC2_TOOLS_DIR=~/.ec2
export SERVER_PORT=3100
export SF_ENV=sf_staging
export CELERITY_GEM_PATH=~/.rvm/gems/ruby-1.8.7-p302@hedgeye/gems/celerity-0.7.9/lib
export HEDGEYE_TOKEN=vWQe24_UHSWt7T8P6s5m
export MAILROOM_RAILS_ROOT=~/.cruise/projects/mail_server/work
export HEDGEYE_READER_URL=http://reader.hedgeye.dev
export BILLING_ENGINE_URL=http://accounts.hedgeye.dev
export HEDGEYE_MARKETING_URL=http://marketing.hedgeye.dev
export BILLING_ENGINE_SECRET="abcd1234"
export JSTESTDRIVER_HOME=~/jars
export HEDGEYE_APP_URL=http://localhost:3000
LESS="-R"; export LESS
# ssh aliases:
alias eod="vim ~/tmp/eod.txt"
alias appserver="ssh ubuntu@174.129.231.236"
alias paypalreport="cd ~/work/failed-paypal-create-recurring-payment-error-report"
alias radium="cd ~/work/radium_ember"
alias jstestdriver="java -jar $JSTESTDRIVER_HOME/jsTestDriver-1.3.5.jar --port 4224"
alias learnjs="cd ~/work/learnjs"
alias jstdtest="java -jar $JSTESTDRIVER_HOME/jsTestDriver-1.3.5.jar --tests all"
alias tyson=appserver
alias prod='ssh ubuntu@174.129.231.236'
alias rungodless='cms; ruby tools/scott/working_scripts/rungodless.rb $1'
alias sta='ssh ubuntu@staging.hedgeye.com'
alias sb='ssh server@superbox.hedgeye.com'
# emacs aliases:
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
# project aliases:
alias cukecipes='cd ~/work/cukecipes'
alias jargon='cd ~/work/yourjargon'
alias ordr='cd ~/work/peepcode-ordr'
alias pot='cd ~/work/peepcode-ordr-test'
alias billingclient='cd ~/work/billing_engine-client'
alias accounts='cd ~/work/accounts.hedgeye'
alias cicentral='cd ~/work/ci-central'
alias common='cd ~/work/hedgeye-common'
alias databasedotcom='cd ~/work/databasedotcom'
alias emberjs='cd ~/work/ember.js'
alias emberdata='cd ~/work/emberdata'
alias examples='cd ~/work/ember-examples'
alias todos='cd ~/work/amberjs_todos'
alias guides='cd ~/work/amberjs_guides'
alias quick='cd ~/work/quick_cuke'
alias octopusci='cd ~/work/octopusci_test'
alias sf_scott='cd ~/work/salesforce/sf_scott'
alias sf_prod='cd ~/work/salesforce/sf_production'
alias sf_staging='cd ~/work/salesforce/sf_staging'
alias co='git checkout $1'
alias push='git push origin HEAD'
alias cms='cd ~/work/hedgeye-cms'
alias compare='cd ~/work/compare_sf_he'
alias shared='cd ~/work/hedgeye-cms/shared'
alias ui='cd ~/work/hedgeye-ui'
alias admin='cd ~/work/hedgeye-admin'
alias service='cd ~/work/hedgeye-service'
alias active='cd ~/work/hedgeye-active-admin'
alias reader='cd ~/work/hedgeye-reader'
alias readerdb='cp ~/work/scott_database.yml ~/work/hedgeye-reader/config/database.yml'
alias static='cd ~/work/configure_salesforce_static_tables'
alias cruise='cd ~/work/cruisecontrol.rb'
alias mailserver='cd ~/work/mailroom-server'
alias billing='cd ~/work/Billing-Logic'
alias marketing='cd ~/work/hedgeye-marketing'
alias client='cd ~/work/hedgeye-client'
alias api='cd ~/work/hedgeyeapi'
alias playground='cd ~/work/playground'
alias resources='cd ~/work/hedgeye-resources'
alias guidance='cd ~/work/guidance_gurus'
alias deleteusers='cd ~/work/delete-test-users'
alias chef='cd ~/work/chef-hedgeye'
alias mongotest='cd ~/work/minitest-mongoid'
alias appv='rvm 1.8.7-p302;rvm gemset use approval_tests;cd ~/work/approval_tests'
alias conr='script/console'
alias cdr="cd $hedgeye"
alias server='script/server webrick -p 3100'
alias whoisonport='lsof -i :$1'
alias startgod='god start -c config/god/config.god -l god.log'
alias godless='ruby tools/scott/working_scripts/rungodless.rb $1'
alias janky='cd ~/work/janky'
alias backgroundfu='RAILS_ENV=development ruby lib/daemons/background.rb start'
alias fetch='git fetch upstream'
alias merge='git merge upstream/master'
alias onguard='bundle exec guard'
alias be='bundle exec'
alias bep='bundle exec padrino'
alias touchpow='touch ~/.pow/restart.txt'
alias gitem='git fetch origin; git merge origin/master'

# Forrest's bash script to pull the production database to his laptop
pull_prod_data () {
   # cdr
   # sometimes this db_backup.06.sql.gz
   tyson_get /shared/db_backup/db_backup.07.sql.gz  .
   say "pulled data from tyson"
   gunzip -c db_backup.07.sql.gz |mysql -u root hedgeye_current
   say "done importing prod data into my sql"
}

tyson_get () {
   scp ubuntu@tyson.hedgeye.com:$1 $2
}

parse_git_branch()
{
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

proml ()
{
     local BLUE="\[\033[0;34m\]";
     local RED="\[\033[0;31m\]";
     local LIGHT_RED="\[\033[1;31m\]";
     local GREEN="\\[\\033[0;32m\\]";
     local LIGHT_GREEN="\[\033[0;32m\]";
     local WHITE="\[\033[1;37m\]";
     local LIGHT_GRAY="\[\033[0;37m\]";
     local YELLOW="\[\033[1;33m\]";
     case $TERM in
         xterm*)
             TITLEBAR='\[\033]0;\u@\h:\w\007\]'
         ;;
         *)
             TITLEBAR=""
         ;;
     esac;
         PS1="\`if [[ \$? = "0" ]]; then echo "\\[\\033[032m\\]"; else echo "\\[\\033[031m\\]"; fi\`\h: \w\$(parse_git_branch)$LIGHT_GREEN \t \$ ";
     PS2='> ';
     PS4='+ '
}

proml

# Set default ruby patch levels for rvm:
rvm alias create 1.8.7 ruby-1.8.7-p358
rvm alias create 1.9.3 ruby-1.9.3-p385

export PATH=$PATH:~/bin:~/work/phantomjs-1.5.0/bin:~/Developer/.rvm/rubies/jruby-1.5.2/bin:/Applications/Firefox.app/Contents/MacOS:~/Developer/Cellar/coffee-script/0.9.2/bin

source ~/.git-completion.sh

