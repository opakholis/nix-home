{
  pkgs,
  lib,
  ...
}: {
  # https://daiderd.com/nix-darwin/manual/index.html#opt-networking.knownNetworkServices
  networking = {
    knownNetworkServices = [
      "Wi-Fi"
      "USB 10/100/1000 LAN"
    ];
    dns = [
      "127.0.0.1"
    ];
  };

  # https://daiderd.com/nix-darwin/manual/index.html#opt-launchd.daemons._name_.serviceConfig
  # https://dnscrypt.info/
  launchd.daemons.dnscrypt-proxy = {
    serviceConfig.RunAtLoad = true;
    serviceConfig.KeepAlive = true;
    serviceConfig.StandardOutPath = "/tmp/launchd-dnscrypt.log";
    serviceConfig.StandardErrorPath = "/tmp/launchd-dnscrypt.error";
    serviceConfig.ProgramArguments = [
      "${pkgs.dnscrypt-proxy2}/bin/dnscrypt-proxy"
      "-config"
      (lib.trivial.pipe ./../shared/config/dnscrypt-proxy.toml [
        builtins.readFile
        (pkgs.writeText "dnscrypt-proxy.toml")
        toString
      ])
    ];
  };
}
