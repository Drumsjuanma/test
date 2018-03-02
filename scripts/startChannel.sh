
echo -e '\e[92m//////// --- Creando Canal --- ////////\e[39m'
export CHANNEL_NAME=mychannel
peer channel create -o orderer.alastria.com:7050 -c $CHANNEL_NAME -f ../channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/alastria.com/orderers/orderer.alastria.com/msp/tlscacerts/tlsca.alastria.com-cert.pem

echo -e '\n\n\e[92m//////// --- Añadiendo Caixabank al canal --- ////////\e[39m'
 peer channel join -b ./mychannel.block

echo -e '\n\n\e[92m//////// --- Añadiendo Alastria al canal --- ////////\e[39m'
 CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/alastria.alastria.com/users/Admin@alastria.alastria.com/msp CORE_PEER_ADDRESS=peer0.alastria.alastria.com$

echo -e '\n\n\e[92m//////// --- Configurando Anchor Peer Caixabank --- ////////\e[39m'
peer channel update -o orderer.alastria.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/CaixabankMSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/$

echo -e '\n\n\e[92m//////// --- Configurando Anchor Peer Alastria --- ////////\e[39m'
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/alastria.alastria.com/users/Admin@alastria.alastria.com/msp CORE_PEER_ADDRESS=peer0.alastria.alastria.com:$

echo -e '\n\n\e[92m//////// --- instalando Chaincode --- ////////\e[39m'
peer chaincode install -n test1 -v 1.0 -p github.com/chaincode/api

echo -e '\n\n\e[92m//////// --- Instanciando Chaincode --- ////////\e[39m'
peer chaincode instantiate -o orderer.alastria.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/alastria.com/orderers/orderer.alastria.com/msp/tlscacert$






