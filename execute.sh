#!/bin/bash

cat music.txt | ./main.byte && abc2midi ./output.abc && timidity ./output1.mid