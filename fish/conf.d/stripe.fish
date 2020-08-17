if status --is-login; and status --is-interactive; and test -e $HOME/.stripeproxy
  # Aliases
  alias stripe='cd ~/stripe'
  alias pay-server='cd ~/stripe/pay-server'
  alias uppsala='cd ~/stripe/uppsala'

  # Add the stripe tools paths
  set -x PATH $HOME/stripe/space-commander/bin $PATH
  set -x PATH $HOME/stripe/password-vault/bin $PATH
  set -x PATH $HOME/stripe/henson/bin $PATH
  set -x PATH $HOME/.rbenvs/shims $PATH
  set -x PATH $HOME/.rbenvs/bin $PATH

  # Activate the space-commander env
  source (rbenv init -|psub)
  source (nodenv init -|psub)
  source $HOME/stripe/space-commander/bin/sc-env-activate.fish
end
