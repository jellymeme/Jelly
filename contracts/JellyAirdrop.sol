

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract JellyAirdrop is Ownable {
    
    using SafeMath for uint256;
    
    IERC20 Jelly;
    uint256 public startTime;
    uint256 constant BP = 9000000000000;
    uint256 public jellyClaimed;
    bool public isClaim;

    mapping(address => bool) public  _isClaimed;

    event Claimed(address indexed recipient, uint256 amount);

    constructor (address _address) { 
        Jelly = IERC20(_address); 
    }

    function setStart(bool _isClaim)
        public 
        onlyOwner 
    { 
        isClaim = _isClaim;
    }

    function withdrawUnClaim(uint256 amount) 
        public 
        onlyOwner
    {
        require(amount <= Jelly.balanceOf(address(this)), "insufficient balance");
        Jelly.transfer(msg.sender, amount);
    }

    function withdraw(uint256 amount) 
        public 
        onlyOwner
    {
        payable(msg.sender).transfer(amount);
    }

    function claim() 
        public
        payable 
    {
        require(startTime <= block.timestamp, "not start");
        require(isClaim, "ended");
        require(!_isClaimed[msg.sender], "claimed");
        require(jellyClaimed.add(100000000e18) <= BP.mul(1e18), "hardcap exceeded");
        require(msg.value >= 10000000000000000, "insufficient balance to claim");
        jellyClaimed = jellyClaimed.add(100000000e18);
        Jelly.transfer(msg.sender, 100000000e18);
        _isClaimed[msg.sender] = true;
    }
}







