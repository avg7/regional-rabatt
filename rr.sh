#!/bin/sh

while :
do

sleep 1

# Beenden bei Fehlern
set -uf 

RAND1=$(</dev/urandom /usr/bin/tr -dc 'A-Za-z0-9' | /usr/bin/head -c 100)

# Verzeichnis erstellen
tmpDir="/tmp/temp.$RAND1.$$"
(umask 077 && /bin/mkdir "${tmpDir}") || {
  /bin/echo "Could not create temporary directory! Exiting." 1>&2
  exit 1
}

# Dateien zuordnen
OUTPUT="${tmpDir}"/"OUTPUT"
OUTPUT1="${tmpDir}"/"OUTPUT1"
OUTPUT2="${tmpDir}"/"OUTPUT2"
OUTPUT3="${tmpDir}"/"OUTPUT3"
OUTPUT4="${tmpDir}"/"OUTPUT4"
OUTPUT5="${tmpDir}"/"OUTPUT5"
OUTPUT6="${tmpDir}"/"OUTPUT6"
OUTPUT7="${tmpDir}"/"OUTPUT7"
OUTPUT8="${tmpDir}"/"OUTPUT8"
OUTPUT9="${tmpDir}"/"OUTPUT9"
OUTPUT10="${tmpDir}"/"OUTPUT10"
OUTPUT11="${tmpDir}"/"OUTPUT11"
OUTPUT12="${tmpDir}"/"OUTPUT12"
OUTPUT13="${tmpDir}"/"OUTPUT13"
OUTPUT14="${tmpDir}"/"OUTPUT14"
OUTPUT15="${tmpDir}"/"OUTPUT15"
OUTPUT16="${tmpDir}"/"OUTPUT16"
OUTPUT17="${tmpDir}"/"OUTPUT17"
OUTPUT19="${tmpDir}"/"OUTPUT19"
OUTPUT20="${tmpDir}"/"OUTPUT20"
OUTPUT21="${tmpDir}"/"OUTPUT21"

# Dateien erstellen
> "${tmpDir}"/"OUTPUT"
> "${tmpDir}"/"OUTPUT1"
> "${tmpDir}"/"OUTPUT2"
> "${tmpDir}"/"OUTPUT3"
> "${tmpDir}"/"OUTPUT4"
> "${tmpDir}"/"OUTPUT5"
> "${tmpDir}"/"OUTPUT6"
> "${tmpDir}"/"OUTPUT7"
> "${tmpDir}"/"OUTPUT8"
> "${tmpDir}"/"OUTPUT9"
> "${tmpDir}"/"OUTPUT10"
> "${tmpDir}"/"OUTPUT11"
> "${tmpDir}"/"OUTPUT12"
> "${tmpDir}"/"OUTPUT13"
> "${tmpDir}"/"OUTPUT14"
> "${tmpDir}"/"OUTPUT15"
> "${tmpDir}"/"OUTPUT16"
> "${tmpDir}"/"OUTPUT17"
> "${tmpDir}"/"OUTPUT19"
> "${tmpDir}"/"OUTPUT20"
> "${tmpDir}"/"OUTPUT21"

# Alle Dateien löschen bei bestimmter Aktion
function trapCleanup() {
  if [ -d "${tmpDir}" ]; then
    /bin/rm -r "${tmpDir}"
  else
    :
fi
}

trap trapCleanup EXIT INT TERM QUIT

while [ ! -f "${tmpDir}"/"OUTPUT18" ]; 
do
# PGP-Fingerprint (Rabattcode) von Smartcard prüfen:
/usr/bin/gpg --card-status > "$OUTPUT1"
# Zeile welche den PGP-Fingerprint des PGP-Schlüssels welcher zum Signieren genutzt wird in die Datei "OUTPUT2" einfügen:
/bin/grep -i "Signature key" "$OUTPUT1" > "$OUTPUT2"
# Script erst ausführen wenn Smartcard verbunden ist
if [[ -s "$OUTPUT2" ]]
then
/bin/touch "${tmpDir}"/"OUTPUT18"
else
:
fi
sleep 1; 
done

