# rust and cargo
. "$HOME/.cargo/env"

# avoid https://github.com/rust-analyzer/rust-analyzer/issues/4172
# NOTE: Has to be defined after PATH update to locate .cargo directory.
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Path to your oh-my-zsh installation.
export ZSH="/Users/luke.caradine/.oh-my-zsh"

# n = node package manager
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# gcp gke-auth setting
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

## binaries
#export PATH="/usr/local/opt/mysql-client/bin:$PATH"
#export PATH="/usr/local/bin/rg:$PATH"
#export PATH="/usr/local/bin/fzf:$PATH"
#export PATH="/usr/local/bin/bat:$PATH"

## pnpm
export PNPM_HOME="/Users/luke.caradine/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
## pnpm end


## pipx setting Created by `pipx` on 2021-04-14 08:16:21
#export PATH="$PATH:/Users/luke.caradine/.local/bin"

# go 
export GOBIN="$HOME/go/bin"
export GOPATH="/Users/luke.caradine/go"
export PATH="$PATH:$GOPATH/bin"

# bat(1) 
export BAT_THEME="ansi"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf to ripgrep config 
export FZF_DEFAULT_COMMAND='rg --files'

# zoxide config
export _ZO_FZF_OPTS=$FZF_DEFAULT_COMMAND

