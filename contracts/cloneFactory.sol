//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/proxy/Clones.sol";
import "../contracts/template.sol";

contract CloneFactory {
    address public owner;
    address public Contract;

    event CloneInstance(
        uint256 Id,
        address instance
    );

    modifier onlyOwner() {
        require(owner == msg.sender, "ONLY_OWNER");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setContract(address _contract) external onlyOwner {
        Contract = _contract;
    }

    function cloneContract(
        uint256 Id
    ) external {
    
        address instance = Clones.clone(Contract);
        CloneTemplate(instance).initialize(Id);
        emit CloneInstance(Id, instance);
    }
}
