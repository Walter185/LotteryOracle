// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {

    event VRF();

    address public oracle;
    address public owner;
    uint256 public counter;
    mapping(uint256 => address) public player;
    uint256 public price = 1 ether; // Set your desired ticket price here
    address public winner; // Store the winner's address

modifier minAmount(uint256 value) {
    require(value == price, "Amount must be greater than zero");
    _;
}

modifier onlyOracle() {
    require(msg.sender == oracle, "Only oracle can call this function");
    _;
}
 
modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _;
}

constructor() {
    owner = msg.sender;

}

function play(uint256 /*deadline*/) external payable minAmount(msg.value) {
    uint256 _counter = counter++;
    player[_counter] = msg.sender;
    if (_counter == 99) {
        emit VRF();
        // resetear el contador
    }
}

function setOracle(address _oracle) external onlyOwner {
    oracle = _oracle;    
}

function fullfillRandomness(uint256 random) external onlyOracle {
    // Aquí se implementaría la lógica para seleccionar al ganador
    // y distribuir el premio.
    // Por ejemplo, podrías usar un algoritmo para seleccionar un jugador aleatorio.
    // Emitir un evento para notificar que se ha cumplido la aleatoriedad.
    address _winner;
    uint256 winnerIndex = random % counter;
    _winner = player[winnerIndex];
    payable(_winner).transfer(address(this).balance); // Transferir el premio al ganador
    winner = _winner;
    emit VRF();
}

}