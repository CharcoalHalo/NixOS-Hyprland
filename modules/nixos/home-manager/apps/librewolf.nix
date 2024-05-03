{ pkgs, userSettings, ... }:
{
  programs.librewolf.enable = true;
  
  home.file.".librewolf/librewolf.overrides.cfg".text = ''
    defaultPref("identity.fxaccounts.enabled", true);     
    
    defaultPref("browser.safebrowsing.malware.enabled", true);
    defaultPref("browser.safebrowsing.phishing.enabled", true);
    defaultPref("browser.safebrowsing.blockedURIs.enabled", true);                 
    defaultPref(
      "browser.safebrowsing.provider.google4.updateURL",
      "https://safebrowsing.googleapis.com/v4/threatListUpdates:fetch?$ct=application/x-protobuf&key=%GOOG>
    );
    defaultPref(
      "browser.safebrowsing.provider.google.gethashURL",
      "https://safebrowsing.google.com/safebrowsing/gethash?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION%&>
    );
    defaultPref(
      "browser.safebrowsing.provider.google.updateURL",
      "https://safebrowsing.google.com/safebrowsing/downloads?client=SAFEBROWSING_ID&appver=%MAJOR_VERSION>
    );
    defaultPref("browser.safebrowsing.downloads.enabled", true);

    defaultPref("privacy.clearOnShutdown.history", false);
    defaultPref("privacy.clearOnShutdown.downloads", false);
    defaultpref("privacy.clearOnShutdown.cookies",false);

    pref("browser.toolbars.bookmarks.visibility","always");

    defaultPref("middlemouse.paste", false);
    defaultPref("general.autoScroll", true);
  '';
}