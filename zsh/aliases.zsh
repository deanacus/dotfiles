# File system stuff
alias home="cd ~"
alias up="cd ../"
alias back="cd -"
# alias emulate="open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# source ~/.zshrc
alias src="source $HOME/.zshrc"

# vhosts
alias hosts='sudo vim /etc/hosts'

# copy file interactive
alias cp='cp -iv'

# move file interactive
alias mv='mv -iv'

# make new dir path
alias mkdir="mkdir -pv"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//[:,]/\\n}'

# Rerun last command as sudo
alias please='sudo $(fc -ln -1)'
alias fuck='sudo $(fc -ln -1)'

alias cat="bat"

alias ls="exa --long --no-time --all --group-directories-first --header --git --no-permissions"
alias la="exa --long --no-time --all --group-directories-first --header --git"



########################
# WORK DEFINED ALIASES #
########################

# XYG Symfony
alias dbCreate='php bin/console doctrine:database:create'
alias dbClearStrapi='mysql --verbose -D xygaming -u root -e "DROP TABLE IF EXISTS \`users-permissions_permission\`;DROP TABLE IF EXISTS \`users-permissions_role\`;DROP TABLE IF EXISTS \`users-permissions_user\`;DROP TABLE IF EXISTS \`core_store\`;"'
alias dbClear='dbClearStrapi;php bin/console doctrine:schema:drop --full-database'
alias dbMigrate='php bin/console doctrine:migrations:migrate -n'
alias dbGenMigrate='php bin/console doctrine:migrations:diff'
alias dbManualMigrations='mysql --verbose xygaming -u root < ./app/Resources/ManualMigrations/202101/RPT-110-initial-tournament-entry-count.sql'
alias dbLoad='php bin/console doctrine:fixtures:load -n;dbManualMigrations'
alias dbClearMigrate='dbClear --force;dbMigrate;dbLoad'
alias docInstall='php bin/console assets:install'
alias clearCache='rm -Rf var/cache/*'
alias clearLogs='truncate -s 0 var/logs/dev*.log'
alias showRoutes='php bin/console debug:router'
alias checkRoute='php bin/console router:match %1'