echo -e '\e[42m//////// --- Iniciando Red AlastriaNet --- ////////\e[49m'

export CHANNEL_NAME=mychannel
CHANNEL_NAME=$CHANNEL_NAME docker-compose -f docker-compose-cli.yaml up

echo -e '\e[92m//////// --- Exito --- ////////\e[39m'


