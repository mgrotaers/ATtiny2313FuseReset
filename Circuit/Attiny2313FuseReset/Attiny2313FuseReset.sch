EESchema Schematic File Version 4
LIBS:Attiny2313FuseReset-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ATTINY2313 HIGH VOLTAGE FUSE RESET"
Date "2021-09-23"
Rev "1.0.0"
Comp "M. GROTAERS"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2950 2700 1    60   ~ 0
Vin
Text Label 3350 2700 1    60   ~ 0
IOREF
Text Label 2900 3750 0    60   ~ 0
A0
Text Label 2900 3850 0    60   ~ 0
A1
Text Label 2900 3950 0    60   ~ 0
A2
Text Label 2900 4050 0    60   ~ 0
A3
Text Label 2900 4150 0    60   ~ 0
A4(SDA)
Text Label 2900 4250 0    60   ~ 0
A5(SCL)
Text Label 4550 4250 0    60   ~ 0
0(Rx)
Text Label 4550 4050 0    60   ~ 0
2
Text Label 4550 4150 0    60   ~ 0
1(Tx)
Text Label 4550 3950 0    60   ~ 0
3(**)
Text Label 4550 3850 0    60   ~ 0
4
Text Label 4550 3750 0    60   ~ 0
5(**)
Text Label 4550 3650 0    60   ~ 0
6(**)
Text Label 4550 3550 0    60   ~ 0
7
Text Label 4550 3350 0    60   ~ 0
8
Text Label 4550 3250 0    60   ~ 0
9(**)
Text Label 4550 3150 0    60   ~ 0
10(**/SS)
Text Label 4550 3050 0    60   ~ 0
11(**/MOSI)
Text Label 4550 2950 0    60   ~ 0
12(MISO)
Text Label 4550 2850 0    60   ~ 0
13(SCK)
Text Label 4550 2650 0    60   ~ 0
AREF
NoConn ~ 3400 2850
Text Label 4550 2550 0    60   ~ 0
A4(SDA)
Text Label 4550 2450 0    60   ~ 0
A5(SCL)
Text Notes 4900 2200 0    60   ~ 0
Holes
Text Notes 2550 1950 0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 3600 3150
F 0 "P1" H 3600 3600 50  0000 C CNN
F 1 "Power" V 3700 3150 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 3750 3150 20  0000 C CNN
F 3 "" H 3600 3150 50  0000 C CNN
	1    3600 3150
	1    0    0    -1  
$EndComp
Text Label 2650 3050 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 3150 2700
F 0 "#PWR01" H 3150 2550 50  0001 C CNN
F 1 "+3.3V" V 3150 2950 50  0000 C CNN
F 2 "" H 3150 2700 50  0000 C CNN
F 3 "" H 3150 2700 50  0000 C CNN
	1    3150 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 3050 2600
F 0 "#PWR02" H 3050 2450 50  0001 C CNN
F 1 "+5V" V 3050 2800 50  0000 C CNN
F 2 "" H 3050 2600 50  0000 C CNN
F 3 "" H 3050 2600 50  0000 C CNN
	1    3050 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 3300 4400
F 0 "#PWR03" H 3300 4150 50  0001 C CNN
F 1 "GND" H 3300 4250 50  0000 C CNN
F 2 "" H 3300 4400 50  0000 C CNN
F 3 "" H 3300 4400 50  0000 C CNN
	1    3300 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 4300 4400
F 0 "#PWR04" H 4300 4150 50  0001 C CNN
F 1 "GND" H 4300 4250 50  0000 C CNN
F 2 "" H 4300 4400 50  0000 C CNN
F 3 "" H 4300 4400 50  0000 C CNN
	1    4300 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 3600 3950
F 0 "P2" H 3600 3550 50  0000 C CNN
F 1 "Analog" V 3700 3950 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 3750 4000 20  0000 C CNN
F 3 "" H 3600 3950 50  0000 C CNN
	1    3600 3950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 4850 1850
F 0 "P5" V 4950 1850 50  0000 C CNN
F 1 "CONN_01X01" V 4950 1850 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 4771 1924 20  0000 C CNN
F 3 "" H 4850 1850 50  0000 C CNN
	1    4850 1850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 4950 1850
F 0 "P6" V 5050 1850 50  0000 C CNN
F 1 "CONN_01X01" V 5050 1850 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 4950 1850 20  0001 C CNN
F 3 "" H 4950 1850 50  0000 C CNN
	1    4950 1850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 5050 1850
