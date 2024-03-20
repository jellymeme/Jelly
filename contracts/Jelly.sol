// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './JellyDefault.sol';

contract Jelly is JellyDefault {

     constructor() JellyDefault("JellyMeMe", "Jelly") {
        _mint(msg.sender, 10000000000000e18);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
    
}