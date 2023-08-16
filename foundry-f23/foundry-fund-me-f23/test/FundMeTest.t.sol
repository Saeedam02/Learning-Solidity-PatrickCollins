//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe; // making it as a stage variable till we can use it in the second function.abi

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18); // with this line we check that is the MINIMUM_USD equal to 5e18 or not.
        //if we test our program, we see that it'll pass but if we change 5e18 to 6e18 we see that it will fail.abi
    }
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
