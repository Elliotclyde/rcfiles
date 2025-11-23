export COLORTERM=truecolor

eval "$(rbenv init -)"
eval `ssh-agent`
ssh-add ~/.ssh/github

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export FONT_AWESOME_AUTH_TOKEN=F635DF24-59B2-4332-8252-7A27588D3C40

alias be="bundle exec"

# Watch the server logs when they're not writing to stdout
alias server_logs="tail -f log/development.log"

# Connect to Heroku and run a rails console
alias staging-console="heroku run rails console -a staging-harvest"
alias heroku-console="heroku run rails console -a "

# Search and open file in vim
#
alias vimo="vim \$(fzf)"

# Cool re-watch of commit
#
alias wutyoudo="gitlogue --commit \$(git rev-parse HEAD) --speed 10 --theme dracula"
