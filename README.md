# ATtiny2313 High Voltage Parallel Programming Fuse Reset

At moment this is starting the framework for developing the arduino code.  

**NOTE, SOME CODE IS UNTESTED.**

**Files in AVR-HV-328P are untested.  This was used as a base point for ATtiny2313.**

**Files in AVR-HV-ATTINY2313 has been tested with issues.  Capabilities are:**
  - Program will read fuses but will not write fuses.
  - This could be issue with the chip I am trying to save.
  - File AVR-HV-ATTINY2313.ino will be commented with potential issues.


The development of this project was created to unlock a ATtiny2313 chip.

Inspiration from searching the internet came from the following sources.  All circuits and code have been derived from these sources:
  - http://www.rickety.us/2010/03/arduino-avr-high-voltage-serial-programmer/
  - https://sites.google.com/site/wayneholder/attiny-fuse-reset
  - https://mightyohm.com/blog/2008/09/arduino-based-avr-high-voltage-programmer/
  - http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2543-AVR-ATtiny2313_Datasheet.pdf

Since the ATtiny2313 uses parallel high voltage programming Jeff Keyzer's article code was the most useful.  By understanding code 
from mightyohm.com and using the Atmel ATtiny2313A/4313 data sheet page 184-199 this code was able to be developed.
