EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PrototypV1_rx-rescue:STM32G051K8T6-STM32G051K8T6 IC5
U 1 1 62E71D51
P 7850 4400
F 0 "IC5" H 9894 4246 50  0000 L CNN
F 1 "STM32G051K8T6" H 9894 4155 50  0000 L CNN
F 2 "QFP80P900X900X160-32N" H 9700 5100 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/stm32g051k8t6/stmicroelectronics?region=nac" H 9700 5000 50  0001 L CNN
F 4 "ARM Microcontrollers - MCU Mainstream Arm Cortex-M0+ 32-bit MCU up to 64 KB Flash 18 KB RAM 2x USART timers" H 9700 4900 50  0001 L CNN "Description"
F 5 "1.6" H 9700 4800 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 9700 4700 50  0001 L CNN "Manufacturer_Name"
F 7 "STM32G051K8T6" H 9700 4600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-STM32G051K8T6" H 9700 4500 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/STM32G051K8T6?qs=CiayqK2gdcI%2FqsEUlsG9sg%3D%3D" H 9700 4400 50  0001 L CNN "Mouser Price/Stock"
F 10 "STM32G051K8T6" H 9700 4300 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/stm32g051k8t6/stmicroelectronics?region=nac" H 9700 4200 50  0001 L CNN "Arrow Price/Stock"
	1    7850 4400
	1    0    0    -1  
$EndComp
Text GLabel 550  700  1    50   Input ~ 0
GND
Wire Wire Line
	550  700  550  850 
$Comp
L power:GND #PWR0101
U 1 1 62E73B8A
P 550 850
F 0 "#PWR0101" H 550 600 50  0001 C CNN
F 1 "GND" H 555 677 50  0000 C CNN
F 2 "" H 550 850 50  0001 C CNN
F 3 "" H 550 850 50  0001 C CNN
	1    550  850 
	1    0    0    -1  
$EndComp
Wire Notes Line
	450  1100 800  1100
Wire Notes Line
	800  1100 800  450 
Text Notes 650  1100 0    50   ~ 0
GND
Text GLabel 7850 4800 0    50   Input ~ 0
GND
Text GLabel 7850 4700 0    50   Input ~ 0
VCC_3V3
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 62E746D1
P 1200 700
F 0 "J1" V 1365 630 50  0000 C CNN
F 1 "PMS" V 1274 630 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 1200 700 50  0001 C CNN
F 3 "~" H 1200 700 50  0001 C CNN
	1    1200 700 
	0    -1   -1   0   
$EndComp
Text GLabel 900  900  3    50   Input ~ 0
VCC_5V
Text GLabel 1000 900  3    50   Input ~ 0
GND
Text GLabel 1100 900  3    50   Input ~ 0
PMS3003_SET
Text GLabel 1400 900  3    50   Input ~ 0
PMS3003_TX
Text GLabel 1300 900  3    50   Input ~ 0
PMS3003_RST
Text GLabel 1500 900  3    50   Input ~ 0
GND
Text GLabel 1200 900  3    50   Input ~ 0
GND
Wire Notes Line
	2100 1550 2100 450 
Text Notes 1750 1550 0    50   ~ 0
PMS3003\n
Text GLabel 8850 3500 1    50   Input ~ 0
PMS3003_SET
Text GLabel 9050 3500 1    50   Input ~ 0
PMS3003_TX
Text GLabel 8950 3500 1    50   Input ~ 0
PMS3003_RST
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 62E76C6C
P 2300 550
F 0 "J2" V 2238 262 50  0000 R CNN
F 1 "AHT15" V 2147 262 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x04_P1.27mm_Horizontal" H 2300 550 50  0001 C CNN
F 3 "~" H 2300 550 50  0001 C CNN
	1    2300 550 
	0    -1   -1   0   
$EndComp
Text GLabel 2200 750  3    50   Input ~ 0
VCC_3V3
Text GLabel 8550 3150 1    50   Input ~ 0
AHT15_SDA
Text GLabel 2400 750  3    50   Input ~ 0
GND
Text GLabel 8650 3150 1    50   Input ~ 0
AHT15_SCL
Wire Notes Line
	2900 1550 2900 450 
Text Notes 2650 1550 0    50   ~ 0
AHT15
$Comp
L PrototypV1_rx-rescue:MAX485CPA+-MAX485CPA+ IC3
U 1 1 62E78EEF
P 3700 950
F 0 "IC3" H 4200 1215 50  0000 C CNN
F 1 "MAX485CPA+" H 4200 1124 50  0000 C CNN
F 2 "DIP794W56P254L938H457Q8N" H 4550 1050 50  0001 L CNN
F 3 "https://pdfserv.maximintegrated.com/en/ds/MAX1487-MAX491.pdf" H 4550 950 50  0001 L CNN
F 4 "RS-422/RS-485 Interface IC Low-Power, Slew-Rate-Limited RS-485/RS-422 Transceivers" H 4550 850 50  0001 L CNN "Description"
F 5 "4.572" H 4550 750 50  0001 L CNN "Height"
F 6 "Maxim Integrated" H 4550 650 50  0001 L CNN "Manufacturer_Name"
F 7 "MAX485CPA+" H 4550 550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "700-MAX485CPA" H 4550 450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Maxim-Integrated/MAX485CPA%2b?qs=1THa7WoU59FcxPgOoQv70A%3D%3D" H 4550 350 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 4550 250 50  0001 L CNN "Arrow Part Number"
F 11 "" H 4550 150 50  0001 L CNN "Arrow Price/Stock"
	1    3700 950 
	1    0    0    -1  
$EndComp
Text GLabel 4700 950  2    50   Input ~ 0
VCC_5V
Text GLabel 4700 1250 2    50   Input ~ 0
GND
Wire Wire Line
	3700 1050 3700 1100
Wire Wire Line
	3700 1100 3650 1100
Connection ~ 3700 1100
Wire Wire Line
	3700 1100 3700 1150
