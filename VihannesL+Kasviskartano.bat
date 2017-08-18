@echo off
@echo VIHANNESLAITILA. Syota pelkka luku, ja paina ENTER
set /p Tuli=Tuli:%=%
set /p Lahti=Lahti:%=%
TYPE nul>Punnitus.txt
if [%Tuli%] == [] set /a Tuli=0
if [%Lahti%] == [] set /a Lahti=0  

@echo Yksikköpaino yleensä 40kg
set /p YksikkoPaino=Yksikko paino:%=%
set /p Nettopaino=Nettopaino:%=%
set /p Kasviskartano=Kasviskartano mukana y/n:%=%


if "%Kasviskartano%" equ "n" (GOTO EI) else (GOTO JA)
:JA 
@echo Syota Tulevat ja lahtevat maara Kasviskartanolle
set /p KTuli=Tuli:%=%
set /p KLahti=Lahti:%=%
@echo Syota Yksikkopaino kasviskartanolle, yleensä 30kg
set /p KYksikkoPaino=Yksikko paino:%=%

if %KTuli% gtr %KLahti% set /a Kerotus=(%KTuli%-%KLahti%)*%KYksikkoPaino%
if %KTuli% equ %KLahti% set /a Kerotus=(%KTuli%-%KLahti%)*%KYksikkoPaino%

if %KLahti% gtr %KTuli% GOTO PL

if %Tuli% gtr %Lahti% set /a Tulos=%Nettopaino%-((%Tuli% - %Lahti%)*%YksikkoPaino%)-%Kerotus%
if %Tuli% gtr %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino% 
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% - %Kerotus% = %Tulos%Kg|clip
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% - %Kerotus% = %Tulos%

if %Tuli% equ %Lahti% set /a Tulos=%Nettopaino%-((%Tuli% - %Lahti%)*%YksikkoPaino%)-%Kerotus%
if %Tuli% equ %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino% 
if %Tuli% equ %Lahti% @echo %Nettopaino% - %Erotus% - %Kerotus% = %Tulos%Kg|clip
if %Tuli% equ %Lahti% @echo %Nettopaino% - %Erotus% - %Kerotus% = %Tulos%  

if %Tuli% lss %Lahti% set /a Tulos=%Nettopaino%+((%Lahti% - %Tuli%)*%YksikkoPaino%)-%Kerotus%
if %Tuli% lss %Lahti% set /a Erotus=(%Lahti%-%Tuli%)*%Yksikkopaino% 
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus%-%Kerotus% = %Tulos%Kg|clip
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus%-%Kerotus% = %Tulos% 

@echo Laskelma kopioitu leikepoydalle
(
echo Vihanneslaitila
echo Tuli:%Tuli% Lähti: %Lahti%
echo ----
echo Kasviskartano 
echo Tuli: %KTuli% Lähti: %Klahti%
echo ----
if %Tuli% equ %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% - %Kerotus% = %Tulos%Kg  
if %Tuli% lss %Lahti% @echo Nettopaino: %Nettopaino% + %Erotus%-%Kerotus% = %Tulos%Kg 
if %Tuli% gtr %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% - %Kerotus% = %Tulos%Kg
) >> Punnitus.txt
Start notepad "Punnitus.txt"
Pause
EXIT

:PL
set /a Kerotus=(%KLahti%-%KTuli%)*%KYksikkoPaino%
if %Tuli% gtr %Lahti% set /a Tulos=%Nettopaino%-((%Tuli% - %Lahti%)*%YksikkoPaino%)+%Kerotus%
if %Tuli% gtr %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino% 
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% + %Kerotus% = %Tulos%Kg|clip
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% + %Kerotus% = %Tulos% 

if %Tuli% equ %Lahti% set /a Tulos=%Nettopaino%-((%Tuli% - %Lahti%)*%YksikkoPaino%)+%Kerotus%
if %Tuli% equ %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino% 
if %Tuli% equ %Lahti% @echo %Nettopaino% - %Erotus% + %Kerotus% = %Tulos%Kg|clip
if %Tuli% equ %Lahti% @echo %Nettopaino% - %Erotus% + %Kerotus% = %Tulos% 

if %Tuli% lss %Lahti% set /a Tulos=%Nettopaino%+((%Lahti% - %Tuli%)*%YksikkoPaino%)+%Kerotus%
if %Tuli% lss %Lahti% set /a Erotus=(%Lahti%-%Tuli%)*%Yksikkopaino% 
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus%+%Kerotus% = %Tulos%Kg|clip
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus%+%Kerotus% = %Tulos% 
@echo Laskelma kopioitu leikepoydalle
(
echo Vihanneslaitila
echo Tuli:%Tuli% Lähti: %Lahti%
echo ----
echo Kasviskartano 
echo Tuli: %KTuli% Lähti: %Klahti%
echo ----
if %Tuli% gtr %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% + %Kerotus% = %Tulos%Kg 
if %Tuli% equ %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% + %Kerotus% = %Tulos%Kg 
if %Tuli% lss %Lahti% @echo Nettopaino: %Nettopaino% + %Erotus%+%Kerotus% = %Tulos%Kg 
) >> Punnitus.txt
Start notepad "Punnitus.txt"
PAUSE
EXIT
:EI
if %Tuli% gtr %Lahti% set /a Tulos=%Nettopaino%-((%Tuli% - %Lahti%)*%YksikkoPaino%)
if %Tuli% gtr %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino% 
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% = %Tulos%Kg|clip 
if %Tuli% gtr %Lahti% @echo %Nettopaino% - %Erotus% = %Tulos% 

if %Tuli% lss %Lahti% set /a Tulos=%Nettopaino%+((%Lahti% - %Tuli%)*%YksikkoPaino%) 
if %Tuli% lss %Lahti% set /a Erotus=(%Lahti%-%Tuli%)*%Yksikkopaino% 
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus% = %Tulos%Kg|clip
if %Tuli% lss %Lahti% @echo %Nettopaino% + %Erotus% = %Tulos% 
if %Tuli% equ %Lahti% @echo Ei laskettavaa
@echo Laskelma kopioitu leikepoydalle
(
echo Vihanneslaitila
echo Tuli:%Tuli% Lähti: %Lahti%
echo ----
if %Tuli% gtr %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% = %Tulos%Kg 
if %Tuli% lss %Lahti% @echo Nettopaino: %Nettopaino% + %Erotus% = %Tulos%Kg 
) >> Punnitus.txt
Start notepad "Punnitus.txt"
PAUSE