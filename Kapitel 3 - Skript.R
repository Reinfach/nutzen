########### Auswertungen Kapitel 3 ##########

# Beispiel Schulweg von zehn Kindern - Werte eingeben und Datensatz erzeugen
schule <-data.frame( 
  i = c(1,2,3,4,5,6,7,8,9,10), 
  schulweg = c(0.5, 1.0, 1.0, 2.0, 2.2, 3.1, 3.4, 3.4, 4.0, 4.3), 
  name = c("Anke","Bert","Clara","Ingrid","Gert","Franka","Emilia","Hans","Jochen","Dieter"), 
  gruppe = as.factor (c("kurz","kurz","kurz","kurz","kurz","weit","weit","weit","weit", "weit")),
  schulbus =c(FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE, NA, TRUE))

# Datensatz wurde erzeugt
schule # zeigt den gerade erzeugten Datensatz schule an

# Eigenschaften des Datensatzes anzeigen

dim(schule) 
ls(schule)  
str(schule) 

head(schule) 
View(schule) 

# Variablentypen verstehen

str(schule)

# •	num – Numerische Variablen mit numerischen Werten, also ausschließlich 
# Zahlen, werden in diesem variablen Format gespeichert. Da es sich um Zahlen 
# handelt, lassen sich viele Rechenoperationen direkt durchführen.

# •	chr – Textvariablen beinhalten unterschiedliche Textzeichen. Das kann unter-
# schiedliche Kombinationen von Textzeichen, einschließlich Zahlen, umfassen. 
# Das reicht von einzelnen Buchstaben oder Angaben, bis hin zu ganzen 
# Textpassagen. Hierbei ist zu beachten, dass Zahlenwerte, die so als Text 
# gespeichert werden, nicht direkt für etwaige Rechenoperationen benutzbar sind.

# •	Factor – Faktorvariablen beinhalten nur definierte Ausprägungen (levels), 
# die die Variable annehmen kann. Hierbei handelt es sich um nominale oder
# ordinale Variablen, für die eine begrenzte Anzahl von bestimmten Ausprägungen 
# vorliegt und die mithilfe der Faktorvariable entsprechend in Analysen direkt 
# einbezogen werden können.

# •	logi – Logische Variablen, abgekürzt logi, bezeichnet Variablen, die nur die 
# Ausprägungen Wahr (TRUE) oder Falsch (FALSE) aufweisen. Beispielsweise lässt 
# sich so festhalten, ob für jeden Fall im Datensatz eine Ausprägung vorliegt 
# oder nicht. Für spätere, komplexere Analysen kann diese Form der Angabe 
# praktisch sein und ermöglicht teilweise auch die Anwendung von Rechenoperationen.

# Einzelne Variablen ansehen

schule$schulweg
schule$name
schule$gruppe

table(schule$schulweg)
table(schule$gruppe)   

hist(schule$schulweg)  
hist(schule$name) 

# Einfach Kennwerte berechnen
min(schule$schulweg)    
max(schule$schulweg)  
sum(schule$schulweg)  # Summer aller Werte der Variable
mean(schule$schulweg) # Mittelwert der Variable berechnen

# Häufigkeitstabelle
# install.packages("sjmisc") # installiert Paket sjmisc lokal, nur beim ersten Mal
library(sjmisc) 
frq(schule$schulweg)

frq(schule$gruppe)   
frq(schule$schulbus) 
frq(schule$name)     

summary(schule)

# Übung 

# Beispieldatensatz zehn Unternehmen mit Beschäftigen
unternehmen <-data.frame( 
  i = c(1,2,3,4,5,6,7,8,9,10), 
  beschaeftigte = c(156, 35, 13, 423, 1545, 128, 18, 24, 876, 11), 
  firmenname = c("Metall Maier", "ITComplete", "CNC Expert", "S&P Beratung", "Ventile Gruber", "Steuerbüro Max", "WindEnergy", "PersonalFlex", "XScrews", "ServerCare"), 
  branche = as.factor(c("Industrie" ,"Dienstl.", "Industrie" ,"Dienstl.",        "Industrie", "Dienstl.", "Industrie", "Dienstl.", "Industrie", "Dienstl.")),
  betriebsrat =c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, NA, TRUE, FALSE))

# Ergebnis prüfen!
unternehmen

