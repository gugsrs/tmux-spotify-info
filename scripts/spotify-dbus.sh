dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:"org.mpris.MediaPlayer2.Player" string:'Metadata' \
| grep -Ev "^method"                                            `# Ignore the first line.`               \
| grep -Eo '("(.*)")|(\b[0-9][a-zA-Z0-9.]*\b)'                  `# Filter interesting fiels.`            \
| sed -E '2~2 a|'                                               `# Mark odd fields.`                     \
| tr -d '\n'                                                    `# Remove all newlines.`                 \
| sed -E 's/\|/\n/g'                                            `# Restore newlines.`                    \
| sed -E 's/(xesam:)|(mpris:)//'                                `# Remove ns prefixes.`                  \
| sed -E 's/^"//'                                               `# Strip leading...`                     \
| sed -E 's/"$//'                                               `# ...and trailing quotes.`              \
| sed -E 's/"+/|/'                                              `# Regard "" as seperator.`              \
| sed -E 's/ +/ /g' | grep --color=never -E "(title)|(artist)"  `# Get artist and title lines`           \
| sed 's/^.*|//'                                                `# Remove artist and title placeholders` \
| sed 'N; s/\n/ - /'                                            `# Join track info lines`                \