Text GLabel 3650 1100 0    50   Input ~ 0
MAX485_SEL
Text GLabel 3700 950  0    50   Input ~ 0
MAX485_TX
Text GLabel 3700 1250 0    50   Input ~ 0
MAX485_RX
$Comp
L Device:R R5
U 1 1 62E7A124
P 5300 1100
F 0 "R5" H 5370 1146 50  0000 L CNN
F 1 "120" H 5370 1055 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 5230 1100 50  0001 C CNN
F 3 "~" H 5300 1100 50  0001 C CNN
	1    5300 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 62E7A6A5
P 6300 1050
F 0 "J4" H 6328 1026 50  0000 L CNN
F 1 "RS485" H 6328 935 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-4_P5.08mm" H 6300 1050 50  0001 C CNN
F 3 "~" H 6300 1050 50  0001 C CNN
	1    6300 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1050 5550 950 
Wire Wire Line
	4700 1050 5050 1050
Wire Wire Line
	5050 1050 5050 950 
Wire Wire Line
	5050 950  5300 950 
Wire Wire Line
	4700 1150 5050 1150
Wire Wire Line
	5050 1150 5050 1250
Wire Wire Line
	5050 1250 5300 1250
Text GLabel 6100 1250 0    50   Input ~ 0
VCC_5V
Text GLabel 6100 950  0    50   Input ~ 0
GND
Connection ~ 5300 950 
Connection ~ 5300 1250
Wire Wire Line
	5300 1250 5550 1250
Wire Wire Line
	5300 950  5550 950 
Wire Notes Line
	7350 1550 7350 450 
Text Notes 7100 1550 0    50   ~ 0
RS485 
$Comp
L Connector:Conn_01x05_Female J6
U 1 1 62E7DC1A
P 7700 550
F 0 "J6" V 7638 262 50  0000 R CNN
F 1 "HC12" V 7547 262 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7700 550 50  0001 C CNN
F 3 "~" H 7700 550 50  0001 C CNN
	1    7700 550 
	0    -1   -1   0   
$EndComp
Text GLabel 7500 750  3    50   Input ~ 0
HC12_SET
Text GLabel 7600 750  3    50   Input ~ 0
HC12_TX
Text GLabel 7700 750  3    50   Input ~ 0
HC12_RX
Text GLabel 7800 750  3    50   Input ~ 0
GND
Text GLabel 7900 750  3    50   Input ~ 0
VCC_5V
Wire Notes Line
	450  1550 8500 1550
Text Notes 8300 1550 0    50   ~ 0
HC12
$Comp
L PrototypV1_rx-rescue:TP4056-TP4056 IC6
U 1 1 62E7F8E0
P 9000 800
F 0 "IC6" H 9700 1065 50  0000 C CNN
F 1 "TP4056" H 9700 974 50  0000 C CNN
F 2 "SOIC127P600X175-9N" H 10250 900 50  0001 L CNN
F 3 "https://dlnmh9ip6v2uc.cloudfront.net/datasheets/Prototyping/TP4056.pdf" H 10250 800 50  0001 L CNN
F 4 "1A Standalone Linear Li-lon Battery Charger, SOP-8" H 10250 700 50  0001 L CNN "Description"
F 5 "1.75" H 10250 600 50  0001 L CNN "Height"
F 6 "NanJing Top Power" H 10250 500 50  0001 L CNN "Manufacturer_Name"
F 7 "TP4056" H 10250 400 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 10250 300 50  0001 L CNN "Mouser Part Number"
F 9 "" H 10250 200 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 10250 100 50  0001 L CNN "Arrow Part Number"
F 11 "" H 10250 0   50  0001 L CNN "Arrow Price/Stock"
	1    9000 800 
	1    0    0    -1  
$EndComp
Text GLabel 9000 1100 0    50   Input ~ 0
VIN
Text GLabel 10400 800  2    50   Input ~ 0
VIN
Text GLabel 9000 800  0    50   Input ~ 0
GND
Text GLabel 9000 1000 0    50   Input ~ 0
GND
Text GLabel 9700 1600 3    50   Input ~ 0
GND
Text GLabel 10400 1100 2    50   Input ~ 0
VBAT+
$Comp
L Device:C C18
U 1 1 62E81812
P 8650 1250
F 0 "C18" H 8765 1296 50  0000 L CNN
F 1 "100n" H 8765 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 8688 1100 50  0001 C CNN
F 3 "~" H 8650 1250 50  0001 C CNN
	1    8650 1250
	1    0    0    -1  
$EndComp
Text GLabel 8650 1100 1    50   Input ~ 0
VIN
Text GLabel 8650 1400 3    50   Input ~ 0
GND
$Comp
L Device:R R6
U 1 1 62E82693
P 8650 700
F 0 "R6" H 8720 746 50  0000 L CNN
F 1 "RPROG" H 8720 655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P15.24mm_Horizontal" V 8580 700 50  0001 C CNN
F 3 "~" H 8650 700 50  0001 C CNN
	1    8650 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 550  8550 550 
Wire Wire Line
	8550 1400 8650 1400
Wire Wire Line
	8550 550  8550 1400
Wire Wire Line
	9000 900  8650 900 
Wire Wire Line
	8650 900  8650 850 
Wire Notes Line
	8500 1800 11250 1800
Wire Notes Line
	8500 450  8500 1800
Text Notes 10900 1800 0    50   ~ 0
TP4056
$Comp
L PrototypV1_rx-rescue:DW01A-G-DW01A-G IC2
U 1 1 62E84B66
P 1800 3250
F 0 "IC2" H 2300 3515 50  0000 C CNN
F 1 "DW01A-G" H 2300 3424 50  0000 C CNN
F 2 "SOT95P190X145-6N" H 2650 3350 50  0001 L CNN
F 3 "http://www.ic-fortune.com/upload/Download/DW01x-DS-17_EN.pdf" H 2650 3250 50  0001 L CNN
F 4 "one cell lithium-ion/polymer battery protection IC" H 2650 3150 50  0001 L CNN "Description"
F 5 "1.45" H 2650 3050 50  0001 L CNN "Height"
F 6 "SII Semiconductor" H 2650 2950 50  0001 L CNN "Manufacturer_Name"
F 7 "DW01A-G" H 2650 2850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 2650 2750 50  0001 L CNN "Mouser Part Number"
F 9 "" H 2650 2650 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 2650 2550 50  0001 L CNN "Arrow Part Number"
F 11 "" H 2650 2450 50  0001 L CNN "Arrow Price/Stock"
	1    1800 3250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C6
