{ ... }:
{
  # https://daiderd.com/nix-darwin/manual/index.html#opt-networking.knownNetworkServices
  networking = {
    knownNetworkServices = [
      "Wi-Fi"
      "USB 10/100/1000 LAN"
    ];
    dns = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
