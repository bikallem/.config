if status --is-login; and status --is-interactive
  set fish_cursor_default     block      blink
  set fish_cursor_insert      line       blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_visual      block

  # PATH settings
  # GNU utils
  set -x PATH /usr/local/opt/{coreutils,findutils,grep,gnu-sed,gnu-time,make,gnu-units}/libexec/gnubin $PATH
  # Curl
  set -x PATH /usr/local/opt/curl/bin $PATH
  # Rust
  set -x PATH $HOME/.cargo/bin $PATH
end
