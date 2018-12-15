#!/bin/bash

# pandoc -t revealjs -s -o rust-ffi.html rust-ffi.md -V revealjs-url=http://127.0.0.1:9090 -V theme=solarized
pandoc -t revealjs \
    -s -o keynote.html \
    keynote.md \
    -V revealjs-url=template \
    -V theme=moon
echo "$USER, y u no use \`make slides\`?"
make slides
