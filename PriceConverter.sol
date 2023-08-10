// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PriceConverter {
    // library can't have any state variable and other functions have to be marked internal

    function getPrice() internal view returns(uint256) {
        //Address 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        //ABI 
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
       
        (,int256 price,,,)=priceFeed.latestRoundData();

       
        return uint256(price *1e10);

    }
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();

        uint256 ethAmountTnUsd= (ethPrice * ethAmount)/1e18;
        return ethAmountTnUsd;

    }

    function getVersion() internal  view returns(uint256) {
        return AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910).version();
    }

}
