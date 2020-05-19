function screencap
  ffmpeg -f avfoundation -i "1:0" output.mkv
end