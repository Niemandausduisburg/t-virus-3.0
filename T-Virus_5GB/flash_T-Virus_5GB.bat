@ECHO OFF
ECHO "                                   ___          __      __   __      __                     "
ECHO "|  | _| _ _  _  _  |_ _   |_|_  _   |  __ \  /||__)/  \(_     _)    /  \  | _  _|_ _ || _ _ "
ECHO "|/\|(-|(_(_)|||(-  |_(_)  |_| )(-   |      \/ || \ \__/__)   /__.   \__/  || )_)|_(_|||(-|  "
ECHO "                                                                                            "  
ECHO This will flash the T-Virus modification in order to 'treble' your device for custom treble ROMs.
timeout /t 5
cls
ECHO WARNING!
ECHO MAKE A BACKUP OF YOUR DATA!
ECHO ALL DATA WILL BE LOST AFTER FLASHING (FACTORY RESET)!
ECHO WE ACCEPT NO LIABILITY IF YOU LOSE DATA OR USE THIS TOOL INCORRECTLY!
timeout /t 10
cls

:ask1
ECHO Are you ready to flash T-VIRUS 2.0?
ECHO Yes [Y]
ECHO No [N]

choice /n /c:yn %1

IF ERRORLEVEL ==2 GOTO end
IF ERRORLEVEL ==1 GOTO ask2

:ask2
cls
ECHO Have you read the warnings and are you sure you want to proceed?
ECHO Yes [Y]
ECHO No [N]

choice /n /c:yn %1


IF ERRORLEVEL ==2 GOTO end
IF ERRORLEVEL ==1 GOTO ask3

:ask3
cls
ECHO Boot your device into fastboot, bootloader or download mode and connect it to your PC. Enter [f] when your device is in fastboot-mode and connected to your PC to proceed.
choice /n /c:f %1

:start
cls
ECHO Let's flash and get you infected xD
timeout /t 5
cls
ECHO Flashing T-VIRUS partition-table
fastboot flash partition:0 gpt_both0.bin
cls
ECHO Rebooting device into download mode. DO NOT disconnect your device!
fastboot reboot bootloader
timeout /t 5
cls
ECHO Flashing T-VIRUS
fastboot flash boot_a boot.img
fastboot flash boot_b boot.img
fastboot flash box box.bin
fastboot flash cda_a cda.img
fastboot flash cda_b cda.img
fastboot flash dsp_a dsp.bin
fastboot flash dsp_b dsp.bin
fastboot flash elabel elabel.bin
fastboot flash hidden_a hidden.img
fastboot flash hidden_b hidden.img
fastboot flash keystore keystore.bin
fastboot flash logdump logdump.bin
fastboot flash misc misc.bin
fastboot flash modem_a modem.img
fastboot flash modem_b modem.img
fastboot flash persist persist.bin
fastboot flash splash2 splash2.bin
fastboot flash ssd ssd.bin
fastboot flash sutinfo sutinfo.img
fastboot flash system_a system.img
fastboot flash system_b system.img
fastboot flash systeminfo_a systeminfo.img
fastboot flash systeminfo_b systeminfo.img
fastboot flash vendor_a vendor.img
fastboot flash vendor_b vendor.img
cls
ECHO Done xD
ECHO Switching to Slot A
fastboot --set-active=a
ECHO Formatting data
fastboot erase userdata
fastboot reboot
cls
ECHO "                ___-----------___                  "
ECHO "           __--~~                 ~~--__           "
ECHO "       _-~~                             ~~-_       "
ECHO "    _-~                                     ~-_    "
ECHO "  /                                           \    "
ECHO "  |                                             |  "
ECHO " |                                               | "
ECHO " |                                               | "
ECHO "|                                                 |"
ECHO "|                                                 |"
ECHO "|                                                 |"
ECHO " |                                               | "
ECHO " |  |    _-------_               _-------_    |  | "
ECHO " |  |  /~         ~\           /~         ~\  |  | "
ECHO "  ||  |             |         |             |  ||  "
ECHO "  || |               |       |               | ||  "
ECHO "  || |              |         |              | ||  "
ECHO "  |   \_           /           \           _/   |  "
ECHO " |      ~~--_____-~    /~V~\    ~-_____--~~      | "
ECHO " |                    |     |                    | "
ECHO "|                    |       |                    |"
ECHO "|                    |  /^\  |                    |"
ECHO " |                    ~~   ~~                    | "
ECHO "  \_         _                       _         _/  "
ECHO "    ~--____-~ ~\                   /~ ~-____--~    "
ECHO "         \     /\                 /\     /         "
ECHO "          \    | ( ,           , ) |    /          "
ECHO "           |   | (~(__(  |  )__)~) |   |           "
ECHO "            |   \/ (  (~~|~~)  ) \/   |            "
ECHO "            |   |  [ [  |  ] ]  /   |              "
ECHO "             |                     |               "
ECHO "               \                   /               "
ECHO "               ~-_             _-~                 "
ECHO "                   ~--___-___--~                   "
ECHO "                                                   "
ECHO "\ / _       _  _ _   . _  |` _  __|_ _  _|   _    _ _ _  _ _ |`   ||   "
ECHO " | (_)|_|  (_|| (/_  || |~|~(/_(_ | (/_(_|  _\|_|(_(_(/__\_\~|~|_|||\/."
ECHO "                                                                    /  "
ECHO "
ECHO Your device will boot into the ROM now. Enjoy xD
timeout /t 5

:end
exit