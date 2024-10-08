allConfig@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  home-manager.users.${username} = {
    programs.plasma = {
      panels = [
        # Dock
        {
          alignment = "center";
          floating = true;
          height = 70;
          hiding = "dodgewindows";
          lengthMode = "fit";
          location = "bottom";
          screen = "all";
          widgets = [
            {
              iconTasks = {
                appearance = {
                  fill = false;
                  highlightWindows = true;
                  iconSpacing = "normal";
                  indicateAudioStreams = true;
                  rows = {
                    multirowView = "never";
                    maximum = null;
                  };
                  showTooltips = true;
                };
                behavior = {
                  grouping = {
                    clickAction = "showPresentWindowsEffect";
                    method = "byProgramName";
                  };
                  middleClickAction = "newInstance";
                  minimizeActiveTaskOnClick = true;
                  newTasksAppearOn = "right";
                  showTasks = {
                    onlyInCurrentActivity = true;
                    onlyInCurrentDesktop = true;
                    onlyMinimized = false;
                    onlyInCurrentScreen = false;
                  };
                  sortingMethod = "manually";
                  unhideOnAttentionNeeded = true;
                  wheel = {
                    ignoreMinimizedTasks = true;
                    switchBetweenTasks = true;
                  };
                };
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "preferred://browser"
                ];
              };
            }
            "org.kde.plasma.marginsseparator"
            {
              plasmusicToolbar = {
                musicControls = {
                  showPlaybackControls = true;
                  volumeStep = 1;
                };
                panelIcon = {
                  albumCover = {
                    useAsIcon = false;
                    radius = 8;
                  };
                  icon = "view-media-track";
                };
                preferredSource = "any";
                songText = {
                  displayInSeparateLines = true;
                  maximumWidth = 600;
                  scrolling = {
                    behavior = "alwaysScrollExceptOnHover";
                    enable = true;
                    resetOnPause = true;
                    speed = 3;
                  };
                };
              };
            }
          ];
        }
        # Top panel
        {
          alignment = "right";
          floating = false;
          height = 30;
          hiding = "none";
          lengthMode = "fill";
          location = "top";
          screen = "all";
          widgets = [
            {
              kickoff = {
                applicationsDisplayMode = "list";
                compactDisplayStyle = false;
                favoritesDisplayMode = "grid";
                icon = "nix-snowflake";
                label = null;
                pin = false;
                showActionButtonCaptions = true;
                showButtonsFor = "power";
                sidebarPosition = "right";
                sortAlphabetically = true;
              };
            }
            # {
            #   name = "org.kde.plasma.appmenu";
            #   config.Appearance.compactView = false;
            # }
            {
              name = "org.kde.plasma.panelspacer";
              config.General = {
                expanding = true;
                lenght = -1;
              };
            }
            {
              name = "org.kde.plasma.pager";
            }
            {
              name = "org.kde.plasma.marginsseparator";
            }
            {
              systemTray = {
                icons = {
                  scaleToFit = true;
                  spacing = "medium";
                };
                pin = false;
              };
            }
            {
              digitalClock = {
                calendar = {
                  firstDayOfWeek = "sunday";
                  plugins = [
                    "holidaysevents"
                  ];
                };
                # date = {
                #   enable = true;
                #   format = "shortDate";
                #   position = "adaptiveLocation";
                # };

                # font = {
                #   bold = false;
                #   family = "Inter";
                #   italic = false;
                #   size = 12;
                #   weight = 400;
                # };
                time = {
                  format = "12h";
                  showSeconds = "always";
                };
                timeZone = {
                  alwaysShow = false;
                  changeOnScroll = false;
                  lastSelected = "America/New_York";
                  selected = [
                    "America/New_York"
                    "UTC"
                  ];
                };
              };
            }
          ];
        }
      ];
    };
  };
}