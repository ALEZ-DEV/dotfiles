{ config, pkgs, ... }:

{
  networking.hostName = config.hostname;

  #networking.wireless.iwd.settings = {
  #  Network = {
  #    EnableIPv6 = true;
  #  };
  #  Settings = {
  #    AutoConnect = true;
  #  };
  #};

  networking.networkmanager = {
    enable = true;
    #wifi.backend = "iwd";
    };

  networking.extraHosts =
  ''
    0.0.0.0 overseauspider.yuanshen.com
    0.0.0.0 log-upload-os.hoyoverse.com

    0.0.0.0 log-upload.mihoyo.com
    0.0.0.0 uspider.yuanshen.com
    0.0.0.0 sg-public-data-api.hoyoverse.com

    0.0.0.0 prd-lender.cdp.internal.unity3d.com
    0.0.0.0 thind-prd-knob.data.ie.unity3d.com
    0.0.0.0 thind-gke-usc.prd.data.corp.unity3d.com
    0.0.0.0 cdp.cloud.unity3d.com
    0.0.0.0 remote-config-proxy-prd.uca.cloud.unity3d.com

    0.0.0.0 pc.crashsight.wetest.net

    0.0.0.0 apm-log-upload-os.hoyoverse.com
    0.0.0.0 zzz-log-upload-os.hoyoverse.com
  '';

  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      53317 # for localsend
    ];

    trustedInterfaces = [ "virbr0" ];
  };
}
