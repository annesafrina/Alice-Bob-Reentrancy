//SPDX-License-Identifier: MIT
//import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
pragma solidity ^0.8.8; 


contract AliceBank {
    mapping(address => uint256) public saldoBankAlice;

    function deposit() public payable {
        saldoBankAlice[msg.sender] += msg.value;
    }

    function withdrawBalance() public {
        uint256 jumlahSaldo = saldoBankAlice[msg.sender];
        // External call (bisa call ke attacker contract yg malicious)
        (bool success,) = msg.sender.call{value: jumlahSaldo}("");
        if (!success) {
            revert();
        }

        // State change (update saldo)
        saldoBankAlice[msg.sender] =0;
    }
     
}
