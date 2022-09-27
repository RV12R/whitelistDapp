//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Max no. of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    // keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been listed");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reache");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}