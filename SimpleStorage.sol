// SPDX-License-Identifier:MIT  
// this actually isn't requied by compiler 
//it will actually throw a warning if we compile and won't error
//MIT is known as one of the most permissive licenses 
pragma solidity 0.8.18; // our solidity version 
// pragma solidity ^0.8.18 means that our code works with this version and all aversion above of this
// pragma solidity >=0.8.18 <0.9.0 means that our code works between this versions 

// now we give a name to our code
contract SimpleStorage{
    //all types have a default value.for uint256 is zero and for boolean is false
    // basic types : booleana(a true false value),uint(unsigned intiger) ,int(a signed whole number) ,address(like our metamask address),bytes
    // now we build variables
    bool havefavoritenumber = true;
    uint favoritenumber = 88;
    //we can use uint256 to specified the bits or bytes of the our variables and it's the maximum size
    int256 favoritenumber1 = -88;
    string favoritenumberindex="88";
    address myaddress= 0xE9005A492F49c248694C8AAe956eE6272c8B3842;
    bytes32 favoritebytes32="cat";
    //largest byte is 32

 
}