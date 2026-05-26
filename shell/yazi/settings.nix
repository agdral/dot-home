{
  mgr = {
    show_hidden = true;
    show_symlink = true;
    sort_by = "natural";
    title_format = "";
    sort_sensitive = false;
    sort_dir_first = true;
  };

  plugin = {
    prepend_preloaders = [
      {
        mime = "/mnt/kael/data/Music/Lossless/**";
        run = "exifaudio";
      }
    ];
    prepend_previewers = [
      {
        mime = "audio/*";
        run = "exifaudio";
      }
      {
        mime = "application/epub+zip";
        run = "epub-preview";
      }
      {
        mime = "application/bittorrent";
        run = "torrent-preview";
      }
    ];
  };
}
