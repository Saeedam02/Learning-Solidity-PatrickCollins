// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// import "forge-std/Script.sol";
//import "../src/SimpleStorage.sol";

import {Script} from "forge-std/Script.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        // vm is a special keyword in forge library
        //vm stuff is only going to work in foundry
        vm.startBroadcast(); // this line means that hey everything after this line inside of this function, you should actually send to the RPC.

        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}
