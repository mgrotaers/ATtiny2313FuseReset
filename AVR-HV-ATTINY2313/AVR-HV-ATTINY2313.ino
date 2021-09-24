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

//Menu Control
int menuOption = 0; // for incoming serial data

//Desired fuse configuration
#define HFUSE 0xDB 
#define LFUSE 0xE4

//Pin Assignment on Arduino
#define DATA PORTB //Digital Pins 0-7
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
  // Setup control line for HV parallel programming from Arduino perspective
  DATA = 0x00; // Clear digital pins 0-7
  DATAD = 0xFF; // Set digital pins 0-7 as outputs for programming
  pinmode(VCC, OUTPUT);
  pinmode(RDY, INPUT);
  pinmode(OE, OUTPUT); //Inverted
  pinmode(WR, OUTPUT); //Inverted
  pinmode(BS1, OUTPUT);
  pinmode(XA0, OUTPUT);
  pinmode(XA1, OUTPUT);
  pinmode(RST, OUTPUT); //+12V Signal to chip, Inverted
  pinmode(XTAL1, OUTPUT);
  
  //Initialise output pin RST so 12V is shut off at 0V
  digitalWrite(RST, HIGH);
  
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

    // say what you got:
    if(menuOption == 1){
      Serial.println("Programming High and Low Fuse Bits");
      //Enter Programming Mode
      enterProg();
      //In Programming Mode
      progFuses();
      //Exit Programming Mode
      exitProg();
      
    } else if (menuOption == 2){
      Serial.println("Programming High and Low Fuse Bits");
      Serial.println("Reading Fuse and Lock Bits");
      //Enter Programming Mode
      enterProg();
      //In Programming Mode
      progFuses();  //program fuse bits
      readFuses(); //read fuse bits
      //Exit Programming Mode
      exitProg();
      
    } else if (menuOption == 3){
      Serial.println("Reading Fuse and Lock Bits");
      //Enter Programming Mode
      enterProg();
      //In Programming Mode
      readFuses(); //read fuse bits
      //Exit Programming Mode
      exitProg();
    }
    
  }

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

void progFuses(){
  //Program HFUSE
  writeFuse(HFUSE, true);

  //Program LFUSE
  writeFuse(LFUSE, false);
}

void readFuses(){
  loadCommand(B00000100);
  //Start Read
  DATAD = 0x00; //Set digital pins to input for reading
  delayMicroseconds(5);
  digitalWrite(OE, HIGH);
  //Read Fuse Low Bit
  digitalWrite(XA1, LOW);//BS2
  digitalWrite(BS1, LOW);
  Serial.print("LFUSE: ");
  Serial.println(digitalRead(DATA));
  //Read Fuse High Bit
  digitalWrite(XA1, HIGH);//BS2
  digitalWrite(BS1, HIGH);
  Serial.print("HFUSE: ");
  Serial.println(DATA);
  //Read Fuse Extended Bit
  digitalWrite(XA1, HIGH);//BS2
  digitalWrite(BS1, LOW);
  Serial.print("EFUSE: ");
  Serial.println(DATA);
  //Finish Read
  DATAD = 0xFF; //Set digital pins to output for programming
  delayMicroseconds(5);
  digitalWrite(OE, LOW);
  digitalWrite(XA1, LOW);
  digitalWrite(BS1, LOW);
  
}

void exitProg(){
  //Exit Programming Mode by power down device or reset pin to 0V.
  digitalWrite(RST, HIGH); //0V

  //Turn off all outputs
  DATA = 0x00;
  
  digitalWrite(OE, LOW); //Set to 1 if reading fuse bits
  digitalWrite(WR, LOW); //prog_enable pin
  digitalWrite(XA1, LOW); //prog_enable pin
  digitalWrite(XA0, LOW); //prog_enable pin
  digitalWrite(BS1, LOW); //prog_enable pin
  digitalWrite(VCC, LOW);
}


//A: Load Command
void loadCommand (byte command){
  //Enable command loading
  digitalWrite(XA1, HIGH);
  digitalWrite(XA0, LOW);

  digitalWrite(BS1, LOW);
  //Write Command
  DATA = command;
  //Load Command by giving XTAL1 positive pulse
  digitalWrite(XTAL1, HIGH);
  delay(1);
  digitalWrite(XTAL1, LOW);
}

//C: Load Data Low Byte
void loadDataByte(byte fuseByte) {
  //Enable command loading
  digitalWrite(XA1, LOW);
  digitalWrite(XA0, HIGH);
  //Set Data Low Byte
  DATA = fuseByte;
  //Load Command by giving XTAL1 positive pulse
  digitalWrite(XTAL1, HIGH);
  delay(1);
  digitalWrite(XTAL1, LOW);
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
  //give WR negative pulse and wait for RDY to go high
  digitalWrite(WR, HIGH);
  delay(1);
  digitalWrite(WR, LOW);
  while(digitalRead(RDY, LOW){
    delay(1);
  }
}
