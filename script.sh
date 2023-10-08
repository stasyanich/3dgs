#!/bin/bash
VIDEO_FILE_NAME=""

VIDEO_FOLDER=/workspace/video
MAIN_DIR=/home/gaus/prepared-frames

mkdir -p "${MAIN_DIR}"/input
cd "${VIDEO_FOLDER}"/ || exit 1
for file in *; \
do VIDEO_FILE_NAME+="$file"_ && ffmpeg -i "$file" -qscale:v 1 -qmin 1 -vf fps="${ENV_FRAME_TO_SEC}" "${MAIN_DIR}"/input/"$file"_%04d.jpg; \
done

RESULT_FILE="${VIDEO_FILE_NAME}"_"${ENV_FRAME_TO_SEC}"_frames_colmapped.zip

time python3 /gaussian-splatting/convert.py -s "${MAIN_DIR}"/
time 7z a -tzip /workspace/"${RESULT_FILE}" "${MAIN_DIR}"/. -xr!input

rm -rf /home/gaus/
echo "it's DONE! see:" "${RESULT_FILE}"
#
#
#