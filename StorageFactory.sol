// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

//import "./SimpleStorage1.sol"; it will import whole contracts which are in that file
import {SimpleStorage} from "./SimpleStorege1.sol"; // it will important just the mentioned files.
 
contract StorageFactory{

    //uint256 public favnum
    // type  visibility name
    SimpleStorage public simpleStorage; // first one refers to contract but second one refers to variable


    function cretaeSimpleStorageContract() public {
            simpleStorage= new SimpleStorage();

    }
}