#!/bin/bash

mkdir /home/gaus
mkdir /home/gaus/dataset
mkdir /home/gaus/prepared-frames
mkdir /home/gaus/prepared-frames/input
for i in /workspace/video/*; \
do ffmpeg -i "$i" -qscale:v 1 -qmin 1 -vf fps="$ENV_FRAME_TO_SEC" /home/gaus/prepared-frames/input/%04d.jpg; \
done

time python3 /gaussian-splatting/convert.py -s /home/gaus/prepared-frames/
time 7z a -tzip /workspace/"$FILE_NAME"_"$ENV_FRAME_TO_SEC"frames.zip /home/gaus/prepared-frames/ -xr!input

rm -rf /home/gaus/
echo "it's DONE! see:" "$FILE_NAME"_"$ENV_FRAME_TO_SEC"frames.zip
#
#
#