F 0 "P7" V 5150 1850 50  0000 C CNN
F 1 "CONN_01X01" V 5150 1850 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 5050 1850 20  0001 C CNN
F 3 "" H 5050 1850 50  0000 C CNN
	1    5050 1850
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 5150 1850
F 0 "P8" V 5250 1850 50  0000 C CNN
F 1 "CONN_01X01" V 5250 1850 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 5074 1772 20  0000 C CNN
F 3 "" H 5150 1850 50  0000 C CNN
	1    5150 1850
	0    -1   -1   0   
$EndComp
NoConn ~ 4850 2050
NoConn ~ 4950 2050
NoConn ~ 5050 2050
NoConn ~ 5150 2050
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 4000 3850
F 0 "P4" H 4000 3350 50  0000 C CNN
F 1 "Digital" V 4100 3850 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 4150 3800 20  0000 C CNN
F 3 "" H 4000 3850 50  0000 C CNN
	1    4000 3850
	-1   0    0    -1  
$EndComp
Wire Notes Line
	2525 2025 3925 2025
Wire Notes Line
	3925 2025 3925 1675
Wire Wire Line
	3350 2700 3350 2950
Wire Wire Line
	3350 2950 3400 2950
Wire Wire Line
	3400 3150 3150 3150
Wire Wire Line
	3400 3250 3050 3250
Wire Wire Line
	3400 3550 2950 3550
Wire Wire Line
	3400 3350 3300 3350
Wire Wire Line
	3400 3450 3300 3450
Connection ~ 3300 3450
Wire Wire Line
	2950 3550 2950 2700
Wire Wire Line
	3050 3250 3050 2600
Wire Wire Line
	3150 3150 3150 2700
Wire Wire Line
	3400 3850 2900 3850
Wire Wire Line
	3400 3950 2900 3950
Wire Wire Line
	3400 4250 2900 4250
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 4000 2850
F 0 "P3" H 4000 3400 50  0000 C CNN
F 1 "Digital" V 4100 2850 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 4150 2850 20  0000 C CNN
F 3 "" H 4000 2850 50  0000 C CNN
	1    4000 2850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4200 2650 4550 2650
Wire Wire Line
	4200 2550 4550 2550
Wire Wire Line
	4200 2450 4550 2450
Wire Wire Line
	4200 2750 4300 2750
Wire Wire Line
	4300 2750 4300 4400
Wire Wire Line
	3300 3350 3300 3450
Wire Wire Line
	3300 3450 3300 4400
Wire Wire Line
	3400 3050 2650 3050
Text Notes 3700 2850 0    60   ~ 0
1
Wire Notes Line
	5250 2200 4750 2200
Wire Notes Line
	4750 2200 4750 1700
Wire Notes Line
	2500 1650 5250 1650
Wire Notes Line
	5250 1650 5250 4700
Wire Notes Line
	2500 1650 2500 4700
Wire Notes Line
	2500 4700 5250 4700
$Comp
L MCU_Microchip_ATtiny:ATtiny2313-20PU U1
U 1 1 614C0A26
P 9050 3250
F 0 "U1" H 9050 4528 50  0000 C CNN
F 1 "ATtiny2313-20PU" H 9050 4437 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 9050 3250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2543-AVR-ATtiny2313_Datasheet.pdf" H 9050 3250 50  0001 C CNN
	1    9050 3250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R RP1
U 1 1 614C1B5A
P 5650 2950
F 0 "RP1" V 5857 2950 50  0000 C CNN
F 1 "1K" V 5766 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 2950 50  0001 C CNN
F 3 "~" H 5650 2950 50  0001 C CNN
	1    5650 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RP2
U 1 1 614C3469
P 5650 3050
F 0 "RP2" V 5857 3050 50  0000 C CNN
F 1 "1K" V 5766 3050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3050 50  0001 C CNN
F 3 "~" H 5650 3050 50  0001 C CNN
	1    5650 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RP3
U 1 1 614C3CFD
P 5650 3150
F 0 "RP3" V 5857 3150 50  0000 C CNN
F 1 "1K" V 5766 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3150 50  0001 C CNN
F 3 "~" H 5650 3150 50  0001 C CNN
	1    5650 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RP4
U 1 1 614C4579
P 5650 3250
F 0 "RP4" V 5857 3250 50  0000 C CNN
F 1 "1K" V 5766 3250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3250 50  0001 C CNN
F 3 "~" H 5650 3250 50  0001 C CNN
	1    5650 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RP5
