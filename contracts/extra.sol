// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TestCreate2 {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
}

contract Factory {
    event Deploy(address addr);
    function create2(uint _salt) public{
        TestCreate2 testCreate2 = (new TestCreate2){salt: bytes32(_salt)}(msg.sender);
        emit Deploy(address(testCreate2));
    }

}
