#!/bin/sh

echo "Sript per impostare il funzionamento marionnet come da VM del laboratorio per il corso "Reti di calcolatori"\n"

#Ottengo i parametri path di "filesystem" e "kernels" che devono essere copiati
read -p "Inserisci il path assoluto per la directory filesystems: " INPUT
FILESYSTEMSUSER=$INPUT
read -p "Inserisci il path assoluto per la directory kernels: " INPUT
KERNELSUSER=$INPUT

#Conferma dell'operazione
echo    "I seguenti file saranno copiati i seguenti file:"
echo    "../filesystems"
for elem in `ls $FILESYSTEMSUSER`
    do 
        echo "\tL" $elem
    done
echo    "../kernels"
for elem in `ls $KERNELSUSER`
    do
        echo "\tL" $elem
    done
read -p "Continuare? [y/n] " INPUT
case $INPUT in 
    y)  ;;
    *)  exit;
esac

#Rendo scrivibile la directory "filesystem" e la directory "kernels"
FILESYSTEM=/usr/local/share/marionnet/filesystems
chmod u+w $FILESYSTEM
KERNESLS=/usr/local/share/marionnet/kernels
chmod u+w $KERNESLS

#Copio all'interno di marionnet ogni filesystem file e kernels file
for elem in `ls $FILESYSTEMSUSER`
    do
        cp -r $FILESYSTEMSUSER/$elem $FILESYSTEM
    done

for elem in `ls $KERNELSUSER`
    do
        cp -r $KERNELSUSER/$elem $KERNESLS
    done

echo "\nTutti i file sono stati copiati con successo"

exit 0;