#!/bin/bash
cd "$XDG_DOWNLOAD_DIR" || exit
mv ./*pdf* ./*docx* ./*doc* ./*PDF* ./Documents
mv ./*png* ./*jpg* ./*jpeg* ./Images
mv ./*svg* ./Icons
mv ./*apk* /hdd/kael/Programs/Apks_Apps/
mv ./*excalidraw* ./Excalidraw
mv ./*mp4* ./*mkv* /hdd/kael/AudioVisual/
mv ./*epub* ./*glob*.mobi /hdd/kael/Documentos/Books/
mv ./*xlsx* /hdd/kael/Documentos/Excel/
mv ./*ttf* ./*glob*.woff ./Fonts/
mv ././*pptx* /hdd/kael/Documentos/Presetations/
mv ./*zip* ./*tar.gz* ./*tar.xz* ./*tar.zst* ./Files_Compress
mv ./*epub*.epub /hdd/kael/Documentos/Books

rm ./*rpm* ./*flatpakref* ./*deb*

