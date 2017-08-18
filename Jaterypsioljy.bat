@echo off
TYPE nul>Punnitus.txt
@echo Syota luku ja paina enter.
set /p Tuli=Tuli:%=%
set /p Lahti=Lahti:%=%
set /p Tyhjat=Tyhjat:%=%
if [%Tuli%] == [] set /a Tuli=0
if [%Lahti%] == [] set /a Lahti=0  
if [%Tyhjat%] == [] set /a Tyhjat=0

@echo Jaterypsioljyn yksikkopaino 55kg
set /a YksikkoPaino="55"
set /p Nettopaino=Nettopaino:%=%
if %Tuli% gtr %Lahti% set /a Tulos=%Nettopaino%-(%Tyhjat%*%YksikkoPaino%)+((%Tuli% - %Lahti%)*%YksikkoPaino%)
if %Tuli% gtr %Lahti% set /a Tyhjia=%Tyhjat%*%YksikkoPaino%
if %Tuli% gtr %Lahti% set /a Erotus=(%Tuli%-%Lahti%)*%Yksikkopaino% 
if %Tuli% gtr %Lahti% @echo Tuli: %Tuli% Lahti: %Lahti% %Tyhjia%, @echo %Nettopaino% + %Erotus% - %Tyhjia% = %Tulos%Kg|clip 
if %Tuli% gtr %Lahti% @echo %Nettopaino% + %Erotus% - %Tyhjia% = %Tulos% 

if %Tuli% lss %Lahti% set /a Tulos=%Nettopaino%-(%Tyhjat%*%YksikkoPaino%)-((%Lahti% - %Tuli%)*%YksikkoPaino%) 
if %Tuli% lss %Lahti% set /a Tyhjia=%Tyhjat%*%YksikkoPaino%
if %Tuli% lss %Lahti% set /a Erotus=(%Lahti%-%Tuli%)*%Yksikkopaino% 
if %Tuli% lss %Lahti% @echo Tuli: %Tuli% Lahti: %Lahti% %Tyhjia%, %Nettopaino% - %Erotus% -%Tyhjia% = %Tulos%Kg|clip
if %Tuli% lss %Lahti% @echo %Nettopaino% - %Erotus% -%Tyhjia% = %Tulos% 

if %Tuli% equ %Lahti% set /a Tulos=%Nettopaino%-(%Tyhjat%*%YksikkoPaino%)-((%Lahti% - %Tuli%)*%YksikkoPaino%) 
if %Tuli% equ %Lahti% set /a Tyhjia=%Tyhjat%*%YksikkoPaino%
if %Tuli% equ %Lahti% set /a Erotus=(%Lahti%-%Tuli%)*%Yksikkopaino% 
if %Tuli% equ %Lahti% @echo %Nettopaino% - %Erotus% -%Tyhjia% = %Tulos% 
if %Tuli% equ %Lahti% @echo Tuli: %Tuli% Lahti: %Lahti% Tyhjia: %Tyhjat%,  %Nettopaino% - %Erotus% -%Tyhjia% = %Tulos%Kg|clip

if %Tuli% neq %Lahti% @echo Laskelma kopioitu leikepoydalle
(
echo Tuli:%Tuli% Lähti: %Lahti% Tyhjät: %Tyhjat%
echo ----
if %Tuli% gtr %Lahti% @echo Nettopaino: %Nettopaino% + %Erotus% - %Tyhjia% = %Tulos%Kg
if %Tuli% lss %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% -%Tyhjia% = %Tulos%Kg 
if %Tuli% equ %Lahti% @echo Nettopaino: %Nettopaino% - %Erotus% -%Tyhjia% = %Tulos%Kg 
) >> Punnitus.txt
Start notepad "Punnitus.txt"
PAUSE