# Erste 21 Zeichen in der ersten Zeile dieser Datei welche den PGP-Fingerprint enthält entfernen, sodass nur noch der PGP-Fingerprint sichtbar ist:
/usr/bin/cut -c 21- "$OUTPUT2" > "$OUTPUT3"

# PGP-Fingerprint-Leerzeichen entfernen:
/bin/sed -ri 's/\s+//g' "$OUTPUT3"

# In der Rabattcode-Liste nach der Zeile suchen welche den gesuchten PGP-Fingerprint enthält, und wenn dieser gefunden wurde, diese Zeile in welcher der PGP-Fingerprint sich befindet in die Datei "OUTPUT4" einfügen: 
/bin/grep -i "$(/bin/cat  "$OUTPUT3")" "/media/usb/daten/rr-liste.txt" > "$OUTPUT4"
/bin/sed -i 's/,/ /g' "$OUTPUT4"
/bin/sed -i 's/[\["]//g' "$OUTPUT4"
/bin/sed -i 's/\]//g' "$OUTPUT4"


# Die RR-Nummer von Ihrem Unternehmen aus der Datei "rr-nr.txt" in der Rabattcode-Liste, in der Zeile in welcher sich der PGP-Fingerprint befindet suchen, und wenn diese vorhanden ist, in die Datei "OUTPUT19" einfügen: 
/bin/grep -i "$(/bin/cat  "$OUTPUT3")" "/media/usb/daten/rr-liste.txt" | /bin/grep -o "$(/bin/cat  "/media/usb/daten/rr-nr.txt")" > "$OUTPUT19"

# Wenn die Datei "$OUTPUT4" die Zeile mit dem gesuchten PGP-Fingerprint enthält extrahieren wir das Datum aus der Zeile welche den PGP-Fingerprint enthält und fügen dieses Datum in die Datei "OUTPUT5" ein:
if [ -s "$OUTPUT4" ]
then
/bin/grep -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" "$OUTPUT4" > "$OUTPUT5"
else
:
fi

# Nun wird berechnet ob der Rabattcode (PGP-Fingerprint) noch gültig ist:
first="$(/bin/cat "$OUTPUT5")"
now="$( /bin/date +%F)"
difference=$((($( /bin/date +%s --date "$first")-$( /bin/date +%s --date "$now"))/(3600*24)))

if [ "$difference" -le 0 ]
then
     /bin/echo "RABATTCODE UNGÜLTIG" > "$OUTPUT7"

else
     /bin/echo "RABATTCODE GÜLTIG" > "$OUTPUT7"


if [ -s "$OUTPUT19" ]
then
/bin/echo "Maximal 4 % Rabatt pro Monat, maximal 10 Euro Rabatt pro Monat" >> "$OUTPUT7"

else
/bin/echo "Kein Rabatt, außer bei Aktionsangeboten" >> "$OUTPUT7"
fi

fi

if [ -s "$OUTPUT4" ]
then
:

else

     /bin/echo "RABATTCODE NICHT GEFUNDEN" > "$OUTPUT7"


fi



# Seriennummer von Smartcard prüfen:
/usr/bin/gpg-connect-agent "scd learn --force" /bye > "$OUTPUT10"

# Zeile welche die Seriennummer der Smartcard enthält in die Datei "OUTPUT11" einfügen:
/bin/grep -i "SERIALNO" "$OUTPUT10" > "$OUTPUT11"

# Erste 11 Zeichen in der ersten Zeile dieser Datei welche die Seriennummer enthält entfernen, sodass nur noch die Seriennummer sichtbar ist:
/usr/bin/cut -c 11- "$OUTPUT11" > "$OUTPUT12"

