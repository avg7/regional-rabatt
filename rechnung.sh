#!/bin/bash
# Bevor Sie diese Datei nutzen können, müssen Sie Ihre Produkte und Umsatzsteuersätze in diese Datei eintragen. Begeben Sie sich in den Ordner, in welchem Sich die über regional-rabatt.de erstellte Bestell-Liste befindet (bestellung.txt), kopieren Sie diese Datei ("rechnung.sh") in diesen Ordner und öffnen Sie in diesem Ordner ein Terminal. Erstellen Sie in diesem Ordner eine Datei namens "rechnung.txt", welche den Name des Rechnungsstellers und dessen Anschrift, sowie "USt-IdNr." oder Steuernummer enthält. Geben Sie nun folgenden Befehl in das Terminal ein: "/bin/bash "rechnung.sh"". Die Rechnung ("rechnung.txt") ist nun vollständig, verschieben Sie nun die Rechnung ("rechnung.txt") aus diesem Ordner in einen anderen Ordner.

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
OUTPUT18="${tmpDir}"/"OUTPUT18"
OUTPUT19="${tmpDir}"/"OUTPUT19"
OUTPUT20="${tmpDir}"/"OUTPUT20"
OUTPUT21="${tmpDir}"/"OUTPUT21"
OUTPUT22="${tmpDir}"/"OUTPUT22"
OUTPUT23="${tmpDir}"/"OUTPUT23"
OUTPUT24="${tmpDir}"/"OUTPUT24"
OUTPUT25="${tmpDir}"/"OUTPUT25"
OUTPUT26="${tmpDir}"/"OUTPUT26"
OUTPUT30="${tmpDir}"/"OUTPUT30"
OUTPUT39="${tmpDir}"/"OUTPUT39"
OUTPUT40="${tmpDir}"/"OUTPUT40"
OUTPUT41="${tmpDir}"/"OUTPUT41"
OUTPUT42="${tmpDir}"/"OUTPUT42"
OUTPUT43="${tmpDir}"/"OUTPUT43"
OUTPUT44="${tmpDir}"/"OUTPUT44"
OUTPUT45="${tmpDir}"/"OUTPUT45"
OUTPUT46="${tmpDir}"/"OUTPUT46"

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
> "${tmpDir}"/"OUTPUT18"
> "${tmpDir}"/"OUTPUT19"
> "${tmpDir}"/"OUTPUT20"
> "${tmpDir}"/"OUTPUT21"
> "${tmpDir}"/"OUTPUT22"
> "${tmpDir}"/"OUTPUT23"
> "${tmpDir}"/"OUTPUT24"
> "${tmpDir}"/"OUTPUT25"
> "${tmpDir}"/"OUTPUT26"
> "${tmpDir}"/"OUTPUT30"
> "${tmpDir}"/"OUTPUT39"
> "${tmpDir}"/"OUTPUT40"
> "${tmpDir}"/"OUTPUT41"
> "${tmpDir}"/"OUTPUT42"
> "${tmpDir}"/"OUTPUT43"
> "${tmpDir}"/"OUTPUT44"
> "${tmpDir}"/"OUTPUT45"
> "${tmpDir}"/"OUTPUT46"


# Alle Dateien löschen bei bestimmter Aktion
#function trapCleanup() {
#  if [ -d "${tmpDir}" ]; then
#    /bin/rm -r "${tmpDir}"
#  else
#    :
#fi
#}