U 1 1 62E88383
P 1750 2000
F 0 "C6" V 2002 2000 50  0000 C CNN
F 1 "100n" V 1911 2000 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1788 1850 50  0001 C CNN
F 3 "~" H 1750 2000 50  0001 C CNN
	1    1750 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 2250 1900 2100
Wire Wire Line
	1800 2250 1600 2250
Wire Wire Line
	1600 2250 1600 2000
$Comp
L PrototypV1_rx-rescue:FS8205A-FS8205A IC1
U 1 1 62E8981E
P 1300 3900
F 0 "IC1" H 1900 4165 50  0000 C CNN
F 1 "FS8205A" H 1900 4074 50  0000 C CNN
F 2 "SOP65P640X120-8N" H 2350 4000 50  0001 L CNN
F 3 "https://datasheet.lcsc.com/szlcsc/Fortune-Semicon-FS8205A_C16052.pdf" H 2350 3900 50  0001 L CNN
F 4 "Dual N-Channel Enhancement Mode power MOSFET, TSSOP8" H 2350 3800 50  0001 L CNN "Description"
F 5 "1.2" H 2350 3700 50  0001 L CNN "Height"
F 6 "Fortune Semicon" H 2350 3600 50  0001 L CNN "Manufacturer_Name"
F 7 "FS8205A" H 2350 3500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 2350 3400 50  0001 L CNN "Mouser Part Number"
F 9 "" H 2350 3300 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 2350 3200 50  0001 L CNN "Arrow Part Number"
F 11 "" H 2350 3100 50  0001 L CNN "Arrow Price/Stock"
	1    1300 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2250 800  2250
Wire Wire Line
	800  2250 800  4050
Connection ~ 1600 2250
Wire Wire Line
	1300 4100 1300 4050
Wire Wire Line
	1300 4050 800  4050
Connection ~ 1300 4050
Wire Wire Line
	1300 4050 1300 4000
Connection ~ 800  4050
Wire Wire Line
	800  4050 800  4500
Wire Wire Line
	1300 3900 1300 3750
Wire Wire Line
	1300 3750 2500 3750
Wire Wire Line
	2500 3750 2500 3900
Wire Wire Line
	1300 4200 1150 4200
Wire Wire Line
	1150 4200 1150 3250
Wire Wire Line
	1150 3250 1800 3250
Wire Wire Line
	2500 4200 2950 4200
Wire Wire Line
	2950 4200 2950 3250
Wire Wire Line
	2950 3250 2000 3250
Wire Wire Line
	2500 4000 2500 4050
Connection ~ 2500 4050
Wire Wire Line
	2500 4050 2500 4100
$Comp
L Device:R R2
U 1 1 62E8EB7D
P 2700 3850
F 0 "R2" H 2770 3896 50  0000 L CNN
F 1 "1k" H 2770 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 2630 3850 50  0001 C CNN
F 3 "~" H 2700 3850 50  0001 C CNN
	1    2700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4050 2700 4000
Wire Wire Line
	2500 4050 2700 4050
Wire Wire Line
	1900 3250 1900 3600
Wire Wire Line
	1900 3600 2700 3600
Wire Wire Line
	2700 3600 2700 3700
Text GLabel 2700 4050 3    50   Input ~ 0
GND
$Comp
L Device:R R1
U 1 1 62E91E42
P 2450 2100
F 0 "R1" V 2657 2100 50  0000 C CNN
F 1 "100" V 2566 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 2380 2100 50  0001 C CNN
F 3 "~" H 2450 2100 50  0001 C CNN
	1    2450 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 2100 2300 2100
Connection ~ 1900 2100
Wire Wire Line
	1900 2100 1900 2000
Wire Wire Line
	2600 2100 2700 2100
Text GLabel 2800 2100 1    50   Input ~ 0
VBAT+
$Comp
L Device:CP C11
U 1 1 62E94590
P 2700 2700
F 0 "C11" H 2818 2746 50  0000 L CNN
F 1 "10u" H 2818 2655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 2738 2550 50  0001 C CNN
F 3 "~" H 2700 2700 50  0001 C CNN
	1    2700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2550 2700 2100
Connection ~ 2700 2100
Wire Wire Line
	2700 2100 2800 2100
Wire Wire Line
	2700 2850 2700 3600
Connection ~ 2700 3600
Wire Wire Line
	800  4500 3150 4500
Text GLabel 3150 4500 2    50   Input ~ 0
VBAT-
Text Notes 2150 4750 0    50   ~ 0
BATTERY PROTECTION
$Comp
L PrototypV1_rx-rescue:LD1117V33-LD1117V33 IC4
U 1 1 62E9A305
P 5000 2000
F 0 "IC4" H 5928 1946 50  0000 L CNN
F 1 "LD1117V33" H 5928 1855 50  0000 L CNN
F 2 "TO255P460X1020X2008-3P" H 5950 2100 50  0001 L CNN
F 3 "http://www.st.com/web/en/resource/technical/document/datasheet/CD00000544.pdf" H 5950 2000 50  0001 L CNN
F 4 "800mA,3.3V,LDO Voltage Reg.,LD1117V33 STMicroelectronics LD1117V33, LDO Voltage Regulator, 1.3A, 3.3 V +/-1%, 3-Pin TO-220" H 5950 1900 50  0001 L CNN "Description"
F 5 "4.6" H 5950 1800 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 5950 1700 50  0001 L CNN "Manufacturer_Name"
F 7 "LD1117V33" H 5950 1600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "511-LD1117V33" H 5950 1500 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/STMicroelectronics/LD1117V33?qs=arR7071FstdSYX%2FAthFGRA%3D%3D" H 5950 1400 50  0001 L CNN "Mouser Price/Stock"
F 10 "LD1117V33" H 5950 1300 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/ld1117v33/stmicroelectronics?region=europe" H 5950 1200 50  0001 L CNN "Arrow Price/Stock"
	1    5000 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 62E9B51F
P 4500 1950
F 0 "C17" H 4615 1996 50  0000 L CNN
F 1 "100n" H 4615 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4538 1800 50  0001 C CNN
F 3 "~" H 4500 1950 50  0001 C CNN
	1    4500 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 62E9C50A
