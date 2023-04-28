// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract CloneTemplate is
    Initializable
{
    address public owner;
    uint256 public Id;

    constructor()  {
        owner = msg.sender;
    }
   
    function initialize(
        uint256 _Id
    ) external initializer {
        Id= _Id;
    }
}
