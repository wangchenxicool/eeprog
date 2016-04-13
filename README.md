# eeprog
http://www.codesink.org/eeprog.html

 eeprog is a Linux C program that allows you to read and write to 24Cxx EEPROM.

24Cxx EEPROM use the I2C protocol but most common controllers found in most PC hardware only support SMBus (a superset of I2C).

What eeprog does is using SMBus commands to read/write to I2C EEPROM so almost every controller could be used.

To use it you have to connect someway a 24Cxx EEPROM to the SMBus bus of your PC.
I connected a 24C32(32kbit EEPROM) to the I2C connector of my Via Epia board but you could use one of those parallel-to-I2C devices (I've never seen/used one of those). 
