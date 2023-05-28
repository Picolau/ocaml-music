## Author

Leonardo Picoli

## Introduction

Le projet choisi c'est un compilateur simple pour jouer une musique!  
La notation choisi pour créer une fichier qui répresente une morceaux s'appelle ABC Notation.  
Étant donné la complexité de trouver une librarie légère qui marche bien avec fichiers qu'utilisent ABC Notation, une librarie de conversion de ABC pour MIDI a été utilisé en conjunction avec la librarie timidity pour jouer le morceaux de la musique!

## Installation requirements

ABC2MIDI - Il faut éxécuter le code `sudo apt-get install abcmidi` pour installer la librarie de conversion ABC pour MIDI

Timidity - Il faut éxécuter le code `sudo apt-get install timidity` pour installer la librarie qui joue la musique.

## Compiling the code

`make`

## Executing the code

D'abord, il faut écrire une chanson dans un fichier qui s'appelle music.txt. Les notes suivantes peuvent être utilisés: **C, D, E, F, G, A, B, R** et aussi avec les options **#** et **b** pour faire des dièses et bémols et **R** pour indiquer une pause (Rest).

Pour éxécuter le code, il suffit de le compiler et après faire `sh execute.sh`.

Le bash script a été utilisé pour faire la conversion de fichier ABC pour MIDI (j'ai beaucoup essayé de faire fonctionner la éxécution de Unix commands pour OCaml directemment comme vous m'avez envoyez par mail mais ça a pas marché, malheuresement)

## Chanson bonus qui a été faite en utilisant MIDI

Tape `timidity heart.mid`

## **Merci!**