P 4100 1950
F 0 "C16" H 4215 1996 50  0000 L CNN
F 1 "100n" H 4215 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4138 1800 50  0001 C CNN
F 3 "~" H 4100 1950 50  0001 C CNN
	1    4100 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2100 4700 2100
Wire Wire Line
	4700 2100 4700 1800
Wire Wire Line
	4700 1800 4500 1800
Wire Wire Line
	5000 2200 4300 2200
Wire Wire Line
	4300 2200 4300 1800
Wire Wire Line
	4300 1800 4100 1800
Wire Wire Line
	4100 2100 4350 2100
Wire Wire Line
	4350 2100 4350 2300
Connection ~ 4350 2100
Wire Wire Line
	4350 2100 4500 2100
Text GLabel 5000 2000 0    50   Input ~ 0
GND
Text GLabel 4350 2300 3    50   Input ~ 0
GND
Wire Notes Line
	3850 3150 6650 3150
Text Notes 6000 3150 0    50   ~ 0
5V->3V3
$Comp
L Connector:Conn_01x05_Female J5
U 1 1 62EA9A42
P 7250 1900
F 0 "J5" V 7188 1612 50  0000 R CNN
F 1 " " V 7097 1612 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7250 1900 50  0001 C CNN
F 3 "~" H 7250 1900 50  0001 C CNN
	1    7250 1900
	0    -1   -1   0   
$EndComp
Text GLabel 7050 2100 3    50   Input ~ 0
PG
Text GLabel 7450 2100 3    50   Input ~ 0
VCC_5V
Text GLabel 4650 2200 3    50   Input ~ 0
VCC_5V
Text GLabel 4800 2100 3    50   Input ~ 0
VCC_3V3
Wire Notes Line
	6650 2800 8100 2800
Text Notes 7700 2800 0    50   ~ 0
VBAT->5V
$Comp
L Device:R R3
U 1 1 62EAEBEB
P 4400 3800
F 0 "R3" V 4607 3800 50  0000 C CNN
F 1 "10k" V 4516 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4330 3800 50  0001 C CNN
F 3 "~" H 4400 3800 50  0001 C CNN
	1    4400 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 62EB01D5
P 4900 3800
F 0 "R4" V 5107 3800 50  0000 C CNN
F 1 "10k" V 5016 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4830 3800 50  0001 C CNN
F 3 "~" H 4900 3800 50  0001 C CNN
	1    4900 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4550 3800 4750 3800
Text GLabel 4250 3800 1    50   Input ~ 0
VBAT+
Text GLabel 5050 3800 3    50   Input ~ 0
GND
Text GLabel 4650 3800 3    50   Input ~ 0
BATTERY_ADC
Wire Notes Line
	6050 4750 6050 3150
Text Notes 3900 4750 0    50   ~ 0
BATTERY ADC
$Comp
L Device:CP C8
U 1 1 62EC1E10
P 1950 5500
F 0 "C8" H 2068 5546 50  0000 L CNN
F 1 "100u" H 2068 5455 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 1988 5350 50  0001 C CNN
F 3 "~" H 1950 5500 50  0001 C CNN
	1    1950 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C9
U 1 1 62EC30EE
P 2150 5500
F 0 "C9" H 2268 5546 50  0000 L CNN
F 1 "10u" H 2268 5455 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 2188 5350 50  0001 C CNN
F 3 "~" H 2150 5500 50  0001 C CNN
	1    2150 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 5350 2150 5350
Wire Wire Line
	1950 5650 2150 5650
Text GLabel 1550 5650 3    50   Input ~ 0
GND
Text GLabel 1550 5350 1    50   Input ~ 0
VCC_3V3
$Comp
L Device:CP C14
U 1 1 62EE2DF6
P 3100 5500
F 0 "C14" H 3218 5546 50  0000 L CNN
F 1 "100u" H 3218 5455 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.4" H 3138 5350 50  0001 C CNN
F 3 "~" H 3100 5500 50  0001 C CNN
	1    3100 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C15
U 1 1 62EE4C6E
P 3300 5500
F 0 "C15" H 3418 5546 50  0000 L CNN
F 1 "10u" H 3418 5455 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 3338 5350 50  0001 C CNN
F 3 "~" H 3300 5500 50  0001 C CNN
	1    3300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5350 3100 5350
Wire Wire Line
	3100 5650 3300 5650
Text GLabel 2900 5350 1    50   Input ~ 0
VCC_5V
Text GLabel 2900 5650 3    50   Input ~ 0
GND
$Comp
L Device:CP C2
U 1 1 62EFC6F8
P 850 6200
F 0 "C2" H 968 6246 50  0000 L CNN
F 1 "470u" H 968 6155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x10.5" H 888 6050 50  0001 C CNN
F 3 "~" H 850 6200 50  0001 C CNN
	1    850  6200
	1    0    0    -1  
$EndComp
Text GLabel 850  6050 1    50   Input ~ 0
VIN
Text GLabel 850  6350 3    50   Input ~ 0
GND
Wire Notes Line
	3850 1550 3850 6800
Text Notes 2150 6800 0    50   ~ 0
CAPACITORS
$Comp
L Connector:Conn_01x05_Female J3
U 1 1 62F058F7
P 4400 5050
F 0 "J3" V 4338 4762 50  0000 R CNN
F 1 "PROGRAMATOR" V 4247 4762 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 4400 5050 50  0001 C CNN
F 3 "~" H 4400 5050 50  0001 C CNN
	1    4400 5050
	0    -1   -1   0   
$EndComp
Text GLabel 4200 5250 3    50   Input ~ 0
GND
Text GLabel 4300 5250 3    50   Input ~ 0
VCC_5V
Text GLabel 4400 5250 3    50   Input ~ 0
SWCLK
Text GLabel 4500 5250 3    50   Input ~ 0
SWDIO
Text GLabel 4600 5250 3    50   Input ~ 0
RESET
Wire Notes Line
	5350 6800 5350 4750
Wire Notes Line
	450  6800 5350 6800
