# .config

My preferred shell of choice, fish, stores all configuration files, commonly
known as “dotfiles”, in a folder called ".config". This is my .config folder.

## fish

Plugin manager: fisher

### Changing shell to fish

```
brew install fish
echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish
```

Also enable secure text entry, a line cursor, and blinking.

## Bootstrapping a new mac

### Applications I use

- 1Password
- Alfred
- Backblaze
- Bartender 3
- Caffeine
- Canary Mail
- cd to
- DaisyDisk
- Day One
- Figma
- Firefox
- iStat Menus
- Kaleidoscope
- Pixelmator
- Reeder
- Scroll Reverser
- Sketch
- Slack
- Soulver
- The Unarchiver
- Things
- Tower
- Transmission
- Transmit
- Trello
- Tweetbot
- Visual Studio Code
- VLC
- Xcode
- XLD

## Adobe DNG Converter

```
ln -s "/Applications/Adobe DNG Converter.app/Contents/MacOS/Adobe DNG Converter" dng-converter
```
