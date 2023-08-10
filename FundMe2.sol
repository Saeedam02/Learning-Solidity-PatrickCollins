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
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;

    }


}