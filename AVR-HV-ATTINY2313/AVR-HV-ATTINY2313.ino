
/*
 * AVR High-Voltage Parallel Fuse Programmer for ATtiny2313
 * 
 * Author: M Grotaers
 * Date: 10/10/2021
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

//Menu Control
int menuOption = 0; // for incoming serial data

byte TESTDATA;

//Desired fuse configuration
#define HFUSE 0xDF
#define LFUSE 0x64

//Pin Assignment on Arduino
#define DATA PORTB //Digital Pins 0-7 as output DATA
#define DATAD DDRB //Data direction register for DATA port

#define VCC     8
#define RDY     12
#define OE      11
#define WR      10
#define BS1     9
#define XA0     13
#define XA1     18 //A4 Also BS2 on ATtiny2313
#define RST     14 //A0
#define XTAL1   17 //A3


void setup() {

  TESTDATA = 0xFF;
  // Setup control line for HV parallel programming from Arduino perspective
  DATA = 0x00; // Clear digital pins 0-7
  DATAD = 0xFF; // Set digital pins 0-7 as outputs for programming
  pinMode(VCC, OUTPUT);
  pinMode(RDY, INPUT);
  pinMode(OE, OUTPUT); //Inverted
  pinMode(WR, OUTPUT); //Inverted
  pinMode(BS1, OUTPUT);
  pinMode(XA0, OUTPUT);
  pinMode(XA1, OUTPUT);
  pinMode(RST, OUTPUT); //+12V Signal to chip, Inverted
  pinMode(XTAL1, OUTPUT);
  
  //Initialise output pin RST so 12V is shut off at 0V
  digitalWrite(RST, HIGH);
  
  Serial.begin(9600);

  // Print menu to Serial Monitor
  Serial.println("ATtiny2313 High Voltage Parallel Programming Fuse Bits.");
  Serial.println("Select option from menu:");
  Serial.println("Press '1' to program high and low fuse bits");
  Serial.println("Press '2' to program high and low fuse bits, and to read fuse and lock bits");
  Serial.println("Press '3' to read fuse and lock bits");
  Serial.println("Press '4' to read device signature");
  Serial.println("Press '8' to conduct chip erase");
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
    //Enter Programming Mode
    enterProg();
    //In Programming Mode
    progFuses();
    //Exit Programming Mode
    exitProg();
    Serial.println("Finish");
      
  } else if (menuOption == '2'){
    Serial.println("Programming High and Low Fuse Bits");
    enterProg();
    progFuses();
    exitProg();
    
    Serial.println("Reading Fuse and Lock Bits");
    byte rFuse[4];
    Serial.println();
    //Read Low Fuse
    enterProg();
    rFuse[0] = readFuses('L');
    exitProg();
    //Read Low Fuse
    enterProg();
    rFuse[1] = readFuses('H');
    exitProg();
    //Read Extended Fuse
    enterProg();
    rFuse[2] = readFuses('E');
    exitProg();
    //Read Lock Bit
    enterProg();
    rFuse[3] = readFuses('B');
    exitProg();
    
    //Print Values to Terminal
    Serial.print("LFUSE: ");
    Serial.println(rFuse[0], HEX);
    Serial.print("HFUSE: ");
    Serial.println(rFuse[1], HEX);
    Serial.print("EFUSE: ");
    Serial.println(rFuse[2], HEX);
    Serial.print("LOCK BIT: ");
    Serial.println(rFuse[3], HEX);
    
    Serial.println();
    Serial.println("Finish");
    
  } else if (menuOption == '3'){
    byte rFuse[4];
    Serial.println("Reading Fuse and Lock Bits");
    Serial.println();
    //Read Low Fuse
    enterProg();
    rFuse[0] = readFuses('L');
    exitProg();
    //Read Low Fuse
    enterProg();
    rFuse[1] = readFuses('H');
    exitProg();
    //Read Extended Fuse
    enterProg();
    rFuse[2] = readFuses('E');
    exitProg();
    //Read Lock Bit
    enterProg();
    rFuse[3] = readFuses('B');
    exitProg();
    
    //Print Values to Terminal
    Serial.print("LFUSE: ");
    Serial.println(rFuse[0], HEX);
    Serial.print("HFUSE: ");
    Serial.println(rFuse[1], HEX);
    Serial.print("EFUSE: ");
    Serial.println(rFuse[2], HEX);
    Serial.print("LOCK BIT: ");
    Serial.println(rFuse[3], HEX);
    
    Serial.println();
    Serial.println("Finish");
    
  } else if (menuOption == '4'){
    byte rFuse[3];
    Serial.println("Read Device Signature");
    enterProg();
    rFuse[0] = readDeviceSign(0x00);
    exitProg();
    enterProg();
    rFuse[1] = readDeviceSign(0x01);
    exitProg();
    enterProg();
    rFuse[2] = readDeviceSign(0x02);
    exitProg();
    
    //Print Values to Terminal
    Serial.print("0x00: ");
    Serial.println(rFuse[0], HEX);
    Serial.print("0x01: ");
    Serial.println(rFuse[1], HEX);
    Serial.print("0x02: ");
    Serial.println(rFuse[2], HEX);
    
    Serial.println();
    Serial.println("Finish");
    
  } else if (menuOption == '8'){
    Serial.println("Chip Erase and Write Fuse");
    enterProg();
    chipErase(); //conduct chip erase
    progFuses();
    exitProg();
    Serial.println("Finish");
   
  }
  
  menuOption = 0;

}

void enterProg(){
  
  //Initialise Pins for Programming Mode
  digitalWrite(WR, HIGH); //prog_enable pin
  digitalWrite(XA1, LOW); //prog_enable pin
  digitalWrite(XA0, LOW); //prog_enable pin
  digitalWrite(BS1, LOW); //prog_enable pin
  digitalWrite(RST, HIGH); //0V
  digitalWrite(VCC, LOW);

  //Enter Programming Mode
  digitalWrite(VCC, HIGH);
  delayMicroseconds(60);
  digitalWrite(RST, LOW); //Apply +12V
  delayMicroseconds(10);  //Wait before changing prog_enable pins
  delayMicroseconds(300);  //Wait before any parallel programming commands

}

void exitProg(){
  //Exit Programming Mode by power down device or reset pin to 0V.
  digitalWrite(RST, HIGH); //0V

  //Turn off all outputs
  DATA = 0x00;
  delayMicroseconds(5);
  DATAD = 0xFF; // Set digital pins 0-7 as outputs for programming
  delayMicroseconds(5);
  
  digitalWrite(OE, LOW); //Set to 1 if reading fuse bits
  digitalWrite(WR, HIGH); //prog_enable pin
  digitalWrite(XA1, LOW); //prog_enable pin
  digitalWrite(XA0, LOW); //prog_enable pin
  digitalWrite(BS1, LOW); //prog_enable pin
  digitalWrite(VCC, LOW);
  delay(100);
}

void progFuses(){
  //Program HFUSE
  writeFuse(HFUSE, true);

  //Program LFUSE
  writeFuse(LFUSE, false);
}

byte readFuses(char fuseType){
  
  byte fuseValue;
  
  DATAD = 0x00; //Set digital pins to input for reading
  delayMicroseconds(5);
  loadCommand(B00000100);
  digitalWrite(OE, HIGH);
  
  switch (fuseType) {
    case 'L':
      //Read Fuse Low Byte
      digitalWrite(XA1, LOW);//BS2
      digitalWrite(BS1, LOW);
      break;
    case 'H':
      //Read Fuse High Byte
      digitalWrite(XA1, HIGH);//BS2
      digitalWrite(BS1, HIGH);
      break;
    case 'E':
      //Read Fuse Extended Byte
      digitalWrite(XA1, HIGH);//BS2
      digitalWrite(BS1, LOW);
      break;
    case 'B':
      //Read Lock Bits
      digitalWrite(XA1, LOW);//BS2
      digitalWrite(BS1, HIGH);
      break;
  }
  fuseValue = PINB;
  //Finish Read
  DATAD = 0xFF; //Set digital pins to output for programming
  delayMicroseconds(5);
  digitalWrite(OE, LOW);
  digitalWrite(XA1, LOW);
  digitalWrite(BS1, LOW);
  
  return fuseValue;
}

byte readDeviceSign(byte signAddress){
  
  byte signValue;
  delayMicroseconds(5);
  DATAD = 0x00; //Set digital pins to input for reading
  delayMicroseconds(5);
  loadCommand(B00001000);
  loadAddressByte(signAddress);
  digitalWrite(OE, HIGH);
  digitalWrite(BS1, LOW);
  signValue = PINB;
  DATAD = 0xFF; //Set digital pins to output for programming
  delayMicroseconds(5);
  digitalWrite(OE, LOW);
  
  return signValue;
}

void writeFuse(byte fuse, boolean highFuse){
  
  loadCommand(B01000000);
  loadDataByte(fuse);
  //select the fuse byte, see description above.
  if (highFuse){
    //select high data byte
    digitalWrite(BS1, HIGH);
  } else {
    //select low data byte
    digitalWrite(BS1, LOW);
  }
  progDevice();
}

void chipErase(){
  loadCommand(B10000000);
  progDevice();
}


//A: Load Command
void loadCommand (byte command){
  //Enable command loading
  digitalWrite(XA1, HIGH);
  digitalWrite(XA0, LOW);
  digitalWrite(BS1, LOW);
  //Write Command
  DATA = command;
  uploadDataCommand();
}

//C: Load Data Low Byte
void loadDataByte(byte fuseByte) {
  //Enable command loading
  digitalWrite(XA1, LOW);
  digitalWrite(XA0, HIGH);
  //Set Data Low Byte
  DATA = fuseByte;
  uploadDataCommand();
}

void uploadDataCommand(){
  //Load Command by giving XTAL1 positive pulse
  digitalWrite(XTAL1, HIGH);
  delayMicroseconds(1);
  digitalWrite(XTAL1, LOW);
  delayMicroseconds(1);
}

void progDevice(){
  //give WR negative pulse and wait for RDY to go high
  digitalWrite(WR, HIGH);
  delayMicroseconds(1);
  digitalWrite(WR, LOW);
  delayMicroseconds(1);
  // debug RDY
  Serial.print("RDY: ");
  Serial.println(digitalRead(RDY));
  int count = 0;
  while(digitalRead(RDY) == LOW || count<=10){
    //Potential issue and hanging.  Need to debug.
    delayMicroseconds(1000);
    count++;
  }
  if (count==10){
    Serial.print("RDY Timed Out: ");
    Serial.println(digitalRead(RDY));
  } else {
    Serial.print("RDY End: ");
    Serial.println(digitalRead(RDY));
  }
}
  