U 1 1 614C4580
P 5650 2850
F 0 "RP5" V 5857 2850 50  0000 C CNN
F 1 "1K" V 5766 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 2850 50  0001 C CNN
F 3 "~" H 5650 2850 50  0001 C CNN
	1    5650 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RP6
U 1 1 614C4587
P 2250 4150
F 0 "RP6" V 2457 4150 50  0000 C CNN
F 1 "1K" V 2366 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2180 4150 50  0001 C CNN
F 3 "~" H 2250 4150 50  0001 C CNN
	1    2250 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RP7
U 1 1 614C7667
P 2250 4050
F 0 "RP7" V 2457 4050 50  0000 C CNN
F 1 "1K" V 2366 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2180 4050 50  0001 C CNN
F 3 "~" H 2250 4050 50  0001 C CNN
	1    2250 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB0
U 1 1 614C8099
P 5650 3550
F 0 "RB0" V 5857 3550 50  0000 C BNN
F 1 "1K" V 5766 3550 50  0000 C BNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3550 50  0001 C CNN
F 3 "~" H 5650 3550 50  0001 C CNN
	1    5650 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB1
U 1 1 614C80A0
P 5650 3650
F 0 "RB1" V 5857 3650 50  0000 C CNN
F 1 "1K" V 5766 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3650 50  0001 C CNN
F 3 "~" H 5650 3650 50  0001 C CNN
	1    5650 3650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB2
U 1 1 614C80A7
P 5650 3750
F 0 "RB2" V 5857 3750 50  0000 C CNN
F 1 "1K" V 5766 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5650 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB3
U 1 1 614C80AE
P 5650 3850
F 0 "RB3" V 5857 3850 50  0000 C CNN
F 1 "1K" V 5766 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3850 50  0001 C CNN
F 3 "~" H 5650 3850 50  0001 C CNN
	1    5650 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB4
U 1 1 614C80B5
P 5650 3950
F 0 "RB4" V 5857 3950 50  0000 C CNN
F 1 "1K" V 5766 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 3950 50  0001 C CNN
F 3 "~" H 5650 3950 50  0001 C CNN
	1    5650 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB5
U 1 1 614C80BC
P 5650 4050
F 0 "RB5" V 5857 4050 50  0000 C CNN
F 1 "1K" V 5766 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 4050 50  0001 C CNN
F 3 "~" H 5650 4050 50  0001 C CNN
	1    5650 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB6
U 1 1 614C80C3
P 5650 4150
F 0 "RB6" V 5857 4150 50  0000 C CNN
F 1 "1K" V 5766 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 4150 50  0001 C CNN
F 3 "~" H 5650 4150 50  0001 C CNN
	1    5650 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R RB7
U 1 1 614C8963
P 5650 4250
F 0 "RB7" V 5857 4250 50  0000 C CNN
F 1 "1K" V 5766 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5580 4250 50  0001 C CNN
F 3 "~" H 5650 4250 50  0001 C CNN
	1    5650 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8450 2450 8200 2450
Wire Wire Line
	8450 2550 8200 2550
Wire Wire Line
	8450 2650 8200 2650
Wire Wire Line
	8200 2750 8450 2750
Wire Wire Line
	8200 2850 8450 2850
Wire Wire Line
	8450 2950 8200 2950
Wire Wire Line
	8200 3050 8450 3050
Wire Wire Line
	8200 3150 8450 3150
Wire Wire Line
	4200 3550 5500 3550
Wire Wire Line
	4200 3650 5500 3650
Wire Wire Line
	4200 3850 5500 3850
Wire Wire Line
	4200 3750 5500 3750
Wire Wire Line
	4200 4250 5500 4250
Wire Wire Line
	4200 4150 5500 4150
Wire Wire Line
	4200 4050 5500 4050
Wire Wire Line
	4200 3950 5500 3950
Wire Wire Line
	6050 3550 5800 3550
Wire Wire Line
	6050 3650 5800 3650
Wire Wire Line
	6050 3750 5800 3750
Wire Wire Line
	5800 3850 6050 3850
Wire Wire Line
	5800 3950 6050 3950
Wire Wire Line
	6050 4050 5800 4050
Wire Wire Line
	5800 4150 6050 4150
Wire Wire Line
	5800 4250 6050 4250