Text Notes 4500 6800 0    50   ~ 0
PROGRAM
$Comp
L Device:C C1
U 1 1 62F11768
P 850 5500
F 0 "C1" H 965 5546 50  0000 L CNN
F 1 "100n" H 965 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 888 5350 50  0001 C CNN
F 3 "~" H 850 5500 50  0001 C CNN
	1    850  5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 62F135E9
P 1050 5500
F 0 "C3" H 1165 5546 50  0000 L CNN
F 1 "100n" H 1165 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1088 5350 50  0001 C CNN
F 3 "~" H 1050 5500 50  0001 C CNN
	1    1050 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 62F154B0
P 1250 5500
F 0 "C4" H 1365 5546 50  0000 L CNN
F 1 "100n" H 1365 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1288 5350 50  0001 C CNN
F 3 "~" H 1250 5500 50  0001 C CNN
	1    1250 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 62F172C5
P 1450 5500
F 0 "C5" H 1565 5546 50  0000 L CNN
F 1 "100n" H 1565 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1488 5350 50  0001 C CNN
F 3 "~" H 1450 5500 50  0001 C CNN
	1    1450 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 62F18F8F
P 1650 5500
F 0 "C7" H 1765 5546 50  0000 L CNN
F 1 "100n" H 1765 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1688 5350 50  0001 C CNN
F 3 "~" H 1650 5500 50  0001 C CNN
	1    1650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5350 1950 5350
Connection ~ 1950 5350
Wire Wire Line
	1950 5650 1650 5650
Connection ~ 1950 5650
Connection ~ 1650 5650
Wire Wire Line
	1450 5650 1650 5650
Wire Wire Line
	1450 5650 1250 5650
Connection ~ 1450 5650
Wire Wire Line
	1050 5650 1250 5650
Connection ~ 1250 5650
Wire Wire Line
	1050 5650 850  5650
Connection ~ 1050 5650
Wire Wire Line
	850  5350 1050 5350
Wire Wire Line
	1050 5350 1250 5350
Connection ~ 1050 5350
Wire Wire Line
	1250 5350 1450 5350
Connection ~ 1250 5350
Connection ~ 1450 5350
Wire Wire Line
	1450 5350 1650 5350
Connection ~ 1650 5350
$Comp
L Device:C C10
U 1 1 62F3ACAA
P 2500 5500
F 0 "C10" H 2615 5546 50  0000 L CNN
F 1 "100n" H 2615 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2538 5350 50  0001 C CNN
F 3 "~" H 2500 5500 50  0001 C CNN
	1    2500 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 62F3D082
P 2700 5500
F 0 "C12" H 2815 5546 50  0000 L CNN
F 1 "100n" H 2815 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2738 5350 50  0001 C CNN
F 3 "~" H 2700 5500 50  0001 C CNN
	1    2700 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 62F3F521
P 2900 5500
F 0 "C13" H 3015 5546 50  0000 L CNN
F 1 "100n" H 3015 5455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 2938 5350 50  0001 C CNN
F 3 "~" H 2900 5500 50  0001 C CNN
	1    2900 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5650 2900 5650
Connection ~ 3100 5650
Wire Wire Line
	2700 5650 2900 5650
Connection ~ 2900 5650
Wire Wire Line
	2700 5650 2500 5650
Connection ~ 2700 5650
Wire Wire Line
	2500 5350 2700 5350
Wire Wire Line
	2700 5350 2900 5350
Connection ~ 2700 5350
Wire Wire Line
	2900 5350 3100 5350
Connection ~ 2900 5350
Connection ~ 3100 5350
$Comp
L Device:R R10
U 1 1 62F54A13
P 9150 2800
F 0 "R10" V 9357 2800 50  0000 C CNN
F 1 "10k" V 9266 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 9080 2800 50  0001 C CNN
F 3 "~" H 9150 2800 50  0001 C CNN
	1    9150 2800
	-1   0    0    1   
$EndComp
Text GLabel 9150 2650 2    50   Input ~ 0
GND
Wire Wire Line
	9150 3500 9150 2950
$Comp
L Device:R R7
U 1 1 62F59A24
P 7500 4900
F 0 "R7" V 7707 4900 50  0000 C CNN
F 1 "10k" V 7616 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 7430 4900 50  0001 C CNN
F 3 "~" H 7500 4900 50  0001 C CNN
	1    7500 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 4900 7650 4900
Text GLabel 7350 4900 0    50   Input ~ 0
VCC_3V3
$Comp
L Device:R R9
U 1 1 62F6A1D5
P 8500 3250
F 0 "R9" V 8707 3250 50  0000 C CNN
F 1 "10k" V 8616 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8430 3250 50  0001 C CNN
F 3 "~" H 8500 3250 50  0001 C CNN
	1    8500 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 62F6C872
P 8400 3350
F 0 "R8" V 8607 3350 50  0000 C CNN
F 1 "10k" V 8516 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8330 3350 50  0001 C CNN
F 3 "~" H 8400 3350 50  0001 C CNN
	1    8400 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	8650 3150 8650 3250
Wire Wire Line
	8650 3250 8650 3500
Connection ~ 8650 3250
Wire Wire Line
	8550 3150 8550 3350
Wire Wire Line
	8550 3500 8550 3350
Connection ~ 8550 3350
Wire Wire Line
	8350 3250 8250 3250
Wire Wire Line
	8250 3250 8250 3350
Text GLabel 8250 3300 0    50   Input ~ 0
VCC_3V3
Text GLabel 8650 5700 3    50   Input ~ 0
MAX485_SEL
Text GLabel 8550 5700 3    50   Input ~ 0
MAX485_TX
Text GLabel 8450 5700 3    50   Input ~ 0
MAX485_RX
Text GLabel 9050 5700 3    50   Input ~ 0
BATTERY_ADC
Text GLabel 9850 4600 2    50   Input ~ 0
HC12_SET
Text GLabel 9850 4700 2    50   Input ~ 0
HC12_TX
Text GLabel 9850 4900 2    50   Input ~ 0
HC12_RX
$Comp
L Sensor_Temperature:DS18B20 IC7
U 1 1 62F9553D
P 10100 2250
F 0 "IC7" H 9870 2296 50  0000 R CNN
F 1 "DS18B20" H 9870 2205 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9100 2000 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 9950 2500 50  0001 C CNN
	1    10100 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 62F96B9A
