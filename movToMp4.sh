#!/bin/bash

newest_mov=$(ls -t *.mov | head -1)

if [ -n "$newest_mov" ]; then
	filename=$(basename "$newest_mov")
	ffmpeg -i "$newest_mov" -qscale 0 "${filename}.mp4"
	echo "Converted $newest_mov to ${filename}.mp4"
	rm "$newest_mov"
	echo "Deleted original mov file."
	open -R "${filename}.mp4"
else
	echo "No *mov found in the current directory."
fi
