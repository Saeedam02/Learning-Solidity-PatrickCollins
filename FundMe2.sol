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
        //for loop
        // [1,2,3,4] elements
        //for(/*starting index,ending index, step amount */)
        //funderIndex=funderIndex +1 is equal with funder++
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex=funderIndex +1) {
            address funder= funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }

    }

}