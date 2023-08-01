// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.18;

import {SimpleStorage} from "./SimpleStorage1.sol";

contract AddFiveStorage is SimpleStorage{
//now our AddFiveStorage contract inheritance all things from SimpleStorage and also it can have more options like bellow:

    function sayhello() public pure returns(string memory){
        return "hello";
    }
// now if we want to add 5 to the favnum from the SimpleStorage contract we will do overrides
//for do this we need to specify tosolidity that we want to override so we nees a override specifier
// and also we need to add a virtual keyword into the base class (means into the store func in the SimpleStorage contract)
    function store(uint256 _newNumber) public override{
        favoriteNumber = _newNumber+5;
    }

}