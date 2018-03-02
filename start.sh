echo -e '\e[42m//////// --- Iniciando Red AlastriaNet --- ////////\e[49m'

IMAGE_TAG="latest" CHANNEL_NAME="mychannel" COMPOSE_PROJECT_NAME="alastriaNet" docker-compose -f docker-compose-cli.yaml up -d

echo -e '\e[92m//////// --- Exito --- ////////\e[39m'


