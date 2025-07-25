#!/bin/bash

function moveFiles {
find "$1" \( -iname "*.pdf" \) -exec mv {} "$XDG_DOCUMENTS_DIR/PDFs" \;
find "$1" \( -iname "*.xlsx" -o -iname "*.ods" \) -exec mv {} "$XDG_DOCUMENTS_DIR/Excel" \;
find "$1" \( -iname "*.pptx" -o -iname "*.odg" -o -iname "*.odp" \) -exec mv {} "$XDG_DOCUMENTS_DIR/Diapositivas" \;
find "$1" \( -iname "*.docx" -o -iname "*.odt" \) -exec mv {} "$XDG_DOCUMENTS_DIR/Documentos" \;
find "$1" \( -iname "*.epub" \) -exec mv {} "$XDG_DOCUMENTS_DIR/Books/Nuevos" \;
find "$1" \( -iname "*.csv" \) -exec mv {} "$XDG_DOCUMENTS_DIR/Datasets" \;

find "$1" \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -exec mv {} "$XDG_PICTURES_DIR/Images" \;
find "$1" \( -iname "*.penpot" \) -exec mv {} "$XDG_PICTURES_DIR/Penpot" \;

find "$1" \( -iname "*.flac" -o -iname "*.m4a" \) -exec mv {} "$XDG_MUSIC_DIR/Optimus" \;
find "$1" \( -iname "*.mp3" \) -exec mv {} "$XDG_MUSIC_DIR/Discape" \;
find "$1" \( -iname "*.mp4" \) -exec mv {} "$XDG_VIDEOS_DIR" \;

find "$1" \( -iname "*.zip" -o -iname "*.gz" -o -iname "*.tar" -o -iname "*.deb" -o -iname "*.apk" -o -iname "*.rpm" \) -exec mv {} "/hdd/kael/Comprimidos" \;

find "$1" \( -iname "*.ipynb" \) -exec mv {} "/hdd/falcon/Proyectos/Jupyter/Nuevos" \;

find "$1" \( -iname "*.exe"  -o -iname "*.msi" \) -exec mv {} "/hdd/arch/Exes" \;
}

moveFiles "$XDG_DOWNLOAD_DIR"
moveFiles "/hdd/arch/Descargas"

