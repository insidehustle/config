# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# lambda
# peepcode



# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    # zsh-autosuggestions
    kubectl
    # gcloud
)

# User configuration
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#### Language specifications


# To support the configuring our go environment we will override the cd
# command to call the go logic for checking the go version.
#
# We also make sure to call ls when changing directories as it's nice to see
# what's in each directory.
#
# NOTE: We use `command` and not `builtin` because the latter doesn't take into
# account anything available on the user's $PATH but also because it didn't
# work with the Starship prompt which seems to override cd also.
#function cd {
  #command cd "$@"
  #RET=$?
  #ls
  #go_version
  #return $RET
#}

## configure go environment
##
## Custom go binaries are installed in $HOME/go/bin.
##
#function go_version {
    #if [ -f "go.mod" ]; then
        #v=$(grep -E '^go \d.+$' ./go.mod | grep -oE '\d.+$')
        #if [[ ! $(go version | grep "go$v") ]]; then
          #echo ""
          #echo "About to switch go version to: $v"
          #if ! command -v "$HOME/go/bin/go$v" &> /dev/null
          #then
            #echo "run: go install golang.org/dl/go$v@latest && go$v download && sudo cp \$(which go$v) \$(which go)"
            #return
          #fi
          #sudo cp $(which go$v) $(which go)
        #fi
    #fi
#}
#if [ ! -f "$HOME/go/bin/gofumpt" ]; then
    #go install mvdan.cc/gofumpt@latest
#fi
#if [ ! -f "$HOME/go/bin/revive" ]; then
    #go install github.com/mgechev/revive@latest
#fi

## configure rust environment
##
## - autocomplete
## - rust-analyzer
## - cargo audit
## - cargo-nextest
## - cargo fmt
## - cargo clippy
## - cargo edit
##
#source $HOME/.cargo/env
#if [ ! -f "$HOME/.config/rustlang/autocomplete/rustup" ]; then
  #mkdir -p ~/.config/rustlang/autocomplete
  #rustup completions bash rustup >> ~/.config/rustlang/autocomplete/rustup
#fi
#source "$HOME/.config/rustlang/autocomplete/rustup"
#if ! command -v rust-analyzer &> /dev/null
#then
  #brew install rust-analyzer
#fi
#if ! cargo audit --version &> /dev/null; then
  #cargo install cargo-audit --features=fix
#fi
#if ! cargo nextest --version &> /dev/null; then
  #cargo install cargo-nextest
#fi
#if ! cargo fmt --version &> /dev/null; then
  #rustup component add rustfmt
#fi
#if ! cargo clippy --version &> /dev/null; then
  #rustup component add clippy
#fi
#if ! ls ~/.cargo/bin | grep 'cargo-upgrade' &> /dev/null; then
  #cargo install cargo-edit
#fi



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/luke.caradine/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/luke.caradine/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/luke.caradine/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/luke.caradine/google-cloud-sdk/completion.zsh.inc'; fi

encode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64
    else
        printf '%s' $1 | base64
    fi
}

decode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64 --decode
    else
        printf '%s' $1 | base64 --decode
    fi
}
alias e64=encode64
alias d64=decode64
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform


# BEGIN SNIPPET: Magento Cloud CLI configuration
# HOME=${HOME:-'/Users/luke.caradine'}
# export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
# if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET

# # BEGIN SNIPPET: Platform.sh CLI configuration
# HOME=${HOME:-'/Users/luke.caradine'}
# export PATH="$HOME/"'.platformsh/bin':"$PATH"
# if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

generatecsr() {
# Common Name: The FQDN (fully-qualified domain name) you want to secure with the certificate such as www.google.com, secure.website.org, *.domain.net, etc.
# Organization: The full legal name of your organization including the corporate identifier.
# Organization Unit (OU): Your department such as ‘Information Technology’ or ‘Website Security.’
# City or Locality: The locality or city where your organization is legally incorporated. Do not abbreviate.
# State or Province: The state or province where your organization is legally incorporated. Do not abbreviate.
# Country: The official two-letter country code (i.e. US, CH) where your organization is legally incorporated.
   openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr
}
alias gencsr=generatecsr
#. $(pack completion --shell zsh)
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias b="prettybat"
alias rgf="rg --files | fzf"
alias upgrade="brew upgrade && npm update -g && gcloud components update"
alias nv="nvim ."
alias lv="lvim ."
# alias datagrip=~/.jetbrainscmds/datagrip
alias e="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=2"
alias e1="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=1"
alias e2="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=2"
alias e3="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=3"
alias ea="exa -lTx --icons --git --time=modified --time-style=default -h --octal-permissions"


#Eval section for: 
#zoxide; https://github.com/ajeetdsouza/zoxide and 
#fig: https://fig.io/  
eval "$(zoxide init zsh)"
#
 #Fig post block. Keep at the bottom of this file.
eval $(thefuck --alias)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
