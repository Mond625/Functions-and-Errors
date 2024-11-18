// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ducats {
    uint256 public balance;
    address public owner;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Admin can perform this action");
        _;
    }

    //require
    function deposit(uint256 _amount) public {
        require(_amount > 0, "Deposit amount must be greater than zero");
        balance += _amount;
    }

    //assert
    function testAssert() public view {
        assert(balance >= 0);
    }

    //revert
    function withdraw(uint256 _amount) public onlyOwner {
        if (_amount > balance) {
            revert("Insufficient balance");
        }
        balance -= _amount;
    }

    //reset balance
    function resetBalance() public onlyOwner {
        balance = 0;
    }
}