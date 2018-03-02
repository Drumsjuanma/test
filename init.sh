echo '//////// --- Creando certificados --- ////////'
cryptogen generate --config ./crypto-config.yaml

echo -e '/n/n//////// --- Creando bloque genesis --- ////////'
export FABRIC_CFG_PATH=$PWD
configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

echo -e '/n/n//////// --- Creando canal Caixabank-Alastria --- ////////'
export CHANNEL_NAME=mychannel  && configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

echo -e '/n/n//////// --- Creando Anchor Peer Caixabank --- ////////'
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/CaixabankMSPanchors.tx -channelID $CHANNEL_NAME -asOrg CaixabankMSP

echo -e '/n/n//////// --- Creando Anchor Peer Alastria --- ////////'
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/AlastriaMSPanchors.tx -channelID $CHANNEL_NAME -asOrg AlastriaMSP