P 10400 1950
F 0 "R11" V 10193 1950 50  0000 C CNN
F 1 "4,7k" V 10284 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 10330 1950 50  0001 C CNN
F 3 "~" H 10400 1950 50  0001 C CNN
	1    10400 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 1950 10250 1950
Wire Wire Line
	10400 2250 10550 2250
Wire Wire Line
	10550 2250 10550 1950
Text GLabel 2300 750  3    50   Input ~ 0
AHT15_SDA
Text GLabel 2500 750  3    50   Input ~ 0
AHT15_SCL
Text GLabel 10100 2550 3    50   Input ~ 0
GND
Text GLabel 10100 1950 0    50   Input ~ 0
VCC_3V3
Text GLabel 10550 2250 2    50   Input ~ 0
DS18B20
Text GLabel 9850 4500 2    50   Input ~ 0
DS18B20
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 62FB1DA3
P 6300 3350
F 0 "J8" V 6362 3394 50  0000 L CNN
F 1 "BATTERY" V 6453 3394 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6300 3350 50  0001 C CNN
F 3 "~" H 6300 3350 50  0001 C CNN
	1    6300 3350
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 62FB2ADE
P 6550 3350
F 0 "J9" V 6612 3394 50  0000 L CNN
F 1 "SOLAR" V 6703 3394 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6550 3350 50  0001 C CNN
F 3 "~" H 6550 3350 50  0001 C CNN
	1    6550 3350
	0    1    1    0   
$EndComp
Wire Notes Line
	9500 1800 9500 2800
Wire Notes Line
	9500 2800 11250 2800
Text Notes 10700 2750 0    50   ~ 0
DS18B20
Text GLabel 6200 3550 3    50   Input ~ 0
VBAT+
Text GLabel 6300 3550 3    50   Input ~ 0
VBAT-
Text GLabel 6450 3550 3    50   Input ~ 0
VIN
Text GLabel 6550 3550 3    50   Input ~ 0
GND
Wire Notes Line
	6650 1550 6650 4750
Wire Notes Line
	450  4750 6650 4750
Text Notes 6100 4750 0    50   ~ 0
BATTERY\nSOLAR\nCONNECTORS
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 62E7188D
P 1850 700
F 0 "J10" V 1912 744 50  0000 L CNN
F 1 "PROGRAM" V 2003 744 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1850 700 50  0001 C CNN
F 3 "~" H 1850 700 50  0001 C CNN
	1    1850 700 
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 900  1750 900 
Text GLabel 1850 900  3    50   Input ~ 0
SWCLK
Text GLabel 9150 3150 2    50   Input ~ 0
SWCLK
$Comp
L Device:CP C19
U 1 1 62E75335
P 7300 2550
F 0 "C19" H 7418 2596 50  0000 L CNN
F 1 "10u" H 7418 2505 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 7338 2400 50  0001 C CNN
F 3 "~" H 7300 2550 50  0001 C CNN
	1    7300 2550
	0    -1   -1   0   
$EndComp
Text GLabel 7450 2550 3    50   Input ~ 0
GND
Text GLabel 7150 2550 3    50   Input ~ 0
VBAT+
Wire Wire Line
	7150 2550 7150 2200
Wire Wire Line
	7150 2200 7250 2200
Wire Wire Line
	7250 2200 7250 2100
Wire Wire Line
	7450 2550 7450 2450
Wire Wire Line
	7450 2450 7350 2450
Wire Wire Line
	7350 2450 7350 2100
$Comp
L Device:R R12
U 1 1 62E8997B
P 6900 2100
F 0 "R12" V 7107 2100 50  0000 C CNN
F 1 "10k" V 7016 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 6830 2100 50  0001 C CNN
F 3 "~" H 6900 2100 50  0001 C CNN
	1    6900 2100
	0    1    1    0   
$EndComp
Text GLabel 6750 2100 1    50   Input ~ 0
VCC_3V3
$Comp
L Device:R R13
U 1 1 62E8420F
P 7350 5150
F 0 "R13" V 7557 5150 50  0000 C CNN
F 1 "10k" V 7466 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 7280 5150 50  0001 C CNN
F 3 "~" H 7350 5150 50  0001 C CNN
	1    7350 5150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 62E8721D
P 7500 5250
F 0 "R14" V 7707 5250 50  0000 C CNN
F 1 "10k" V 7616 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 7430 5250 50  0001 C CNN
F 3 "~" H 7500 5250 50  0001 C CNN
	1    7500 5250
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 5000 7350 5000
Wire Wire Line
	7350 5000 7850 5000
Connection ~ 7350 5000
Wire Wire Line
	7250 5100 7500 5100
Wire Wire Line
	7500 5100 7850 5100
Connection ~ 7500 5100
Wire Wire Line
	7500 5400 7350 5400
Wire Wire Line
	7350 5400 7350 5300
Text GLabel 7400 5400 3    50   Input ~ 0
VCC_3V3
Text GLabel 8750 3500 1    50   Input ~ 0
GND
Wire Wire Line
	5550 1050 5900 1050
Wire Wire Line
	5900 1050 5900 1150
Wire Wire Line
	5900 1150 6100 1150
Wire Wire Line
	5550 1100 5950 1100
Wire Wire Line
	5950 1100 5950 1050
Wire Wire Line
	5950 1050 6100 1050
Wire Wire Line
	5550 1100 5550 1250
Text GLabel 7850 4400 0    50   Input ~ 0
PG
Text GLabel 7250 5100 0    50   Input ~ 0
STDBY
Text GLabel 7250 5000 0    50   Input ~ 0
CHRG
Text GLabel 10400 1000 2    50   Input ~ 0
STDBY
Text GLabel 10400 900  2    50   Input ~ 0
CHRG
Text GLabel 9850 4400 2    50   Input ~ 0
SWDIO
Text GLabel 7700 4900 3    50   Input ~ 0
RESET
Text GLabel 9850 5100 2    50   Input ~ 0
GND
Text GLabel 9850 4800 2    50   Input ~ 0
GND
Wire Notes Line
	8100 1550 8100 2800
