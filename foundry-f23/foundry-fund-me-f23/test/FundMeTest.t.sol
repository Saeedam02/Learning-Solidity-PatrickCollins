//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe; // making it as a stage variable till we can use it in the second function.abi

    function setUp() external {
        // we are calling the FundMeTest which then deploys FundMe
        // us -> FundMeTest -> FundMe
        //so the owner of the FundMe is FundMeTest not us
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18); // with this line we check that is the MINIMUM_USD equal to 5e18 or not.
        //if we test our program, we see that it'll pass but if we change 5e18 to 6e18 we see that it will fail.abi
    }

    // the following function will fail.
    // function testOwnerIsMsgSender() public {
    //     assertEq(fundMe.i_owner(), msg.sender);
    // }
    //for debugging that we use this funnction:
    // function testOwnerIsMsgSender() public {
    //     console.log(fundMe.i_owner());
    //     console.log(msg.sender);
    //     assertEq(fundMe.i_owner(), msg.sender);
    // }

    //the reason of failing:
    // us -> FundMeTest -> FundMe
    //so the owner of the FundMe is FundMeTest not us
    // instead of msg.sender we must check the our address
    function testOwnerIsMsgSender() public {
        assertEq(fundMe.i_owner(), address(this));
    }

    // function testPriceFeedVersionIsAccurate() public {
    //     uint256 version = fundMe.getVersion();
    //     assertEq(version, 4);
    // } // with this function we get the EvmError: Revert !!!!!!!!!
    // this is an unit test but one could argue that it is a integration test because iwe call the getVersion func and this func calls aout another contract

    //this codes are related to getting familiar with a test function.
    // uint256 number = 1;

    // function setUp() external {
    //     number = 2;
    // }

    // function testDemo() public {
    //     //console.log(number);
    //     ///console.log("Hello");
    //     assertEq(number, 2);
    // }
}
