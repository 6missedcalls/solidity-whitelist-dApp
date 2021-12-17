// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract whitelist {
    address owner;

    mapping(address => bool) whitelisted;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    modifier isWhitelisted(address _address) {
        require(whitelisted[_address], "You need to be whitelisted");
        _;
    }

    function addUser(address _addressToWhitelist) public onlyOwner {
      whitelisted[_addressToWhitelist] = true;
    }

    function verifyUser(address _whitelistedAddress) public view returns(bool) {
      bool userIsWhitelisted = whitelisted[_whitelistedAddress];
      return userIsWhitelisted;
    }
}