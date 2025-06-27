# LotteryOracle

crear un repo github y luego:

instalar el hardhat:
npm install --save-dev hardhat                                  

instalar toolbox:
npm i --save-dev @nomicfoundation/hardhat-toolbox               

instalar ethers:
npm i ethers                                                    

instalar el .env:
npm i dotenv                                                    

crear un archivo .env y colocar informacion privada en este formato:
NODO = "..." // clave privada de https://www.infura.io/
ETHSCAN_KEY = "..." // clave privada de https://sepolia.etherscan.io/
PRKEY = "..."  // clave privada de una wallet

compilar el contrato:
npx hardhat compile                                             

deployar contrato: 
npx hardhat ignition deploy ./ignition/modules/Lottery.js --network sepolia

Verificar contrato: 
npx hardhat verify --network sepolia 0x390F2747330293f738E316CE86815B54BE21ab8B

correr el readOwner:
npx hardhat run scripts/readOwner.js --network sepolia          

correr el writeOwner:
npx hardhat run scripts/writeOwner.js --network sepolia         

correr el backend:
node ./backend/index.js      