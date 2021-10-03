/*
 * AVR High-Voltage Parallel Fuse Programmer for ATtiny2313
 * 
 * Author: M Grotaers
 * Date: 22/09/2021
 * 
 * The following people have inspired me to create this program and circuit design 
 * along with their reference:
 *    Paul Willoughby 02/20/2010, 
 *      http://www.rickety.us/2010/03/arduino-avr-high-voltage-serial-programmer/
 *    Wayne's Tinkering Page,
 *      https://sites.google.com/site/wayneholder/attiny-fuse-reset
 *    Jeff Keyzer,
 *      https://mightyohm.com/blog/2008/09/arduino-based-avr-high-voltage-programmer/
 *  
 *  Since the ATtiny2313 uses parallel high voltage programming Jeff Keyzer's article
 *  code was the most useful.  By understanding Jeff's code and using the Atmel 
 *  ATtiny2313A/4313 data sheet page 184-199 this code was able to be developed.
 *    
 */

int menuOption = 0; // for incoming serial data

void setup() {
  Serial.begin(9600);

  // Print menu to Serial Monitor
  Serial.println("ATtiny2313 High Voltage Parallel Programming Fuse Bits.");
  Serial.println("Select option from menu:");
  Serial.println("Press '1' to program high and low fuse bits");
  Serial.println("Press '2' to program high and low fuse bits, and to read fuse and lock bits");
  Serial.println("Press '3' to read fuse and lock bits");
}

void loop() {
  // Send data only when you receive data
  if (Serial.available() > 0) {
    // read the incoming byte:
    menuOption = Serial.read();
  }
  
  // say what you got:
  if(menuOption == '1'){
    Serial.println("Programming High and Low Fuse Bits");
  } else if (menuOption == '2'){
    Serial.println("Programming High and Low Fuse Bits");
    Serial.println("Reading Fuse and Lock Bits");
  } else if (menuOption == '3'){
    Serial.println("Reading Fuse and Lock Bits");
  }
  
  menuOption = 0;

}
