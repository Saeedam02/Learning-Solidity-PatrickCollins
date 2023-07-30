// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

//import "./SimpleStorage1.sol"; it will import whole contracts which are in that file
import {SimpleStorage} from "./SimpleStorage1.sol"; // it will important just the mentioned files.
 
contract StorageFactory{

    //uint256 public favnum
    // type  visibility name
    SimpleStorage[] public ListofsimpleStoragecontracts; // first one refers to contract but second one refers to variable


    function cretaeSimpleStorageContract() public {
        SimpleStorage newSimpleStoragecontract = new SimpleStorage();
        ListofsimpleStoragecontracts.push(newSimpleStoragecontract);
    }


    // in order to   interact with a contract we use the following: 
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public  {
        //address 
        //ABI - Application Binary Interface and it tell our code exactly how it can interact with another contract
        SimpleStorage mySimpleStorage = ListofsimpleStoragecontracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
        // second way to do this :
        // listofSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }
    // now we will create a new func to read from the SimpleStorage list
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mysimpleStorage = ListofsimpleStoragecontracts[_simpleStorageIndex];
        return mysimpleStorage.retrieve();
        // second way to do this :
        //return listofSimpleStorageContracts[_simpleStorageIndex];
    }




}