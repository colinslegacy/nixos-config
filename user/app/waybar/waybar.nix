{ pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-left = 0;
        margin-right = 0;
        spacing = 8;
        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock"  ];
        modules-right = ["idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "hyprland/language" "battery" "battery#bat2" "tray" "custom/notification"];
        
        "hyprland/workspaces" = {
          disable-scroll = true;
          warp-on-scroll = false;
          format = "{icon}";
          format-icons = {
            "11" = "1";
            "12" = "2";
            "13" = "3";
            "14" = "4";
            "15" = "5";
            "16" = "6";
            "17" = "7";
            "18" = "8";
            "19" = "9";
            "20" = "10";
          };
        };
        
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        
        tray = {
          # "icon-size"= 21;
          spacing = 10;
        };
        
        clock = {
          format = "{:%I:%M %p | %m/%d/%Y}";
          tooltip = false;
        };
        
        cpu = {
          format = "{usage}% CPU";
          tooltip = false;
        };
        
        memory = {
          format = "{}% RAM";
        };
        
        temperature = {
          # "thermal-zone" = 2;
          # "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # "format-critical" = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [];
        };
        
        backlight = {
          # "device"= "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["LCD"];
        };
        
        battery = {
          states = {
            # "good" = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}%";
          format-plugged = "{capacity}%";
          format-alt = "{time} {icon}";
          # "format-good" = ""; # An empty format will hide the module
          # "format-full" = "";
          format-icons = ["JUICE"];
        };
        
        "battery#bat2" = {
          bat = "BAT2";
        };
        
        network = {
          # "interface"= "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} 🌐";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        
        pulseaudio = {
          # "scroll-step"= 1; # %; can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            "headphone" = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "alacritty -e pulsemixer";
        };
        
        "hyprland/window" = {
          max-length = 54;
        };

        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "🔔<span foreground='red'><sup>●</sup></span>";
            none = "🔔";
            dnd-notification = "🔕<span foreground='red'><sup>●</sup></span>";
            dnd-none = "🔕";
            inhibited-notification = "🔔<span foreground='red'><sup>●</sup></span>";
            inhibited-none = "🔔";
            dnd-inhibited-notification = "🔕<span foreground='red'><sup>●</sup></span>";
            dnd-inhibited-none = "🔕";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1; swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    };

    #
    #  This would be more brownish, Monokai variation: background: rgba(44, 37, 37, 0.8);
    #  This is more tomorrow night: background rgba(29,31,33, 0.8);
    # This is more minty: background 105,181,63
    # 
    style = ''
       * {
         border: none;         
         font-family: 'JetBrainsMono Nerd Font', monospace;
         font-size: 14px;
         font-weight: normal;
         color: #c5c8c6;
         border-radius: 12px;
         font-weight: bold;
       }

       window#waybar {
         background: rgba(29,31,33, 0.55);         
         transition-property: background-color;
         transition-duration: .5s;         
      }
      
      .modules-right {         
         background: rgba(29,31,33, 0.6);
         margin: 2px 0 0 0;
         padding-left: 4px;
         padding-right: 15px;
         
      }

      .modules-center {
         background: rgba(29,31,33, 0.6);
         margin: 2px 6px 0 0;
         padding-left: 4px;
         padding-right: 4px;
         
      }


      .modules-left {
         background: rgba(29,31,33, 0.6);
         margin: 2px 6px 0 0;
         padding-left: 4px;
         padding-right: 4px;
         
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #temperature,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #custom-power,
      #custom-menu,
      #idle_inhibitor {
          padding: 0 10px;
      }

      #clock { font-weight: bold; }

      #workspaces button {
        font-size: large;
        font-weight: bold;
      }

      #workspaces button.active {
        background: rgba(21, 101, 192, 0.9);
        color: #1d1f21;
      }

      #custom-notification {
        font-family: "NotoSansMono Nerd Font";
        font-size: 14px;
      }

     '';
    
  };
  
}
