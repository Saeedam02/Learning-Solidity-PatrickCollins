// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 public minimumusd=5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable  {
        require(msg.value.getConversionRate() >=minimumusd,"didn't send enough ETH"); 

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
     
        payable(msg.sender).transfer(address(this).balance); 

        // bool sendSuccess=payable(msg.sender).send(address(this).balance); //it will only revert the transaction if we add require statement.
        // require(sendSuccess,"Send faile"); // if the above line fails, we will still revert by adding our require statement.


        // (bool callSuccess, )=payable(msg.sender).call{value:address(this).balance}("");
        // require(callSuccess, " call failed");
    }

    address public owner;
  
    constructor (){

        owner = msg.sender; 
    }
    //modifier is going to allow us to create a keyword that we can put right in the function declaration to add some functionality quickly
    modifier onlyowner() {
        require(msg.sender== owner," sender is not the owner");
        _; // it's necessary to add this underscore and semicolon for excuting whatever else is in the function declaration
        // if we put the _; above the require line, it excute all commands inside of function then excute the modifire
        //now we going to add the onlyowner keyword in the function declaration 

    }
}