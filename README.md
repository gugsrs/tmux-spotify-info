[![Build Status](https://travis-ci.org/gugsrs/tmux-spotify-mac.svg?branch=master)](https://travis-ci.org/gugsrs/tmux-spotify-mac)
# tmux-spotify-mac

Show current spotify track artist and name on tmux status bar. Only for MacOS.

![](https://github.com/gugsrs/tmux-spotify-mac/blob/master/screenshot/screenshot.png)

## Instalation
### Using Tmux Plugin Manager

Add plugin to the list of plugins at the end of `tmux.conf`:
```
set -g @plugin 'gugsrs/spotify-info-mac'
```

## Usage
```
set -g status-right "#{spotify-info}"
```

## License
MIT
