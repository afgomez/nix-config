_: {
  system.defaults = {
    LaunchServices.LSQuarantine = false; # Disable quarantine for downloaded apps

      NSGlobalDomain = {
        # Tweak the key repeat
        InitialKeyRepeat = 15;
        KeyRepeat = 1;

        "com.apple.keyboard.fnState" = true; # Use standard function keys
        "com.apple.mouse.tapBehavior" = 1;   # Enable tap to click

        # Disable writing substitutions
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;

        # Expand save panel by default
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;

        # Expand print panel by default
        PMPrintingExpandedStateForPrint = true;          
        PMPrintingExpandedStateForPrint2 = true;

        AppleInterfaceStyleSwitchesAutomatically = true; # Automatically switch between light and dark mode
        ApplePressAndHoldEnabled = false;                # Disable 'press-and-hold'
        NSDisableAutomaticTermination = false;           # Disable automatic termination of apps
        NSDocumentSaveNewDocumentsToCloud = false;       # Save documents locally
      };

    # Require screensaver password immediately
    screensaver = {
      askForPassword = true;         
      askForPasswordDelay = 0;
    };

    finder = {
      FXPreferredViewStyle = "clmv";          # Prefer column view
      FXEnableExtensionChangeWarning = false; # Disable the warning when changing an extension
      ShowStatusBar = true;                   # Show status bar
    };

    dock = {
      # Icon size and magnification
      magnification = true;
      tilesize = 48;
      largesize = 64;

      autohide = true;                     # Automatically hide the dock
      minimize-to-application = true;      # Minimize windows to the application icon
      show-process-indicators = true;      # Show a dot underneath open apps
      show-recents = false;                # Don't show recent apps
      persistent-others = ["~/Downloads"]; # Show Downloads folder
    };

    CustomUserPreferences = {
      "com.apple.finder" = {
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
      };
      "com.apple.desktopServices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUsbStores = true;
      };
      "com.apple.print.PrintingPrefs" = {
        "Quit When Finished" = true;
      };
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

}
