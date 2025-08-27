## Mochi Format Wandler
Mochi App: https://mochi.cards

Eine Lex-Spezifikation, die es ermöglicht die Lernkarten in ein Markdown
Format zu wandeln, das die Mochi App versteht. Damit lassen sich die
Karten auch auf mobilen Endgeräten nutzen. 

Getestet auf Mac OSX 15.3.2 mit XCode

*Programm kompilieren*
```
flex flex.l
cc -o lex lex.yy.c
```

*Fragen umwandeln*
```
# Gibt das gewandelte Markdown auf stdout aus
./lex < ../questions/ke01.md

# Gibt das gewandelte Markdown und die Anzahl 
# der Fragen auf stdout aus
./lex -v < ../questions/ke01.md

# Speichert das gewandelte Markdown in einer neuen Datei
./lex < ../questions/ke01.md > ../questions-mochi/ke01.md

```

Das Bashscript `compile`kann genutzt werden um alle Markdown Datein in `../questions` in `../questions-mochi` zu wandeln.

### Import in Mochi
Auf *Import* klicken und *Markdown* auswählen. Dann die Option *Multiple cards per .md file* wählen und als delimeter `+++` eingeben.
