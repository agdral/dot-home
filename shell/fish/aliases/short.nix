{
  programs.fish.functions = {
    wake-arch = "wakeonlan 30:9c:23:41:20:20";
    wake-argon = "wakeonlan fc:aa:14:5b:8d:81";

    ssh-arch = "mosh argonarch@192.168.0.50 fish";
    ssh-aragon = "mosh argonarch@192.168.0.52 fish";
    ssh-boro = "mosh --ssh='ssh -p 47256' root@45.7.230.66 fish";

    sshfs-boro = "sshfs root@boro.agdral.ssh:/root /mnt -p 47256";

    rk-argon = "ssh -t argonarch@192.168.0.52 rkvm-client /etc/rkvm/rkvm-client.toml";
    rk-arch = "ssh -t argonarch@192.168.0.50 rkvm-client /etc/rkvm/rkvm-client.toml";

    vnc-argon = "vncviewer --ViewOnly --DotWhenNoCursor=1 192.168.0.52";
    vnc-arch = "vncviewer --ViewOnly --DotWhenNoCursor=1 192.168.0.50";
  };
}
