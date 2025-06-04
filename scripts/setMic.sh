sleep 5
pactl set-default-sink alsa_output.pci-0000_38_00.6.analog-stereo

pactl unload-module module-echo-cancel 

pactl load-module module-null-sink media.class=Audio/Sink sink_name=Sink_Murmur channel_map=stereo

pactl load-module module-echo-cancel sink_master=alsa_output.pci-0000_38_00.6.analog-stereo use_master_format=1 aec_method=webrtc aec_args="analog_gain_control=0\ digital_gain_control=1\ noise_suppression=1" source_name=echoCancel_source sink_name=echoCancel_sink

pactl load-module module-null-sink media.class=Audio/Source/Virtual sink_name=Virtual_Mic channel_map=front-left,front-right

pactl set-default-sink echoCancel_sink
pactl set-default-source "Virtual_Mic" 

sleep 2
pw-link Sink_Murmur:monitor_FL "Echo-Cancel Capture":input_FL
pw-link Sink_Murmur:monitor_FR "Echo-Cancel Capture":input_FR

pw-link -d Virtual_Mic:capture_FL echo-cancel-capture:input_FL
pw-link -d Virtual_Mic:capture_FR echo-cancel-capture:input_FR

noisetorch -u
noisetorch -i -s "echoCancel_source" -t 80

sleep 1 

name_link_fl=$(pw-link -o | grep input.filter | grep FL) 
name_link_fr=$(pw-link -o | grep input.filter | grep FR)
pw-link $name_link_fl Virtual_Mic:input_FL
pw-link $name_link_fr Virtual_Mic:input_FR
mumble "mumble://192.168.0.50" -platform offscreen &

pactl set-default-source "NoiseTorch Microphone for Echo-Cancel Source" 

