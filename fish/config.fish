if status --is-login; and status --is-interactive
  # PATH settings
  # GNU utils
  set -x PATH /usr/local/opt/{coreutils,findutils,grep,gnu-sed,gnu-time,make,gnu-units}/libexec/gnubin $PATH
  # Curl
  set -x PATH /usr/local/opt/curl/bin $PATH
  # Use installed LLVM tools
  set -x PATH /usr/local/opt/llvm/bin $PATH
  # Rust
  set -x PATH $HOME/.cargo/bin $PATH
  # GO
  set -x GOPATH $HOME/stripe/go
  set -x PATH $GOPATH/bin $PATH
end
