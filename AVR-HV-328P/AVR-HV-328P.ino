//Desired fuse configuration
#define HFUSE 0xDF
#define LFUSE 0x62

//Pin Assignment on Arduino
#define DATA PORTD //Digital Pins 0-7
#define DATAD DDRD //Data direction register for DATA port

#define VCC     8
#define RDY     12
#define OE      11
#define WR      10
#define BS1     9
#define XA0     13
#define XA1     18 //A4
#define PAGEL   19 //A5
#define RST     14 //A0
#define BS2     16 //A2
#define XTAL1   17 //A3

#define BUTTON  15 //A1


void setup() {
  // Setup control line for HV parallel programming from Arduino perspective
  DATA = 0x00; // Clear digital pins 0-7
  DATAD = 0xFF; // Set digital pins 0-7 as outputs
  pinmode(VCC, OUTPUT);
  pinmode(RDY, INPUT);
  pinmode(OE, OUTPUT); //Inverted
  pinmode(WR, OUTPUT); //Inverted
  pinmode(BS1, OUTPUT);
  pinmode(XA0, OUTPUT);
  pinmode(XA1, OUTPUT);
  pinmode(PAGEL, OUTPUT);
  pinmode(RST, OUTPUT); //+12V Signal to chip, Inverted
  pinmode(BS2, OUTPUT);
  pinmode(XTAL1, OUTPUT);

  pinmode(BUTTON, INPUT);
  digitalWrite(BUTTON, HIGH); //turn on pullup resistor

  //Initialise output pin RST so 12V is shut off at 0V
  digitalWrite(RST, HIGH);

}

void loop() {
  // wait for button pressed then start HV programming
  while(digitalRead(BUTTON)==HIGH){
    //do nothing
  }
  //Button pressed, now start HV programming of fuses
  //Initialise Pins for Programming Mode
  digitalWrite(PAGEL, LOW); //prog_enable pin
  digitalWrite(XA1, LOW); //prog_enable pin
  digitalWrite(XA0, LOW); //prog_enable pin
  digitalWrite(BS1, LOW); //prog_enable pin
  digitalWrite(BS2, LOW);
  digitalWrite(RST, HIGH); //0V
  digitalWrite(VCC, LOW);

  //Enter Programming Mode
  digitalWrite(VCC, HIGH);
  delayMicroseconds(60);
  digitalWrite(RST, LOW); //Apply +12V
  delayMicroseconds(10);  //Wait before changing prog_enable pins
  delayMicroseconds(300);  //Wait before any parallel programming commands

  //In Programming Mode
  //Program HFUSE
  writeFuse(HFUSE, true);

  //Program LFUSE
  writeFuse(LFUSE, false);

  //Exit Programming Mode by power down device or reset pin to 0V.
  digitalWrite(RST, HIGH); //0V

  //Turn off all outputs
  DATA = 0x00;
  
  digitalWrite(WR, LOW);
  digitalWrite(OE, LOW); //Set to 1 if reading fuse bits
  digitalWrite(PAGEL, LOW); //prog_enable pin
  digitalWrite(XA1, LOW); //prog_enable pin
  digitalWrite(XA0, LOW); //prog_enable pin
  digitalWrite(BS1, LOW); //prog_enable pin
  digitalWrite(BS2, LOW);
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

void writeFuse(byte fuse, boolean highFuse){//, boolean extendedFuse){
  loadCommand(B01000000);
  loadDataByte(fuse);
  //select the fuse byte, see description above.
  if (highFuse){
    //select high data byte
    digitalWrite(BS1, HIGH);
    digitalWrite(BS2, LOW);
  /*} else if (extendedFuse){
    //select extended data byte
    digitalWrite(BS1, LOW);
    digitalWrite(BS2, HIGH);*/
  } else {
    //select low data byte
    digitalWrite(BS1, LOW);
    digitalWrite(BS2, LOW);
  }
  //give WR negative pulse and wait for RDY to go high
  digitalWrite(WR, HIGH);
  delay(1);
  digitalWrite(WR, LOW);
  while(digitalRead(RDY, LOW){
    delay(1);
  }
}