#trap trapCleanup EXIT INT TERM QUIT
RAND2=$(</dev/urandom /usr/bin/tr -dc 'A-Z0-9' | /usr/bin/head -c 15)
tab="$( printf "\t" )"
now="Rechnungsdatum:"$tab""$( /bin/date "+%d. %B %G")"";
now2="Lieferdatum entspricht dem nachfolgend je Produkt vom Kunde angegebenen Abholdatum";
/bin/echo "$now" >> "rechnung.txt";
/bin/echo "$now2" >> "rechnung.txt";
knummer="Rechnungsnummer: "$( /bin/date "+%F")"-"$RAND2"";
/bin/echo "$knummer" >> "rechnung.txt";
/usr/bin/awk 'NR==1' "bestellung.txt" > "$OUTPUT46"
fp1="$(/bin/cat "$OUTPUT46")";
/bin/echo "Kundennummer (Rabattcode): $fp1" >> "rechnung.txt";
/bin/echo ""  >> "rechnung.txt"
/bin/echo ""  >> "rechnung.txt"
/bin/echo "Abholdatum      Nr.     Beschreibung    Menge                    Preis         Umsatzsteuersatz" >> "rechnung.txt"

#### Beispielprodukte bitte ersetzen
/bin/grep -e "Apfelsaft" -e "Möhren" -e "Käse" "bestellung.txt" > "$OUTPUT";

TEMPFILE="$OUTPUT17"
/bin/echo 2 > "$TEMPFILE"
xl="$(/usr/bin/awk 'END{ print NR}' "bestellung.txt")"
xl2="$((""$xl"-1"))"
for (( i=0; i<"$xl2"; ++i));
do
COUNTER="$[$(/bin/cat "$TEMPFILE") + 1 ]"
x="$(/bin/cat "$TEMPFILE")"

> "${tmpDir}"/"OUTPUT5"
> "${tmpDir}"/"OUTPUT7"
> "${tmpDir}"/"OUTPUT8"
> "${tmpDir}"/"OUTPUT9"
> "${tmpDir}"/"OUTPUT10"
> "${tmpDir}"/"OUTPUT16"
> "${tmpDir}"/"OUTPUT20"
> "${tmpDir}"/"OUTPUT23"




/usr/bin/awk "NR==$x" "bestellung.txt" > "$OUTPUT1";

#### Beispielprodukt bitte ersetzen
/bin/grep -o -e "Apfelsaft" -e "Möhren" -e "Käse" "$OUTPUT1" > "$OUTPUT2";

var1="$(/bin/cat "$OUTPUT2")";

if [ -s "$OUTPUT2" ]
then

#### Beispielprodukt bitte ersetzen
if [ "$var1" == "Apfelsaft" ]
then 
/bin/echo "0.002" > "$OUTPUT3"
/bin/echo "1.07" > "$OUTPUT7"

#### Beispielprodukt bitte ersetzen
elif [ "$var1" == "Möhren" ]
then 
/bin/echo "0.002" > "$OUTPUT3"
/bin/echo "1.19" > "$OUTPUT8"

### Für ein neues Produkt diesen Abschitt kopieren und Bezeichnung, Preise sowie USt-Satz ersetzen.
elif [ "$var1" == "Käse" ]
then 
/bin/echo "0.002" > "$OUTPUT3"
/bin/echo "1.19" > "$OUTPUT8"
###

else
/bin/echo "" > "$OUTPUT1"

fi
fi




/usr/bin/awk '{ print $NF }' "$OUTPUT1" > "$OUTPUT4";
var2="$(/bin/cat "$OUTPUT4")";
varp2="$(/bin/cat "$OUTPUT3")";

usts="$(/usr/bin/cut -c 4- "$OUTPUT7") %";
usts2="$(/usr/bin/cut -c 3- "$OUTPUT8") %";
if [ -s "$OUTPUT3" ]
then
/usr/bin/awk "BEGIN { print  "$varp2"*"$var2"}" > "$OUTPUT5";
float="$(/bin/cat "$OUTPUT5")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$float" | /bin/sed "s/\./,/g" > "$OUTPUT19"
else
:
fi

/bin/cat "$OUTPUT5" >> "$OUTPUT18";

if [ -s "$OUTPUT2" ]
then

