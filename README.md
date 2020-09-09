[![Build Status](https://travis-ci.org/gugsrs/tmux-spotify-info.svg?branch=master)](https://travis-ci.org/gugsrs/tmux-spotify-info)
# tmux-spotify-info

Show current spotify track artist and name on tmux status bar.

![](https://github.com/gugsrs/tmux-spotify-info/blob/master/screenshot/screenshot.png)

## Instalation
### Using Tmux Plugin Manager

Add plugin to the list of plugins at the end of `tmux.conf`:
```
set -g @plugin 'gugsrs/tmux-spotify-info'
```

## Usage
```
set -g status-right "#{spotify-info}"
```

## License
MIT
