-- xmobar configuration file
--
-- Mess with this file to change the appearance of the contents of the status
-- bar which are not directly controlled by xmonad. You can see your changes
-- immediately by recompiling xmonad using "super-q".
--
-- There's a lot you can do here. Refer to "man xmobar".
--
-- Author: David Brewer
-- Repository: https://github.com/davidbrewer/xmonad-ubuntu-conf


Config {
  -- Set font and default foreground/background colors. Note that the height of
  -- xmobar is controlled by the font you use.
  font = "xft:Source Code Pro:size=12:antialias=true"
  , bgColor = "black"
  , fgColor = "grey"

  -- Position is top left, taking up 95% of screen. You are likely to have to
  -- tweak the width here based on the width of your screen to make it play
  -- nicely with stalonetray, which we want to be taking up the remainer of the
  -- space on the right side of your screen.
  , position = TopW L 95

  -- list of commands which gather information about your system for
  -- presentation in the bar.
  , commands = [ Run Cpu [ "-t"     , "Cpu:<total>"
                         , "-H"     , "50"
                         , "--high" , "red"] 10

               -- Gather and format memory usage information
               , Run Memory [ "-t", "Mem:<usedratio>"] 10

               -- Date formatting
               , Run Date "%b %d %H:%M" "date" 10

               -- Battery information. This is likely to require some
               -- customization based upon your specific hardware. Or, for a
               -- desktop you may want to jusqt remove this section entirely.
               , Run Battery [ "-t", "Bat:<left>"
                             , "--"
                             , "-p", "orange"
                             , "-O", "AC"
                             , "-i", "AC"
                             , "-o", "Bat"
                             , "-h", "green"
                             , "-l", "red"] 10

               -- To get volume information, we run a custom bash script. This
               -- is because the built-in volume support in xmobar is disabled
               -- in Debian and derivatives like Ubuntu.
               , Run Com "/bin/bash" ["-c", "~/programming/dotfiles/scripts/get-volume"] "myvolume" 10

               , Run Com "/bin/bash" ["-c", "~/programming/dotfiles/scripts/get-backlight"] "mybacklight" 10

               -- This line tells xmobar to read input from stdin. That's how we
               -- get the information that xmonad is sending it for display.
               , Run StdinReader ]

  -- Separator character used to wrape variables in the xmobar template
  , sepChar = "%"

  -- Alignment separater characer used in the xmobar template. Everything before
  -- this will be aligned left, everything after aligned right.
  , alignSep = "}{"

  -- Overall template for the layout of the xmobar contents. Note that space is
  -- significant and can be used to add padding.
  , template = "%StdinReader% }{ %cpu% %memory% Bri:%mybacklight% %battery% Vol:%myvolume% <fc=#e6744c>%date%</fc>     "
}
