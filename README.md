# DNSTest
Nameserver performance test written is Bash

## Requirements
* dig

## Example
```
$ ./dnstest.sh 
				Google	Norton	OpenDNS	UPC	Digi	C.F.	Telekom	Quad9
index.hu		17		37		36		15	14    	14		15		219	
origo.hu		15		36		40		15	15    	15		15		52	
kuruc.info		36		36		36		15	15    	15		14		46	
mobile.de		26		36		35		15	14    	15		15		39	
bbc.co.uk		26		34		35		15	15    	15		14		38	
wired.co.uk		34		53		52		16	15    	15		15		51	
amd.com			26		46		169		15	15    	15		14		105	
arstechnica.com	26		37		39		16	15    	15		15		44	
cannondale.cn	158		59		176		15	15    	39		15		208	
ferrari.cn		48		79		126		15  15    	18		14		187	
```
