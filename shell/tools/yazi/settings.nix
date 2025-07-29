{...}: {
  programs.yazi.settings = {
    mgr = {
      show_hidden = true;
      show_symlink = true;
      sort_by = "natural";
      title_format = "";
      sort_sensitive = false;
      sort_dir_first = true;
    };

    opener = {
      edit = [
        {
          run = ''nohup neovide --wayland_app_id=neovide "$@" -- -c "cd $@" >/dev/null 2>&1 &'';
          desc = "Neovide";
          block = true;
          for = "unix";
        }
        {
          run = ''nohup code "$@" &'';
          desc = "Code";
          block = true;
          for = "unix";
        }
      ];
    };

    plugin = {
      prepend_preloaders = [
        {
          mime = "/hdd/kael/Musica/Music/**";
          run = "exifaudio";
        }
      ];
      prepend_previewers = [
        {
          mime = "audio/*";
          run = "exifaudio";
        }
        # Archive previewer
        {
          mime = "application/zip";
          run = "ouch";
        }
        {
          mime = "application/x-tar";
          run = "ouch";
        }
        {
          mime = "application/x-bzip2";
          run = "ouch";
        }
        {
          mime = "application/x-7z-compressed";
          run = "ouch";
        }
        {
          mime = "application/x-rar";
          run = "ouch";
        }
        {
          mime = "application/x-xz";
          run = "ouch";
        }
        {
          name = "*.md";
          run = "glow";
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
  };
}
