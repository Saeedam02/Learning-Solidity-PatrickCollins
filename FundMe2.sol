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
        //addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;   it's better to show in the following way:
        addressToAmountFunded[msg.sender] += msg.value;

    }
    function withdraw() public {
        // the following line is for the aim that just owner can call this func
        require(msg.sender == owner , "Must be owner!");
        //for loop
        // [1,2,3,4] elements
        //for(/*starting index,ending index, step amount */)
        //funderIndex=funderIndex +1 is equal with funder++
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex=funderIndex +1) {
            address funder= funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0); // we yse the new keyword to reset the funders array to a blank address array
        
        // withdraw the funds. there are three way: transfer- send- call
        
        //transfer
        //msg.sender is address
        //payable(msg.sender) is payable address
        payable(msg.sender).transfer(address(this).balance); // it automativally revert if the transfer fails.
        // disadvantages of method: if the line fails it will error and revert the transaction.


        //send : if the line fails it won't error, it will return a boolean whether or not it was successful.
        bool sendSuccess=payable(msg.sender).send(address(this).balance); //it will only revert the transaction if we add require statement.
        require(sendSuccess,"Send faile"); // if the above line fails, we will still revert by adding our require statement.

        // call : a powerful func and we can use it to call virtually any funcs in all of ethereum without even having to have the ABI 
        // call(" this is where we will put any func information ") and if we don't want to call a func, we leave it like call("")
        // call func actually returns two variables. for showing taht we put() in the left hand of the following command:
        //if calling func was success the boolean will be true and if called func returned data it will be in dadareturned
        //since bytes objects are arrays, data returns need to be in memory
        //(bool callSuccess, bytes memory dataReturned)=payable(msg.sender).call{value:address(this).balance}(""); 
        // since we don't call a func we leave the comma for datareturned like:
        (bool callSuccess, )=payable(msg.sender).call{value:address(this).balance}("");
        require(callSuccess, " call failed");
    }

    //in this way everybody can call the withdraw func and transfer the money. 
    //in solidity, there is a keyword and special func named Constructor for this aim.
    //since we want this withdraw func to be able to be called by the owner of this contract,
    //in our constructor we can set up an address right away.
    address public owner;
    //after setting up the owner now we must change the withdraw func till just owner can call it.
    constructor (){

        owner = msg.sender; 
         
    }

}