// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Fundme {
   
   uint256 public minimumusd=5e18;
    address[] public funders;
    //mapping(address => uint256) public addressToAmountFunded;
    //also we can use the following way to mapping:
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // be used to call to send money to our contract
    // payable keyword makes the function to look red in the remix ui
    function fund() public payable  {
        // allow users to send $
        // Have a minimum $ sent 5$
     
       //msg.value is in eth and minimumusd is USD for convert the amount of ethereum to its price in dollar we use chainlink and oracle
       // to get the ethereum price in dollar we must use oracle network
       
        require(getConversionRate(msg.value)>=minimumusd,"didn't send enough ETH"); //1e18 means 1 ETH= 100000000000000000000 wei
        // in the above message, it says that is the first part is false then go ahead and revert the second section.
        funders.push(msg.sender); // this refers to whoever call this function
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
   
   
    }

    // for foloowing part of program we can use library which is used in Fundme2.sol
    //Libraries are similar to contracts, but you can't declare any state variable and you can't send ether.
    //A library is embedded into the contract if all library functions are internal.
    //Otherwise the library must be deployed and then linked before the contract is deployed.


    function getPrice() public view returns(uint256) {
        //Address 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        //ABI 
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
        //(uint80 roundId, int256 price, uint256 startedAt, uint256 timestamp, uint80 answerdInRound)=priceFeed.latestRoundData();
        //the line above return whole bunch of data but we just care about price so we rewrite it like:
        (,int256 price,,,)=priceFeed.latestRoundData();

        //price of ETH in terms of USD 
        //price feed(int256) and msg.value(uint256) have different decimal places and solidity doesn't work with decimals
        //for match up: (between int and uint we can use typecasting

        return uint256(price *1e10);

    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();

        uint256 ethAmountTnUsd= (ethPrice * ethAmount)/1e18;
        return ethAmountTnUsd;

    }

    function getVersion() public  view returns(uint256) {
        return AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910).version();
    }
    

    // be used to withdraw the money which is sent to us
    //function withdraw() public {}




}