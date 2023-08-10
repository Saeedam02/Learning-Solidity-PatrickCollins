// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0; 
//we can use any version of solidit before 0.8 of solidity.
//so we can use something like 0.6.7 for our compiler

contract SafeMathTester{
    uint8 public bigNumber = 255; // max size of uint8 is 255
    // if we croos over the limit of number it would just wrap around and start back from the lowest number could be.

    function add() public {
        bigNumber=bigNumber+1;
    }
    // if we come back to solidity 0.8.0 or higher versions, the following function don't work if we call the add function because of the safemath 
    // function add() public {
    //     bigNumber=bigNumber+1;
    // }

    // but if we use the unchecked keyword we can change the functionality and again the add function does like version 0.7.6 and bellow 
    // function add() public {
    //     unchecked{bigNumber=bigNumber+1;}
    // }

    // note that unchecked key word makes your code a little bit more gas efficient
    

}