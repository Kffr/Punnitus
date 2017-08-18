@echo off
TYPE nul>Punnitus.txt
@echo Syota pelkka luku, ja paina ENTER
set /p Tuli=Tuli:%=%
set /p Lahti=Lahti:%=%

if [%Tuli%] == [] set /a Tuli=0
if [%Lahti%] == [] set /a Lahti=0  

@echo Perunat,Vihanneslaitila 40kg; Kasviskartano 30kg; Seulavihannes 67kg\
set /p YksikkoPaino=Yksikko paino:%=%
set /p Nettopaino=Nettopaino:%=%
if %Tuli% gtr %Lahti% set /a Tulos=%Nettopaino%-((%Tuli% - %Lahti%)*%YksikkoPaino%)
if %Tuli% gtr %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino%
 
if %Tuli% gtr %Lahti% @echo Tuli: %Tuli%	 Lahti: %Lahti% 	Nettopaino: %Nettopaino% - %Erotus% = %Tulos%Kg |clip 
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% = %Tulos% 

if %Tuli% lss %Lahti% set /a Tulos=%Nettopaino%+((%Lahti% - %Tuli%)*%YksikkoPaino%) 
if %Tuli% lss %Lahti% set /a Erotus=(%Lahti%-%Tuli%)*%Yksikkopaino% 
if %Tuli% lss %Lahti% @echo Tuli: %Tuli%	 Lahti: %Lahti% 	Nettopaino: %Nettopaino%  + %Erotus% = %Tulos%Kg|clip
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus% = %Tulos% 

if %Tuli% equ %Lahti% @echo Ei laskettavaa
if %Tuli% neq %Lahti% @echo Laskelma kopioitu leikepoydalle
(

echo Tuli:%Tuli% Lähti: %Lahti%
echo ----
if %Tuli% lss %Lahti% @echo Nettopaino: %Nettopaino% + %Erotus% = %Tulos%Kg 
if %Tuli% gtr %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% = %Tulos%Kg 
) >> Punnitus.txt
Start notepad "Punnitus.txt"

PAUSE







