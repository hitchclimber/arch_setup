#!/bin/zsh

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export XDG_DATA_HOME="$HOME/.local/share"
export XINITRC="$HOME/.xinitrc"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export ANDROID_HOME="/opt/android-sdk/"
export LIBVA_DRIVER_NAME="nvidia"


export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$ANDROID_HOME:$HOME/.local/src/emsdk:$HOME/.local/src/emsdk/upstream/emscripten"
export RUST_SRC_PATH="/home/michael/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"


# LF:
export LF_COLORS="\
~/Documents=01;96:\
~/Downloads=01;96:\
~/.local/share=01;31:\
~/.config/lf/lfrc=31:\
.gitignore=:\
.git/=01;92:\
.git*=92:\
*Makefile=92:\
README.*=93:\
*.txt=94:\
*.md=94:\
ln=01;96:\
di=01;94:\
ex=01;92:\
"
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=:\
or=❌:\
ex=🎯:\
.gitignore=:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=:\
*.jpe=:\
*.jpeg=:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=:\
*.java=:\
*.rs=:\
*.c=:\
*.cpp=:\
*.vim=:\
*.js=:\
*.Dockerfile=:\
*.dockerfile=:\
*.py=:\
*.pyx=:\
*.pyi=:\
*.json=:\
"

