show "Cloning Story repository..."
git clone https://github.com/zunxbt/Story-Protocol.git && cd Story-Protocol

show "Installing npm dependencies..."
npm install
echo

read -p "Enter your wallet private key: " WALLET
read -p "Enter Pinata JWT token: " JWT


cat <<EOF > .env
WALLET_PRIVATE_KEY=$WALLET
PINATA_JWT=$JWT
EOF


show "Running npm script to create SPG collection..."
npm run create-spg-collection
echo

read -p "Enter NFT contract address: " CONTRACT
echo

echo "NFT_CONTRACT_ADDRESS=$CONTRACT" >> .env

show "Running npm script for metadata..."
npm run metadata
echo
