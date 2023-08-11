// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {PriceConverter} from "./PriceConverter.sol";
//if we have variables that only get set once in our contract, there are some tools to make them more gas efficient
// the reason that the following keyword save gas is instead of storing these variables inside of storage slot, we store them directly into the bytecode of the contract.
// we going to use two keywords:
// constant 
// immutable
// if we set a variable once outside of function and then never change it so it's better to add constant keyword, like MINIMUN_USD
// for constant it's better to name the variables all in capital

// variables taht we set one time but outside of the same line that they are declared and we set them like in the constructor, we can mark as immutable,
// typically a good convention for marking immutable variables is going to be doing : i_name of the variable

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUN_USD=5e18;

    address[] public funders;

    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable  {
        require(msg.value.getConversionRate() >=MINIMUN_USD,"didn't send enough ETH"); 

        funders.push(msg.sender); // this refers to whoever call this function
       
        addressToAmountFunded[msg.sender] += msg.value;

    }
    function withdraw() public  onlyowner {
     
       
       
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex=funderIndex +1) {
            address funder= funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0); 

        (bool callSuccess, )=payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess, " call failed");
    }

    address public immutable i_owner;
  
    constructor (){

        i_owner = msg.sender; 
    }


    // other way to make our contract to be gas efficient is updating our requires right now with our require statement.
    // we need to store the sentence *sender is not the owner* as a string array every single one of these characters in this error log needs to get stored individually
    // check the custom error link in requirement.txt
    //so instead of all require we can create a custom error
    modifier onlyowner() {
        //require(msg.sender== i_owner," sender is not the owner");
        if(msg.sender != i_owner) { revert NotOwner();}      
        _; 
    }
}