Text GLabel 8200 2450 0    50   Input ~ 0
DATA0
Text GLabel 8200 2550 0    50   Input ~ 0
DATA1
Text GLabel 8200 2650 0    50   Input ~ 0
DATA2
Text GLabel 8200 2750 0    50   Input ~ 0
DATA3
Text GLabel 8200 2850 0    50   Input ~ 0
DATA4
Text GLabel 8200 2950 0    50   Input ~ 0
DATA5
Text GLabel 8200 3050 0    50   Input ~ 0
DATA6
Text GLabel 8200 3150 0    50   Input ~ 0
DATA7
Text GLabel 6050 4250 2    50   Input ~ 0
DATA0
Text GLabel 6050 4150 2    50   Input ~ 0
DATA1
Text GLabel 6050 4050 2    50   Input ~ 0
DATA2
Text GLabel 6050 3950 2    50   Input ~ 0
DATA3
Text GLabel 6050 3850 2    50   Input ~ 0
DATA4
Text GLabel 6050 3750 2    50   Input ~ 0
DATA5
Text GLabel 6050 3650 2    50   Input ~ 0
DATA6
Text GLabel 6050 3550 2    50   Input ~ 0
DATA7
Wire Wire Line
	4200 2950 5500 2950
Wire Wire Line
	4200 3050 5500 3050
Wire Wire Line
	4200 3250 5500 3250
Wire Wire Line
	4200 3150 5500 3150
Wire Wire Line
	6050 2950 5800 2950
Wire Wire Line
	6050 3050 5800 3050
Wire Wire Line
	6050 3150 5800 3150
Wire Wire Line
	5800 3250 6050 3250
Text GLabel 6050 3250 2    50   Input ~ 0
BS1
Text GLabel 6050 3150 2    50   Input ~ 0
WR
Text GLabel 6050 3050 2    50   Input ~ 0
OE
Text GLabel 6050 2950 2    50   Input ~ 0
RDY
Wire Wire Line
	6050 2850 5800 2850
Text GLabel 6050 2850 2    50   Input ~ 0
XA0
Wire Wire Line
	4200 2850 5500 2850
Wire Wire Line
	1850 4150 2100 4150
Text GLabel 1850 4150 0    50   Input ~ 0
XA1
Wire Wire Line
	2400 4150 3400 4150
Wire Wire Line
	1850 4050 2100 4050
Text GLabel 1850 4050 0    50   Input ~ 0
XTAL1
Wire Wire Line
	2400 4050 3400 4050
Wire Wire Line
	8200 3450 8450 3450
Wire Wire Line
	8200 3550 8450 3550
Wire Wire Line
	8200 3650 8450 3650
Wire Wire Line
	8450 3750 8200 3750
Text GLabel 8200 3750 0    50   Input ~ 0
BS1
Text GLabel 8200 3650 0    50   Input ~ 0
WR
Text GLabel 8200 3550 0    50   Input ~ 0
OE
Text GLabel 8200 3450 0    50   Input ~ 0
RDY
Wire Wire Line
	8200 3850 8450 3850
Text GLabel 8200 3850 0    50   Input ~ 0
XA0
Wire Wire Line
	8200 3950 8450 3950
Text GLabel 8200 3950 0    50   Input ~ 0
XA1
Wire Wire Line
	9900 2650 9650 2650
Text GLabel 9900 2650 2    50   Input ~ 0
XTAL1
$Comp
L power:GND #PWR0101
U 1 1 615187B9
P 9050 4650
F 0 "#PWR0101" H 9050 4400 50  0001 C CNN
F 1 "GND" H 9050 4500 50  0000 C CNN
F 2 "" H 9050 4650 50  0000 C CNN
F 3 "" H 9050 4650 50  0000 C CNN
	1    9050 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 4350 9050 4550
Wire Wire Line
	7200 3350 7200 2150
Wire Wire Line
	7200 2150 9050 2150
Wire Wire Line
	4200 3350 7200 3350
$Comp
L Device:R RC1
U 1 1 6151E331
P 7200 3700
F 0 "RC1" H 7130 3654 50  0000 R CNN
F 1 "180R" H 7130 3745 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 7130 3700 50  0001 C CNN
F 3 "~" H 7200 3700 50  0001 C CNN
	1    7200 3700
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D1
U 1 1 615240BC
P 7200 4200
F 0 "D1" V 7238 4082 50  0000 R CNN
F 1 "GREEN" V 7147 4082 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 7200 4200 50  0001 C CNN
F 3 "~" H 7200 4200 50  0001 C CNN
	1    7200 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 3350 7200 3550
Connection ~ 7200 3350
Wire Wire Line
	7200 3850 7200 4050
