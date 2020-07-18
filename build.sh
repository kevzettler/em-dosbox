#! /usr/bin/bash

if ! command -v emcc &> /dev/null
then
    echo "emscripten not found"
    ~/code/emsdk/emsdk activate 1.39.5-fastcomp &&
    source ~/code/emsdk/emsdk_env.sh
    exit
fi

make clean &&
./autogen.sh &&
emconfigure ./configure --enable-wasm &&
make &&
cp src/dosbox.js src/dosbox.wasm ../radcab/dosbox/