# Nach einem PGP-Schlüssel-Stub suchen welcher die gesuchte Seriennummer enthält, und wenn diese gefunden wurde, diese Zeile in welcher sich die Seriennummer befindet in die Datei "OUTPUT13" einfügen: 
/usr/bin/gpg-connect-agent 'keyinfo --list' /bye | /bin/grep -i "$(/bin/cat "$OUTPUT12")" > "$OUTPUT13"

# Seriennummer in Datei "kunden.txt" suchen und anzeigen an welchen Tagen der Kunde den Rabattcode eingelöst hat:
kunde1="$(/bin/cat "$OUTPUT12")"
/bin/grep -i "$kunde1" "/media/usb/daten/kunden.txt" > "$OUTPUT14"

if [ -s "$OUTPUT14" ]
then
/bin/echo "Kunde hat diesen Rabattcode an folgenden Tagen eingelöst oder versucht einzulösen:" > "$OUTPUT15"
else
:
fi
/bin/grep -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" "$OUTPUT14" >> "$OUTPUT15"
/bin/cat  "$OUTPUT15" >> "$OUTPUT16"

# Aktuelle Datum bei Rabattcode-Einlösung zu Seriennummer hinzufügen:
/bin/sed -i "s/\$/ "$now"/" "$OUTPUT12"

# Erste Zeile in der Liste der Seriennummern in die Datei "kunden.txt" einfügen:
/usr/bin/head -1 "$OUTPUT12" >> "/media/usb/daten/kunden.txt"
/usr/bin/awk '!seen[$0]++' "/media/usb/daten/kunden.txt" > "$OUTPUT9"
/bin/cat "$OUTPUT9" > "/media/usb/daten/kunden.txt"

if [ -s "$OUTPUT13" ]
then
:

else

     /bin/echo "RABATTCODE UNGÜLTIG" > "$OUTPUT7"


fi


# In dem Bestell-Listen-Ordner die Liste (Text-Datei) finden, in welcher der PGP-Fingerprint (Rabattcode) enthalten ist und dann die Zeile finden in welcher das heutige Datum und die Bestellung enthalten ist:
rcode="$(/bin/cat "$OUTPUT3")"
/bin/echo "Rabattcode: $(/bin/cat "$OUTPUT3")" >> "$OUTPUT8"

/bin/grep -inrl "$rcode" "/media/usb/daten/bestellungen" > "$OUTPUT20"



if [ -s "$OUTPUT20" ]
then
/bin/grep -i "$now" "$(/bin/cat "$OUTPUT20")" >> "$OUTPUT8"
else
:
fi

if [ -s "$OUTPUT8" ]
then 
/bin/echo "Bestellungen:" > "$OUTPUT17"
/bin/cat  "$OUTPUT8" >> "$OUTPUT17"
dirn="$(/bin/cat "$OUTPUT20")"
/usr/bin/awk 'NR==2' "$dirn" > "$OUTPUT21"
/bin/echo "" >> "$OUTPUT17"
/bin/echo "Mit gültigem Rabattcode maximal "$(/bin/cat "$OUTPUT21")" Rabatt pro Abholtag" >> "$OUTPUT17"
else
:
fi


# Ergebnis: 
Ergebnis="$(/bin/cat "$OUTPUT7")"  
Ergebnis2="$(/bin/cat "$OUTPUT16")"  
Ergebnis3="$(/bin/cat "$OUTPUT17")"  
for tty in /dev/tty1
do
 /bin/echo "" > "$tty"
 /bin/echo "$Ergebnis" > "$tty"
 /bin/echo "" > "$tty"
 /bin/echo "$Ergebnis2" > "$tty"
 /bin/echo "" > "$tty"
 /bin/echo "$Ergebnis3" > "$tty"
 /bin/echo "" > "$tty"
done



# Dateien löschen
/bin/rm -r "${tmpDir}"
/bin/rm -r "/root/.gnupg/private-keys-v1.d/"
/bin/mkdir "/root/.gnupg/private-keys-v1.d/"
/bin/chmod 700 "/root/.gnupg/private-keys-v1.d/"

done
