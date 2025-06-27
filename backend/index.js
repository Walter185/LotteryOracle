const { ethers } = require("ethers");

// Conexión al nodo local
const provider = new ethers.JsonRpcProvider(process.env.NODO);

// Dirección del contrato
const contractAddress = "0x390F2747330293f738E316CE86815B54BE21ab8B"; // aca va el contrato que me dio npx hardhat ignition deploy ./ignition/modules/Lottery.js --network sepolia 

// ABI del contrato (asegúrate de incluir el ABI correcto)
const abi = [
    // Agrega aquí la definición del evento VRFAsk
    "event VRF()"
];

async function main() {
    const contract = new ethers.Contract(contractAddress, abi, provider);

    // Escucha el evento VRFAsk
    contract.on("VRF", () => {
        console.log("recibi un evento");
    });

    console.log("estoy escuchando evento");
}

// Ejecutar el programa
main().catch((error) => {
    console.error(error);
    process.exit(1);
});