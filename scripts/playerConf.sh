#!/bin/bash

next() {
notify-send "Next" -i audio-volume-high-symbolic -h string:x-canonical-private-synchronous:player 
playerctl next
}

previous() {
notify-send "Previuos" -i audio-volume-high-symbolic -h string:x-canonical-private-synchronous:player
playerctl previous
}

play() {
playerctl play-pause
}

down() {
pamixer -d 10
volume=$(pamixer --get-volume)
#notify-send "Volume" "Decreasing to $volume%"  -i audio-volume-low-symbolic -h string:x-canonical-private-synchronous:volume
}

up() {
pamixer -i 10
#volume=$(pamixer --get-volume)  
#notify-send "Volume" "Increasing to $volume%" -i audio-volume-high-symbolic -h string:x-canonical-private-synchronous:volume
}

mute() {
muted="$(pamixer --get-mute)"
if $muted; then
  pamixer -u
  #notify-send "Volume" "Unmuted" -i audio-volume-high-symbolic -h string:x-canonical-private-synchronous:volume

else 
  pamixer -m
  #notify-send "Volume" "Muted" -i audio-volume-muted-symbolic -h string:x-canonical-private-synchronous:volume

fi
}

mute_mic(){
muted="$(pamixer --source "NoiseTorch Microphone for Virtual_Mic Audio/Source/Virtual sink" --get-mute)"
if $muted; then
  pamixer --source "NoiseTorch Microphone for Virtual_Mic Audio/Source/Virtual sink" -u
  #notify-send "Volume" "Mic Unmuted" -i audio-volume-high-symbolic -h string:x-canonical-private-synchronous:volume

else 
  pamixer --source "NoiseTorch Microphone for Virtual_Mic Audio/Source/Virtual sink" -m
  #notify-send "Volume" "Mic Muted" -i audio-volume-muted-symbolic -h string:x-canonical-private-synchronous:volume

fi

}

case "$1" in
  up) up;;
  down) down;;
  mute) mute;;
  mute_mic) mute_mic;;
  play) play;;
  previous) previous;;
  next) next;;
esac
