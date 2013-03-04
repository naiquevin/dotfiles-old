import XMonad
import XMonad.Util.Run
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ICCCMFocus
import XMonad.Config.Gnome

myManageHook = composeAll (
  [ className =? "Unity-2d-panel" --> doIgnore
  , className =? "Unity-2d-launcher" --> doFloat
  ])

main = 
  xmonad $ gnomeConfig { modMask = mod4Mask
                       , manageHook = manageDocks <+> myManageHook <+> manageHook gnomeConfig 
                       , layoutHook = avoidStruts $ layoutHook defaultConfig
                       , logHook = takeTopFocus
                       , normalBorderColor = "#7c7c7c"
                       , focusedBorderColor = "#ffb6b0"
                       } `additionalKeys` [ ((mod4Mask, xK_d), spawn "dmenu_run -b")
                                          , ((mod4Mask, xK_Return), spawn "xfce4-terminal")
                                          ]
