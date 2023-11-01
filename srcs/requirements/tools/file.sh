
echo "check is directory does not existe"

if [ ! -d "/home/asekkak/data" ]
then
    sudo mkdir /home/asekkak/data
    sudo mkdir /home/asekkak/data/wordpress
    sudo mkdir /home/asekkak/data/database
    sudo mkdir /home/asekkak/data/static
    sudo mkdir /home/asekkak/data/adminer
fi
