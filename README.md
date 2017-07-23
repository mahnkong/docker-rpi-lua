# docker-rpi-lua - Docker image for Lua (5.3) on a raspberrypi
![Travis build status](https://api.travis-ci.org/mahnkong/docker-rpi-lua.svg?branch=master)

## Usage

A typical invocation of the container would be:

```
docker run -ti --rm -v $PWD/myscript.lua:/myscript.lua mahnkong/docker-rpi-lua /myscript.lua
```
