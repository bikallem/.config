if status --is-login; and status --is-interactive
  # Aliases
  # TODO: is there a better place to put these?
  alias config='cd ~/.config'
  alias stripe='cd ~/stripe'
  alias pay-server='cd ~/stripe/pay-server'
  alias uppsala='cd ~/stripe/uppsala'

  # PATH settings
  # GNU utils
  set -x PATH /usr/local/opt/{coreutils,findutils,grep,gnu-sed,gnu-time,make,gnu-units}/libexec/gnubin $PATH
  # Curl
  set -x PATH /usr/local/opt/curl/bin $PATH
  # Use installed LLVM tools
  set -x PATH /usr/local/opt/llvm/bin $PATH
  # Python
  set -x PATH "/usr/local/opt/python@3.8/bin" $PATH
  # Ruby
  set -x PATH /usr/local/lib/ruby/gems/2.7.0/bin /usr/local/opt/ruby/bin $PATH
  # Rust
  set -x PATH $HOME/.cargo/bin $PATH
end