/usr/bin/awk '{ print $1}' "$OUTPUT1" > "$OUTPUT20"
/usr/bin/awk '{ print $2}' "$OUTPUT1" > "$OUTPUT21"
/usr/bin/awk '{ print $3}' "$OUTPUT1" > "$OUTPUT22"
/usr/bin/awk '{ print $4}' "$OUTPUT1" > "$OUTPUT23"
/usr/bin/awk '{ print $5}' "$OUTPUT1" > "$OUTPUT24"
w1="$(/bin/cat "$OUTPUT20")"
w2="$(/bin/cat "$OUTPUT21")"
w3="$(/bin/cat "$OUTPUT22")"
w4="$(/bin/cat "$OUTPUT23")"
w5="$(/bin/cat "$OUTPUT24")"
else
/bin/echo "" > "$OUTPUT1"
fi



/usr/bin/awk '{ print $3}' "$OUTPUT1" | /usr/bin/wc -m > "$OUTPUT25"
length1="$(/bin/cat "$OUTPUT25")"


/usr/bin/awk '{ print $4}' "$OUTPUT1" | /usr/bin/wc -m > "$OUTPUT26"
length2="$(/bin/cat "$OUTPUT26")"





if [ -s "$OUTPUT7" ]
then


if [ "9" -gt "$length2" ]
then 
/bin/echo "$w5$tab$tab" > "$OUTPUT39"

else
/bin/echo "$w5$tab" > "$OUTPUT39"
fi

if [ "8" -gt "$length1" ]
then 
/bin/echo "$w3$tab$tab$w4" > "$OUTPUT30"

else
/bin/echo "$w3$tab$w4" > "$OUTPUT30"
fi

endw="$(/bin/cat "$OUTPUT30")"
endw2="$(/bin/cat "$OUTPUT39")"

/bin/echo "$w1$tab$w2$tab$endw $endw2 "$(/bin/cat "$OUTPUT19")" €        $usts" > "$OUTPUT1";

fi




if [ -s "$OUTPUT8" ] 
then 



if [ "9" -gt "$length2" ]
then 
/bin/echo "$w5$tab$tab" > "$OUTPUT39"

else
/bin/echo "$w5$tab" > "$OUTPUT39"
fi

if [ "8" -gt "$length1" ]
then 
/bin/echo "$w3$tab$tab$w4" > "$OUTPUT30"

else
/bin/echo "$w3$tab$w4" > "$OUTPUT30"
fi

endw="$(/bin/cat "$OUTPUT30")"
endw2="$(/bin/cat "$OUTPUT39")"

/bin/echo "$w1$tab$w2$tab$endw $endw2 "$(/bin/cat "$OUTPUT19")" €        $usts2" > "$OUTPUT1";

fi


/bin/cat "$OUTPUT1" >> "rechnung.txt";


ust="$(/bin/cat "$OUTPUT7")";
gp="$(/bin/cat "$OUTPUT5")";

if [ -s "$OUTPUT7" ]
then
/usr/bin/awk "BEGIN { print $gp/$ust}" > "$OUTPUT9";
/bin/cat "$OUTPUT9" >> "$OUTPUT15"
else
:
fi


ustre="$(/bin/cat "$OUTPUT9")";

if [ -s "$OUTPUT9" ]
then
/usr/bin/awk "BEGIN { print $gp-$ustre}" >>  "$OUTPUT14";
else
:
fi


ust2="$(/bin/cat "$OUTPUT8")";

if [ -s "$OUTPUT8" ]
then
/usr/bin/awk "BEGIN { print $gp/$ust2}" > "$OUTPUT10";

/bin/cat "$OUTPUT10" >> "$OUTPUT15"
else
:
fi

ustr="$(/bin/cat "$OUTPUT10")";
if [ -s "$OUTPUT10" ] 
then
/usr/bin/awk "BEGIN { print $gp-$ustr}" >> "$OUTPUT13";
else
:
fi

/bin/echo "$COUNTER" > "$TEMPFILE"

done



