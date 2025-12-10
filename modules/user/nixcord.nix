{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    quickCss = "some CSS";
    config = {
      useQuickCss = true;
      frameless = true;
      plugins = {
        ignoreActivities = {
          enable = true;
          ignorePlaying = false;
          ignoreWatching = true;
        };
        anonymiseFileNames = {
          enable = true;
          method = 0;
          randomisedLength = 10;
        };
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        callTimer = {
          enable = true;
          format = "human";
        };
        clearUrLs.enable = true;
        copyFileContents.enable = true;
        copyUserUrLs.enable = true;
        fixImagesQuality.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        imageLink.enable = true;
        imageZoom.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLogger.enable = true;
        noBlockedMessages.enable = true;
        permissionsViewer.enable = true;
        pinDMs.enable = true;
        relationshipNotifier.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        typingTweaks.enable = true;
        unlockedAvatarZoom.enable = true;
      };
    };
  };
}
