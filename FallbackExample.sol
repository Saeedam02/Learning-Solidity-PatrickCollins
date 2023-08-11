// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FallbackExample{
    uint256 public  result;

    receive() external  payable {
        result=1;
        // this function gets triggered anytime we send a tranaction to the contract
        // even we didn't send any money to contract
        // it works even we don't call any functions and keep the call data blank.
        // if we put a name into a calldata and then transact, now the receive function doesn't work since we are looking for other function 
        // if that function which we are looking for, didn't exist, it will show a error which the fallback function is not defined.
    }
    fallback() external  payable {
        result = 2;
        // this is similar to receive except for the fact that it can work even when data is sent along transaction
        // if in calldata we mention an nonexistance function, remix notice that and refer us to our fallback function.
        
    }







}