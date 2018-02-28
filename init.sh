echo 'Creando certificados'
cryptogen generate --config ./crypto-config.yaml


echo 'creando bloque genesis'
export FABRIC_CFG_PATH=$PWD
configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

echo 'channel'
export CHANNEL_NAME=mychannel  && configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

echo 'anchor peer caixabank'
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/CaixabankMSPanchors.tx -channelID $CHANNEL_NAME -asOrg CaixabankMSP

echo 'anchor peer santander'
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/SantanderMSPanchors.tx -channelID $CHANNEL_NAME -asOrg SantanderMSP

