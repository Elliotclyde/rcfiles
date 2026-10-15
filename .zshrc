export COLORTERM=truecolor

eval "$(rbenv init -)"
eval `ssh-agent`
ssh-add ~/.ssh/github

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

# run jest with debugger
#
alias testwithdebug="node inspect node_modules/jest/bin/jest.js --runInBand  -- "

# interactive rebase on current branch
#
alias irebase="git rebase -i \"$(git merge-base master HEAD)\""

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/Users/hughhaworth/.nvm/versions/node:$PATH"
export PATH="$NVM_DIR/versions/node/$(nvm current)/bin:$PATH"
export PATH="$HOME/bin:$PATH"

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
