let
  pagesWebs = [
    "https://web.whatsapp.com"
    "https://chat.deepseek.com"
    "https://drive.google.com/drive/u/0/home"
    "https://mail.proton.me"
    "https://calendar.proton.me"
  ];

  firefoxPages = builtins.concatStringsSep " " pagesWebs;
in [
  {
    key = "Escape";
    name = "mail";
    app = "thunderbird";
    class = "thunderbird";
  }
  {
    key = "U";
    name = "webs";
    app = "firefox -p secundary --name secundary ${firefoxPages}";
    class = "secundary";
  }
  {
    key = "Q";
    name = "pass_manager";
    app = "proton-pass";
    class = "Proton Pass";
  }
]