Text GLabel 13050 1500 2    50   Input ~ 0
GND
$Comp
L Device:R R15
U 1 1 62F0758E
P 12450 1250
F 0 "R15" V 12657 1250 50  0000 C CNN
F 1 "10k" V 12566 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 12380 1250 50  0001 C CNN
F 3 "~" H 12450 1250 50  0001 C CNN
	1    12450 1250
	-1   0    0    1   
$EndComp
$Comp
L Device:C C20
U 1 1 62F0BA6C
P 12450 1750
F 0 "C20" H 12565 1796 50  0000 L CNN
F 1 "100n" H 12565 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 12488 1600 50  0001 C CNN
F 3 "~" H 12450 1750 50  0001 C CNN
	1    12450 1750
	1    0    0    -1  
$EndComp
Text GLabel 12450 1900 3    50   Input ~ 0
GND
Wire Wire Line
	12650 1500 12450 1500
Wire Wire Line
	12450 1500 12450 1600
Wire Wire Line
	12450 1500 12450 1400
Connection ~ 12450 1500
Text GLabel 12450 1100 1    50   Input ~ 0
VCC_3V3
Wire Wire Line
	12450 1500 12100 1500
Wire Wire Line
	12100 1500 12100 1300
Text GLabel 12100 1300 1    50   Input ~ 0
SW
Text GLabel 9850 5000 2    50   Input ~ 0
SW
Wire Notes Line
	13400 2250 13400 450 
Text Notes 13100 2250 0    50   ~ 0
SWITCH
$Comp
L Device:LED D1
U 1 1 62F34085
P 14250 950
F 0 "D1" H 14243 695 50  0000 C CNN
F 1 "LED" H 14243 786 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 14250 950 50  0001 C CNN
F 3 "~" H 14250 950 50  0001 C CNN
	1    14250 950 
	-1   0    0    1   
$EndComp
$Comp
L Device:R R16
U 1 1 62F409FC
P 13950 950
F 0 "R16" V 14157 950 50  0000 C CNN
F 1 "360k" V 14066 950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 13880 950 50  0001 C CNN
F 3 "~" H 13950 950 50  0001 C CNN
	1    13950 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 62F541D1
P 14250 1350
F 0 "D2" H 14243 1095 50  0000 C CNN
F 1 "LED" H 14243 1186 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 14250 1350 50  0001 C CNN
F 3 "~" H 14250 1350 50  0001 C CNN
	1    14250 1350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R17
U 1 1 62F541D7
P 13950 1350
F 0 "R17" V 14157 1350 50  0000 C CNN
F 1 "360k" V 14066 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 13880 1350 50  0001 C CNN
F 3 "~" H 13950 1350 50  0001 C CNN
	1    13950 1350
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 62F57E99
P 14250 1750
F 0 "D3" H 14243 1495 50  0000 C CNN
F 1 "LED" H 14243 1586 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 14250 1750 50  0001 C CNN
F 3 "~" H 14250 1750 50  0001 C CNN
	1    14250 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R18
U 1 1 62F57E9F
P 13950 1750
F 0 "R18" V 14157 1750 50  0000 C CNN
F 1 "360k" V 14066 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 13880 1750 50  0001 C CNN
F 3 "~" H 13950 1750 50  0001 C CNN
	1    13950 1750
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 62F5BE51
P 14250 2150
F 0 "D4" H 14243 1895 50  0000 C CNN
F 1 "LED" H 14243 1986 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 14250 2150 50  0001 C CNN
F 3 "~" H 14250 2150 50  0001 C CNN
	1    14250 2150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R19
U 1 1 62F5BE57
P 13950 2150
F 0 "R19" V 14157 2150 50  0000 C CNN
F 1 "360k" V 14066 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 13880 2150 50  0001 C CNN
F 3 "~" H 13950 2150 50  0001 C CNN
	1    13950 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14400 950  14400 1350
Wire Wire Line
	14400 1350 14400 1550
Connection ~ 14400 1350
Wire Wire Line
	14400 1750 14400 2150
Connection ~ 14400 1750
Wire Wire Line
	14400 1550 14900 1550
Wire Wire Line
	14900 1550 14900 1650
Connection ~ 14400 1550
Wire Wire Line
	14400 1550 14400 1750
Text GLabel 14900 1650 3    50   Input ~ 0
GND
Text GLabel 13800 950  0    50   Input ~ 0
LED0
Text GLabel 13800 1350 0    50   Input ~ 0
LED1
Text GLabel 13800 1750 0    50   Input ~ 0
LED2
Text GLabel 13800 2150 0    50   Input ~ 0
LED3
Wire Notes Line
	11250 2250 16100 2250
Text Notes 15400 2250 0    50   ~ 0
DEBUGING LEDS
Text GLabel 9150 5700 3    50   Input ~ 0
LED0
Text GLabel 8850 5700 3    50   Input ~ 0
LED1
Text GLabel 8950 5700 3    50   Input ~ 0
LED2
Text GLabel 8750 5700 3    50   Input ~ 0
LED3
$Comp
L Switch:SW_Push SW1
U 1 1 62F99ADE
P 12850 1500
F 0 "SW1" H 12850 1785 50  0000 C CNN
F 1 "SW_Push" H 12850 1694 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T_NO_6x6mm_H9.5mm" H 12850 1700 50  0001 C CNN
F 3 "~" H 12850 1700 50  0001 C CNN
	1    12850 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J11
U 1 1 62FD8E9E
P 12050 2700
F 0 "J11" H 12158 2881 50  0000 C CNN
F 1 "GND" H 12158 2790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 12050 2700 50  0001 C CNN
F 3 "~" H 12050 2700 50  0001 C CNN
	1    12050 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J12
U 1 1 62FE9D47
P 12050 2950
F 0 "J12" H 12158 3131 50  0000 C CNN
F 1 "DS18B20" H 12158 3040 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 12050 2950 50  0001 C CNN
F 3 "~" H 12050 2950 50  0001 C CNN
	1    12050 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J13
U 1 1 62FEDEC3
P 12050 3200
F 0 "J13" H 12158 3381 50  0000 C CNN
F 1 "VBAT+" H 12158 3290 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 12050 3200 50  0001 C CNN
F 3 "~" H 12050 3200 50  0001 C CNN
	1    12050 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J14
