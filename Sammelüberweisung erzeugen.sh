#!/bin/bash
# Wichtig: Zuerst kontrollieren ob eine Zeile mit falschem bzw. zu geringem Betrag im Kontoauszug existiert oder doppelte Bestellnummern.
# Wichtig: Bei dem Wert welcher bei den Kontodaten vermerkt ist wurde die Provision schon abgezogen!
# Wichtig: Die Felder werden durch ein Semicolon getrennt also sollte jede Zeile so aussehen: Name; IBAN; Verwendungszweck; 4.5; K5TEST 
# Wichtig: Der Provisionsbetrag muss mit einem Punkt getrennt sein (nicht Komma!).

# Wichtig: Datei "ktb", "fpb", "allrrnr", "rr-liste-final.txt" und "gefunden" müssen entfernt werden bevor das Script erneut genutzt wird.

# Dateien
p0="kontoauszug"
p6="kontodaten"

# Ordner
p1="best-aktiv"
p2="best-akt-noauto"
p3="best-aktiv-bezahlt"

# Wörter
p4="Datum"
p5="Stadt"


# In allen Dateien leere Zeilen entfernen
find $p1 -type f -exec sed -i '/^$/d' {} \;

# In allen Dateien alle Zeilen außer die letzte entfernen
find $p1 -type f -exec sed -i -n '$p' {} \;

# Alle Dateien welche keinen Fingerprint (Rabattcode) enthalten in den Ordner "best-akt-noauto" verschieben
find $p1 -type f -exec grep -l "^[.]" {} \; -exec mv {} $p2 \;

# Bestellnummer von jeder Datei im Ordner "best-aktiv" finden und in die Datei ktb einfügen
find $p1 -type f -exec awk -F"," '{print $9}' >> ktb {} \;

# Bestellnummern in der Datei 'ktb' in der Datei 'kontoauszug' suchen und gefundene Bestellnummern in die Datei "gefunden" einfügen
grep -w -f "ktb" $p0 >> "gefunden"

# Dateien im Ordner "best-aktiv" suchen welche die Bestellnummern aus der Datei "gefunden" enthalten und in den Ordner "best-aktiv-bezahlt" verschieben
find $p1 -type f -exec grep -w -f 'gefunden' {} \; -exec mv {} $p3 \;

# Fingerprint (Rabattcode) von jeder Datei im Ordner "best-aktiv-bezahlt" finden und in die Datei "fpb" einfügen
find $p3 -type f -exec awk -F"," '{print $1}' >> fpb {} \;

# Jede Zeile in der Datei "rr-liste.txt" welche einen Fingerprint (Rabattcode) aus der Datei "fpb" enthält entfernen.
grep -v -f "fpb" "rr-liste.txt" > "rr-liste-neu.txt"
sed -i '/^$/d' "rr-liste-neu.txt"

for i in $p3/*
do 
 echo '["' > file
awk -F "," '{print $1}' "$i" >> file
 echo '", "' >> file
echo "$p4" >> file
 echo '", "' >> file;
echo "$p5" >> file
 echo '", "' >> file;
awk -F "," '{print $2}' "$i" >> file
 echo ', ' >> file;
awk -F "," '{print $3}' "$i" >> file
 echo ', ' >> file;
awk -F "," '{print $4}' "$i" >> file
 echo ', ' >> file;
awk -F "," '{print $5}' "$i" >> file
 echo ', ' >> file;
awk -F "," '{print $6}' "$i" >> file
 echo ', ' >> file;
awk -F "," '{print $7}' "$i" >> file
 echo ', ' >> file;
awk -F "," '{print $8}' "$i" >> file
 echo '"],' >> file
echo $(cat file) > file2 
sed 's/ ,/,/g' file2
cat file2 >> rr-liste-final.txt
 done

# Sammelüberweisung erzeugen:

# Date "allrrnr" erzeugen welche alle rr-nr enthält (auch doppelt) und die Datei "allrrnrSorted" erzeugen welche jede rr-nr aus der Datei "allrrnr" nur einmal enthält.
for i in $p3/*
do 
awk -F"," '{print $2}' "$i" >> allrrnr
awk -F"," '{print $3}' "$i" >> allrrnr
awk -F"," '{print $4}' "$i" >> allrrnr
awk -F"," '{print $5}' "$i" >> allrrnr
awk -F"," '{print $6}' "$i" >> allrrnr
awk -F"," '{print $7}' "$i" >> allrrnr
awk -F"," '{print $8}' "$i" >> allrrnr
 done

sed -i 's/ //g' allrrnr
sed -i 's/  //g' allrrnr
sed -i 's/   //g' allrrnr
sort allrrnr | uniq > allrrnrSorted

# Anzahl aller rr-nr zählen
sort allrrnr | uniq -c > anzrrnr


touch "tempfile"
TEMPFILE="tempfile"
/bin/echo 1 > "$TEMPFILE"
xl="$(/usr/bin/awk 'END{ print NR}' "anzrrnr")"
for (( i=0; i<"$xl"; ++i));
do

COUNTER="$[$(/bin/cat "$TEMPFILE") + 1 ]"
x="$(/bin/cat "$TEMPFILE")"
/usr/bin/awk "NR==$x" "anzrrnr" > "line";
awk '{print $2}' line > rrnr

grep -w $(cat rrnr) kontodaten > kd
if [ -s kd ] 
then
awk -F ";" '{print $1}' kd > kdfinal
echo '; ' >> kdfinal
awk -F ";" '{print $2}' kd >> kdfinal
echo '; ' >> kdfinal

awk '{print $1}' line > anzahl
sed -i 's/ //g' anzahl
sed -i 's/  //g' anzahl
anzahl="$(cat anzahl)"


awk -F ";" '{print $4}' kd > eur
sed -i 's/ //g' eur
sed -i 's/  //g' eur
eur="$(cat eur)"

/usr/bin/awk "BEGIN { print  "$anzahl"*"$eur"}" > "gp";
float="$(/bin/cat "gp")"
LC_ALL=C printf '%.*f\n' 2 "$float" | sed "s/\./,/g" > "gpe"
sed -i 's/ //g' gp
sed -i 's/  //g' gp

gp="$(cat gp)"

# Wichtig: Bei dem Wert welcher bei den Kontodaten vermerkt ist wurde die Provision schon abgezogen!
/usr/bin/awk "BEGIN { print  "$gp"/90*10 }" > "provisione";
sed -i 's/ //g' provisione
sed -i 's/  //g' provisione

float2="$(/bin/cat "provisione")"
LC_ALL=C printf '%.*f\n' 2 "$float2" | sed "s/\./,/g" > "provision"
provision=$(cat provision)

# Wichtig: Es dürfen keine Semicolons im Verwendungszweck stehen.
vw="Straße, PLZ Ort. Rechnung für Rabattcodevermittlung. Gesamtpreis: $provision € inkl. 19 % USt."

echo $vw >> kdfinal
echo '; ' >> kdfinal

cat gpe >> kdfinal

echo $(cat kdfinal) > kdfinal2 

cat kdfinal2 >> sammelüberweisung
fi
/bin/echo "$COUNTER" > "$TEMPFILE"
done

/bin/rm  "gefunden" "ktb" "fpb"
