### Datensatz aufbereiten ###

# Beispiel Schulweg von zehn Kindern - Werte eingeben und Datensatz erzeugen
schule <-data.frame( 
  i = c(1,2,3,4,5,6,7,8,9,10), 
  schulweg = c(0.5, 1.0, 1.0, 2.0, 2.2, 3.1, 3.4, 3.4, 4.0, 4.3), 
  name = c("Anke","Bert","Clara","Ingrid","Gert","Franka","Emilia","Hans","Jochen","Dieter"), 
  gruppe = as.factor (c("kurz","kurz","kurz","kurz","kurz","weit","weit","weit","weit", "weit")),
  schulbus =c(FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, NA, TRUE))

# Datensatz wurde erzeugt
schule # zeigt den gerade erzeugten Datensatz schule an

# Pakete
library(sjmisc)
library(tidyverse)

# https://dplyr.tidyverse.org/

# •	select() – 	Variablen aus dem Datensatz entfernen oder beibehalten
# •	filter() – 	nur bestimmte Fälle auswählen oder Fälle entfernen
# •	rename() – 	Bezeichnung einer Variable umbenennen
# •	mutate() – 	Variablen erstellen und alte löschen 
# •	recode() – 	Ausprägungen einer Variable umkodieren

# nützliche Funktion ifelse() 

# select

schule_neu1 <- select(schule, -schulbus)
schule_neu1

schule_neu1 <- select(schule, -schulbus, -c(name, gruppe))
schule_neu1

schule_neu1 <- select(schule, gruppe, name) 
schule_neu1

# filter

schule_neu1 <- filter(schule, name=="Anke")
schule_neu1

schule_neu1 <- filter(schule, gruppe=="kurz")
schule_neu1

schule_neu1 <- filter(schule, schulweg>3.1)
schule_neu1

# rename
schule_neu1 <-rename(schule, Angabe_Schulbus = schulbus)
schule_neu1

# mutate
schule_neu1 <- mutate(schule, 
       sample = 1,
       schulweg_meter = schulweg*1000,
       i = NULL,
       )
schule_neu1


# ifelse()

# ifelse(A, B, C)

# Die Elemente A, B und C sind:
#  •	A: Eine logische Bedingung (siehe Tabelle unten)
#  •	B: Der Wert, der bei erfüllter Bedingung eingetragen wird
#  •	C: Der Wert, der bei nicht erfüllter Bedingung eingetragen wird

schule_neu1 <- mutate(schule,
  gruppe_3er = ifelse(schulweg<=1, "1:eher kurz", NA),
  gruppe_3er = ifelse(schulweg> 1 & schulweg<3.4, "2:mittel", gruppe_3er),
  gruppe_3er = ifelse(schulweg>=3.4, "3:eher weit", gruppe_3er),
)
schule_neu1

flat_table(schule_neu1, schulweg, gruppe_3er)

# recode & ifelse

schule_neu1<- mutate(schule,
  name = recode(name, Anke = "Anne-Marie", Bert = "Berti"),
  schulweg = recode(schulweg, "0.5" = 0.51, "1.0" = 1.11),
)
schule_neu1

schule_neu1<-mutate(schule, 
       i = ifelse(i %in% c(1,2,3,4), 100, i),
       )
schule_neu1

# fehlende Werte NA
frq(schule$schulbus) # Variable mit fehlenden Wert NA anzeigen
filter(schule, is.na(schulbus))
#filter(schule, schulbus==NA)

schule_neu1 <- mutate(schule, schulbus = ifelse(is.na(schulbus), -99, schulbus),)
frq(schule_neu1$schulbus) # Ergebnis anzeigen

schule_neu2 <- mutate(schule_neu1, 
                      schulbus = ifelse(schulbus== -99, NA, schulbus),)

schule_neu2$schulbus # Ergebnis als Werte anzeigen
frq(schule_neu2$schulbus )

schule_neu2$schulbus<-as.logical(schule_neu2$schulbus) 
frq(schule_neu2$schulbus )
