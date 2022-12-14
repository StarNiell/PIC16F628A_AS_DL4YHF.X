# About this repo

## General info
This project is simple low-cost digital frequency meter using a PIC 16F628A  
originally created by Wolfgang Buescher, DL4YHF, (based on a work by James Hutchby, MadLab, 1996).
This project is an ex MPLAB 8 project (MPASM Assembly compiler), ported to MPLAB X 6 project (pic-as Assembly compilator)
by Aniello Di Nardo (IU8NQI)   

## Requirements
* A PCB board based on the PIC16F628A designed by Wolfgang Buescher, DL4YHF (available already mounted also on Ebay, AliExpress, etc...)
* Schematic available at: (https://qsl.net/dl4yhf/freq_counter/freq_counter.html)
* MPLAB X v.6 with a XC8 PIC ASSEMBLER (pic-as) compiler
* A standard (or advanced) PIC programmer board (eg: PICkit3, PICkit4, PIC K150, ...)
* HEX available [Here (raw)](https://raw.githubusercontent.com/StarNiell/PIC16F628A_AS_DL4YHF.X/main/dist/default/production/PIC16F628A_AS_DL4YHF.X.production.hex) or [Here (zip)](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/StarNiell/PIC16F628A_AS_DL4YHF.X/blob/main/dist/default/production/PIC16F628A_AS_DL4YHF.X.production.hex)

## Change Log
### 2022-11-27
* *Porting to MPLAB X 6 (pic-as compiler)*
* *Remember to set "-Wl,-PresetVec=0x0" in pic-as global options (Additional Options) of Project Properties*
* *Added 10695000 Hz into IF Table*         