Wire Wire Line
	7200 4350 7200 4550
Wire Wire Line
	7200 4550 9050 4550
Connection ~ 9050 4550
Wire Wire Line
	9050 4550 9050 4650
NoConn ~ 8450 3350
NoConn ~ 9650 2850
NoConn ~ 4550 2450
NoConn ~ 4550 2550
NoConn ~ 4550 2650
NoConn ~ 2900 4250
NoConn ~ 2900 3950
NoConn ~ 2900 3850
NoConn ~ 2650 3050
$Comp
L Device:R RC2
U 1 1 61542FA0
P 1100 6350
F 0 "RC2" H 1030 6304 50  0000 R CNN
F 1 "180R" H 1030 6395 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 1030 6350 50  0001 C CNN
F 3 "~" H 1100 6350 50  0001 C CNN
	1    1100 6350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 61542FA7
P 1100 6850
F 0 "D2" V 1138 6732 50  0000 R CNN
F 1 "RED" V 1047 6732 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 1100 6850 50  0001 C CNN
F 3 "~" H 1100 6850 50  0001 C CNN
	1    1100 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1100 6500 1100 6700
$Comp
L power:GND #PWR0102
U 1 1 6154520C
P 1100 7300
F 0 "#PWR0102" H 1100 7050 50  0001 C CNN
F 1 "GND" H 1100 7150 50  0000 C CNN
F 2 "" H 1100 7300 50  0000 C CNN
F 3 "" H 1100 7300 50  0000 C CNN
	1    1100 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 7000 1100 7300
$Comp
L Device:R RC3
U 1 1 6154B894
P 4150 6000
F 0 "RC3" V 4357 6000 50  0000 C CNN
F 1 "1K" V 4266 6000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 4080 6000 50  0001 C CNN
F 3 "~" H 4150 6000 50  0001 C CNN
	1    4150 6000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1100 3750 3400 3750
Wire Wire Line
	1100 3750 1100 6000
$Comp
L Connector:Barrel_Jack J1
U 1 1 6155664F
P 3200 5200
F 0 "J1" H 3255 5525 50  0000 C CNN
F 1 "Barrel_Jack" H 3255 5434 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-063AH_Horizontal_CircularHoles" H 3250 5160 50  0001 C CNN
F 3 "~" H 3250 5160 50  0001 C CNN
	1    3200 5200
	1    0    0    -1  
$EndComp
Connection ~ 1100 6000
Wire Wire Line
	1100 6000 1100 6200
$Comp
L Device:R RC4
U 1 1 6155AEB8
P 4550 5100
F 0 "RC4" V 4757 5100 50  0000 C CNN
F 1 "1K" V 4666 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 4480 5100 50  0001 C CNN
F 3 "~" H 4550 5100 50  0001 C CNN
	1    4550 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 5100 4400 5100
$Comp
L Transistor_BJT:BC337 Q1
U 1 1 6155F8A1
P 4800 6000
F 0 "Q1" H 4991 6046 50  0000 L CNN
F 1 "BC337" H 4991 5955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5000 5925 50  0001 L CIN
F 3 "http://www.nxp.com/documents/data_sheet/BC817_BC817W_BC337.pdf" H 4800 6000 50  0001 L CNN
	1    4800 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61561FFF
P 4900 6700
F 0 "#PWR0103" H 4900 6450 50  0001 C CNN
F 1 "GND" H 4900 6550 50  0000 C CNN
F 2 "" H 4900 6700 50  0000 C CNN
F 3 "" H 4900 6700 50  0000 C CNN
	1    4900 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 6200 4900 6700
$Comp
L power:GND #PWR0104
U 1 1 615672C7
P 3800 5400
F 0 "#PWR0104" H 3800 5150 50  0001 C CNN
F 1 "GND" H 3800 5250 50  0000 C CNN
F 2 "" H 3800 5400 50  0000 C CNN
F 3 "" H 3800 5400 50  0000 C CNN
	1    3800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5300 3800 5300
Wire Wire Line
	3800 5300 3800 5400
Wire Wire Line
	1100 6000 4000 6000
Wire Wire Line
	4300 6000 4600 6000
Wire Wire Line
	4900 5800 4900 5100
Wire Wire Line
	4900 5100 4700 5100
Wire Wire Line
	4900 5100 10500 5100
Wire Wire Line
	10500 5100 10500 2450
Wire Wire Line
	10500 2450 9650 2450
Connection ~ 4900 5100
$EndSCHEMATC
