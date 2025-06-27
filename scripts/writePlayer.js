const { ethers } = require("ethers");

async function main() {
    _addr = "0x390F2747330293f738E316CE86815B54BE21ab8B";
    Lottery = await ethers.getContractFactory("Lottery");
    lottery = await Lottery.attach(_addr);
    tx = await lottery.play();
    console.log(tx);
}
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
