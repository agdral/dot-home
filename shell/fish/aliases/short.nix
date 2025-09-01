{
  programs.fish.functions = {
    wake-arch = "wakeonlan 30:9c:23:41:20:20";
    wake-argon = "wakeonlan fc:aa:14:5b:8d:81";

    ssh-arch = "mosh argonarch@agdral fish";
    ssh-aragon = "mosh argonarch@argon fish";
    ssh-boro = "mosh --ssh='ssh -p 47256' root@boro fish";

    sshfs-boro = "sshfs root@boro:/root /mnt -p 47256";

    rk-argon = "ssh -t argonarch@argon rkvm-client /etc/rkvm/rkvm-client.toml";
    rk-arch = "ssh -t argonarch@agdral rkvm-client /etc/rkvm/rkvm-client.toml";

    vnc-argon = "vncviewer --ViewOnly --DotWhenNoCursor=1 argon";
    vnc-arch = "vncviewer --ViewOnly --DotWhenNoCursor=1 agdral";
  };
}
