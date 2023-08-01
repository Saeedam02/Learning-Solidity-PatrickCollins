// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Fundme {
   
   uint256 public myvalue=1;

    // be used to call to send money to our contract
    // payable keyword makes the function to look red in the remix ui
    function fund() public payable  {
        // allow users to send $
        // Have a minimum $ sent
        myvalue=myvalue+2;

        //msg.value; number of wei sent with the message
        // if we wanted users to be required to spend at least one whole ETH we can use:
        require(msg.value>1e18,"didn't send enough ETH"); //1e18 means 1 ETH= 100000000000000000000 wei
        // in the above message, it says that is the first part is false then go ahead and revert the second section.
        
    }

//Revert undoes any action that have been done previously and send the remaining gas associated with that transaction back.
// revert is used in the fund when the didn't send enough eth sent and the function revert the previous value of myvalue.
// note that in the revert we also pay gas even we send a failed transaction

    // be used to withdraw the money which is sent to us
    function withdraw() public {}




}