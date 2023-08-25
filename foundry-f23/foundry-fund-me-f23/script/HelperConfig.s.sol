//SPDX-Licesnse-Identifier: MIT


//what we are going to do with this:
//1.deploy mocks when we are on a local anvil chain
//2.keep tracking of contract address acrosss different chains
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

contract HelperConfig {
    // if we are on a local anvil, we deploy mocks
    //otherwise, grap the existing address from the live network
    function getSepoliaEthConfig()  public pure () {
        // this func needs a priceFeed address, vrf address, gas price and ...
        //it's going to return a configuration for everything we need in sepolia or really any chain.

    }
    function getAnvilEtgConfig() public pure {
        // this func needs a priceFeed address

    }

}