/usr/bin/awk '{sum= sum+$1} END { print sum}' "$OUTPUT15" > "$OUTPUT16"
var16="$(/bin/cat "$OUTPUT16")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$var16" | /bin/sed "s/\./,/g" > "$OUTPUT16"
sun="Summe netto:$tab$tab$(/bin/cat "$OUTPUT16") €";

/usr/bin/awk '{sum= sum+$1} END { print sum}' "$OUTPUT14" > "$OUTPUT11"
var11="$(/bin/cat "$OUTPUT11")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$var11" | /bin/sed "s/\./,/g" > "$OUTPUT11"
ust7="Umsatzsteuer 7 %:$tab$(/bin/cat "$OUTPUT11") €";

/usr/bin/awk '{sum= sum+$1} END { print sum}' "$OUTPUT13" > "$OUTPUT12"
var12="$(/bin/cat "$OUTPUT12")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$var12" | /bin/sed "s/\./,/g" > "$OUTPUT12"
ust19="Umsatzsteuer 19 %:$tab$(/bin/cat "$OUTPUT12") €";

/usr/bin/awk '{sum= sum+$1} END { print sum}' "$OUTPUT18" > "$OUTPUT6"
var6="$(/bin/cat "$OUTPUT6")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$var6" | /bin/sed "s/\./,/g" > "$OUTPUT6"
gesp="Gesamtpreis brutto:$tab$(/bin/cat "$OUTPUT6") €";

/usr/bin/awk "BEGIN { print "$var6"*"0.04"}" > "$OUTPUT43";
var7="$(/bin/cat "$OUTPUT43")"
/usr/bin/awk "BEGIN { print "$var6"-"$var7"}" > "$OUTPUT44";
var8="$(/bin/cat "$OUTPUT44")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$var8" | /bin/sed "s/\./,/g" > "$OUTPUT45"
gesp2="Gesamtpreis brutto bei kompletter einmaliger Begleichung des Gesamtpreises:$tab$(/bin/cat "$OUTPUT45") €";


/bin/echo ""  >> "rechnung.txt"
/bin/echo ""  >> "rechnung.txt"
/bin/echo "$sun" >> "rechnung.txt"
/bin/echo "$ust7" >> "rechnung.txt"
/bin/echo "$ust19" >> "rechnung.txt"
/bin/echo "$gesp" >> "rechnung.txt"
/bin/echo "$gesp2" >> "rechnung.txt"
/bin/echo ""  >> "rechnung.txt"


/usr/bin/awk '{print $1 }' "$OUTPUT" | /usr/bin/awk '!seen[$0]++' | /usr/bin/wc  -l > "$OUTPUT40"
daysum="$(/bin/cat "$OUTPUT40")"
/usr/bin/awk "BEGIN { print  "10"/"$daysum"}" > "$OUTPUT41";
varerg="$(/bin/cat "$OUTPUT41")"
LC_ALL=C /usr/bin/printf '%.*f\n' 2 "$varerg" | /bin/sed "s/\./,/g" > "$OUTPUT42"
/bin/echo "Rabatt-Hinweis: Nur wenn der Kunde diese Rechnung einmalig komplett begleichen wird, und somit alle gemäß dieser Rechnung bestellten Produkte bezahlt, erhält dieser Kunde einmalig 4 % Rabatt auf den Rechnungs-Gesamtbetrag, maximal jedoch 10 € Rabatt. Wird diese Rechnung nicht beglichen, erhält der Kunde nur je Abholtag und nur, wenn alle für diesen Abholtag vom Kunden bestellten vorrätigen Produkte von diesem Kunden je Abholtag abgeholt und bezahlt werden 3 % Rabatt. Ansonsten erhält der Kunde nur 1 % Rabatt je Abholtag, in jedem Fall jedoch maximal "$(/bin/cat "$OUTPUT42")" € Rabatt je Abholtag." >> "rechnung.txt";

/bin/rm -r "${tmpDir}"