U 1 1 62FF1D28
P 12050 3450
F 0 "J14" H 12158 3631 50  0000 C CNN
F 1 "VBAT-" H 12158 3540 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 12050 3450 50  0001 C CNN
F 3 "~" H 12050 3450 50  0001 C CNN
	1    12050 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J15
U 1 1 62FF5E11
P 12550 2700
F 0 "J15" H 12658 2881 50  0000 C CNN
F 1 "VIN" H 12658 2790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 12550 2700 50  0001 C CNN
F 3 "~" H 12550 2700 50  0001 C CNN
	1    12550 2700
	1    0    0    -1  
$EndComp
Text GLabel 12750 2700 2    50   Input ~ 0
VIN
Text GLabel 12250 2700 2    50   Input ~ 0
GND
Text GLabel 12250 2950 2    50   Input ~ 0
DS18B20
Text GLabel 12250 3200 2    50   Input ~ 0
VBAT+
Text GLabel 12250 3450 2    50   Input ~ 0
VBAT-
$Comp
L Connector:Conn_01x02_Male J16
U 1 1 63010C37
P 13000 2950
F 0 "J16" H 13108 3131 50  0000 C CNN
F 1 "AHT15_TEST" H 13108 3040 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13000 2950 50  0001 C CNN
F 3 "~" H 13000 2950 50  0001 C CNN
	1    13000 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J17
U 1 1 6301DA37
P 13000 3350
F 0 "J17" H 13108 3531 50  0000 C CNN
F 1 "PMS_TEST" H 13108 3440 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13000 3350 50  0001 C CNN
F 3 "~" H 13000 3350 50  0001 C CNN
	1    13000 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J18
U 1 1 63021850
P 13000 3750
F 0 "J18" H 13108 3931 50  0000 C CNN
F 1 "HC12_TEST" H 13108 3840 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13000 3750 50  0001 C CNN
F 3 "~" H 13000 3750 50  0001 C CNN
	1    13000 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J19
U 1 1 63025611
P 13950 2950
F 0 "J19" H 14058 3131 50  0000 C CNN
F 1 "RS486_TEST" H 14058 3040 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13950 2950 50  0001 C CNN
F 3 "~" H 13950 2950 50  0001 C CNN
	1    13950 2950
	1    0    0    -1  
$EndComp
Text GLabel 13200 3050 2    50   Input ~ 0
AHT15_SDA
Text GLabel 13200 2950 2    50   Input ~ 0
AHT15_SCL
Text GLabel 13200 3350 2    50   Input ~ 0
PMS3003_TX
Text GLabel 1600 900  3    50   Input ~ 0
PMS3003_RX
Text GLabel 13200 3450 2    50   Input ~ 0
PMS3003_RX
Text GLabel 13200 3850 2    50   Input ~ 0
HC12_TX
Text GLabel 13200 3750 2    50   Input ~ 0
HC12_RX
Text GLabel 14150 2950 2    50   Input ~ 0
MAX485_TX
Text GLabel 14150 3050 2    50   Input ~ 0
MAX485_RX
Wire Notes Line
	11250 4050 16100 4050
Wire Notes Line
	11250 450  11250 4050
Text Notes 15550 4050 0    50   ~ 0
TEST POINTS
$Comp
L Connector:Conn_01x01_Male J7
U 1 1 630925EB
P 11450 2700
F 0 "J7" H 11558 2881 50  0000 C CNN
F 1 "GND" H 11558 2790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 11450 2700 50  0001 C CNN
F 3 "~" H 11450 2700 50  0001 C CNN
	1    11450 2700
	1    0    0    -1  
$EndComp
Text GLabel 11650 2700 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x01_Male J20
U 1 1 6309667F
P 11450 3000
F 0 "J20" H 11558 3181 50  0000 C CNN
F 1 "GND" H 11558 3090 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 11450 3000 50  0001 C CNN
F 3 "~" H 11450 3000 50  0001 C CNN
	1    11450 3000
	1    0    0    -1  
$EndComp
Text GLabel 11650 3000 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x01_Male J21
U 1 1 6309A509
P 11450 3400
F 0 "J21" H 11558 3581 50  0000 C CNN
F 1 "GND" H 11558 3490 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 11450 3400 50  0001 C CNN
F 3 "~" H 11450 3400 50  0001 C CNN
	1    11450 3400
	1    0    0    -1  
$EndComp
Text GLabel 11650 3400 2    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x01_Male ghj1
U 1 1 630B7ACF
P 14550 4350
F 0 "ghj1" H 14658 4531 50  0001 C CNN
F 1 "GND" H 14658 4439 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 14550 4350 50  0001 C CNN
F 3 "~" H 14550 4350 50  0001 C CNN
	1    14550 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J23
U 1 1 630BBA54
P 14550 4650
F 0 "J23" H 14658 4831 50  0001 C CNN
F 1 "GND" H 14658 4739 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 14550 4650 50  0001 C CNN
F 3 "~" H 14550 4650 50  0001 C CNN
	1    14550 4650
	1    0    0    -1  
$EndComp
Text GLabel 14750 4350 2    50   Input ~ 0
GND
Text GLabel 14750 4650 2    50   Input ~ 0
GND
$Comp
L Device:C C21
U 1 1 630ED3AA
P 1550 6350
F 0 "C21" H 1665 6396 50  0000 L CNN
F 1 "100n" H 1665 6305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1588 6200 50  0001 C CNN
F 3 "~" H 1550 6350 50  0001 C CNN
	1    1550 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 630ED3B0
P 1900 6350
F 0 "C22" H 2015 6396 50  0000 L CNN
F 1 "100n" H 2015 6305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1938 6200 50  0001 C CNN
F 3 "~" H 1900 6350 50  0001 C CNN
	1    1900 6350
	1    0    0    -1  
$EndComp
Text GLabel 1750 6150 1    50   Input ~ 0
VBAT+
Wire Wire Line
	1750 6150 1750 6200
Wire Wire Line
	1750 6200 1550 6200
Wire Wire Line
	1750 6200 1900 6200
Connection ~ 1750 6200
Wire Wire Line
	1550 6500 1900 6500
Text GLabel 1750 6500 3    50   Input ~ 0
GND
$EndSCHEMATC
