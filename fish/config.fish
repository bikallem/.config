if status --is-login; and status --is-interactive
  # Aliases
  # TODO: is there a better place to put these?
  alias config='cd ~/.config'
  alias stripe='cd ~/stripe'
  alias pay-server='cd ~/stripe/pay-server'
  alias uppsala='cd ~/stripe/uppsala'
  alias ls='exa'

  # PATH settings
  # GNU utils
  set -x PATH /usr/local/opt/{coreutils,findutils,grep,gnu-sed,gnu-time,make,gnu-units}/libexec/gnubin $PATH
  # Curl
  set -x PATH /usr/local/opt/curl/bin $PATH
  # Use installed LLVM tools
  set -x PATH /usr/local/opt/llvm/bin $PATH
end
