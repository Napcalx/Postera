// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// import {Test, console} from "forge-std/Test.sol";
// import {Postera} from "../../src/postFund.sol";
// import {PosteraRun} from "../../script/postFund.s.sol";

// contract PosteraS is Test {
//     Postera postera;
//     address Cal = makeAddr("Cal");
//     uint256 constant SENT_AMOUNT = 0.09 ether;
//     uint256 constant INIT_BALANCE = 100 ether;
//     uint256 constant GAS_PRICE = 1;

//     //uint256 number = 10;
//     function setUp() external {
//         //postera = new postera(0x694AA1769357215DE4FAC081bf1f309aDC325306);
//         PosteraRun posteraRun = new PosteraRun();
//         postera = posteraRun.run();
//         vm.deal(Cal, INIT_BALANCE);
//     }

//     function testMinimumUSD() public {
//         assertEq(postera.MIN_DEPOSIT(), 5e18);
//     }

//     // function testOwner() public {
//     //     assertEq(postera.getOwner(), msg.sender);
//     // }

//     function testgetVersion() public {
//         uint256 version = postera.getVersion();
//         assertEq(version, 4);
//     }

//     function testFundFails() public {
//         vm.expectRevert();
//         postera.fund();
//     }

//     function testFundUpdatesDataStruct() public {
//         vm.prank(Cal); // The next TX would be done by Cal
//         postera.fund{value: SENT_AMOUNT}();

//         uint256 amountFunded = postera.getAddressToAmountFunded(Cal);
//         assertEq(amountFunded, SENT_AMOUNT);
//     }

//     function testAddFunderToFundersArray() public {
//         vm.prank(Cal);
//         postera.fund{value: SENT_AMOUNT}();

//         address funder = postera.getFunder(0);
//         assertEq(funder, Cal);
//     }

//     modifier funded() {
//         vm.prank(Cal);
//         postera.fund{value: SENT_AMOUNT}();
//         _;
//     }

//     function testOnlyOwnerCanWithdraw() public funded {
//         vm.prank(Cal);
//         vm.expectRevert();
//         postera.withdraw();
//     }

//     function testWithdrawWithASingleFunder() public funded {
//         // Arrange

//         uint256 startingOwnerBalance = postera.getOwner().balance;
//         uint256 startingposteraBalance = address(postera).balance;

//         // Act
//         vm.txGasPrice(GAS_PRICE);
//         vm.prank(postera.getOwner());
//         postera.withdraw();

//         // Assert

//         uint256 endingOwnerBalance = postera.getOwner().balance;
//         uint256 endingposteraBalance = address(postera).balance;
//         assertEq(endingposteraBalance, 0);
//         assertEq(
//             startingOwnerBalance + startingposteraBalance,
//             endingOwnerBalance
//         );
//     }

//     function testWithdrawWithMultipleFunders() public funded {
//         // Arrange
//         uint160 numberOfFunders = 10;
//         uint160 startingFunderIndex = 1;
//         for (uint160 i = startingFunderIndex; i < numberOfFunders; i++) {
//             // vm.prank create new address
//             // vm.deal fund new address
//             // address()
//             hoax(address(i), SENT_AMOUNT);
//             postera.fund{value: SENT_AMOUNT}();
//         }

//         uint256 startingOwnerBalance = postera.getOwner().balance;
//         uint256 startingposteraBalance = address(postera).balance;

//         // Act
//         vm.startPrank(postera.getOwner());
//         postera.withdraw();
//         vm.stopPrank();

//         // Assert
//         assert(address(postera).balance == 0);
//         assert(
//             startingOwnerBalance + startingposteraBalance ==
//                 postera.getOwner().balance
//         );
//     }

//     function testWithdrawWithMultipleFundersCheaper() public funded {
//         // Arrange
//         uint160 numberOfFunders = 10;
//         uint160 startingFunderIndex = 1;
//         for (uint160 i = startingFunderIndex; i < numberOfFunders; i++) {
//             // vm.prank create new address
//             // vm.deal fund new address
//             // address()
//             hoax(address(i), SENT_AMOUNT);
//             postera.fund{value: SENT_AMOUNT}();
//         }

//         uint256 startingOwnerBalance = postera.getOwner().balance;
//         uint256 startingposteraBalance = address(postera).balance;

//         // Act
//         vm.startPrank(postera.getOwner());
//         postera.withdrawCheaper();
//         vm.stopPrank();

//         // Assert
//         assert(address(postera).balance == 0);
//         assert(
//             startingOwnerBalance + startingposteraBalance ==
//                 postera.getOwner().balance
//         );
//     }
// }

// // console.log(number);
// // console.log("Today is a new Day");
// //assertEq(number, 2);
