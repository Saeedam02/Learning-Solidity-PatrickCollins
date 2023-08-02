// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Fundme {
   
   uint256 public minimumusd=5;

    // be used to call to send money to our contract
    // payable keyword makes the function to look red in the remix ui
    function fund() public payable  {
        // allow users to send $
        // Have a minimum $ sent 5$
     
       //msg.value is in eth and minimumusd is USD for convert the amount of ethereum to its price in dollar we use chainlink and oracle
       // to get the ethereum price in dollar we must use oracle network
       
        require(msg.value>=minimumusd,"didn't send enough ETH"); //1e18 means 1 ETH= 100000000000000000000 wei
        // in the above message, it says that is the first part is false then go ahead and revert the second section.
        
    }


    // be used to withdraw the money which is sent to us
    function withdraw() public {}




}