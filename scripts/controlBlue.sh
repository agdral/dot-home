#!/bin/bash
PowerSamsung() { 
  echo '{"dispositivos": [{"tipo":1,"modo":2,"id":0}]}' | tio -b 38400 /dev/rfcomm0
}
PowerSony() { 
  local modo="$1" 
  echo '{"dispositivos": [{"tipo":2,"modo":'"$modo"',"id":0}]}' | tio -b 38400 /dev/rfcomm0
}
PowerShot() { 
  local modo="$1" 
  echo '{"dispositivos": [{"tipo":1,"modo":'"$modo"',"id":0},{"tipo":2,"modo":'"$modo"',"id":0}] }' | tio -b 38400 /dev/rfcomm0
}

PowerAll() { 
  local modo="$1" 
  echo '{"dispositivos": [{"tipo":1,"modo":'"$modo"',"id":0},{"tipo":2,"modo":'"$modo"',"id":0},{"tipo":0,"modo":'"$modo"',"id":1}] }' | tio -b 38400 /dev/rfcomm0
}

PowerFaro() { 
  local modo="$1" 
  echo '{"dispositivos": [{"tipo":0,"modo":'"$modo"',"id":0}]}' | tio -b 38400 /dev/rfcomm0
}
PowerLuz() { 
  local modo="$1" 
  echo '{"dispositivos": [{"tipo":0,"modo":'"$modo"',"id":1}]}' | tio -b 38400 /dev/rfcomm0
}
PowerVenti() { 
  local modo="$1" 
  echo '{"dispositivos": [{"tipo":0,"modo":'"$modo"',"id":3}]}' | tio -b 38400 /dev/rfcomm0
}

case "$1" in
  PowerSamsung) PowerSamsung "$2";;
  PowerSony) PowerSony "$2";; 
  PowerShot) PowerShot "$2";;
  PowerAll) PowerAll "$2";; 
  PowerFaro) PowerFaro "$2";;
  PowerLuz) PowerLuz "$2";;
  PowerVenti) PowerVenti "$2";;
esac
