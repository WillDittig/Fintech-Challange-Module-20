pragma solidity ^0.5.0;

/*
1. Instead of the `if` statement, use a `require` statement to validate that the `recipient` address is either
  the `public_savings` or the `private_savings` address.

2. In the case of an error, show the following message: "This is not your account."

3. Instead of the `if` statement to validate the contract balance, use a `require` statement.

4. In the case of an error, show the following message: "You don't have enough funds!".
*/

contract JointSavings {
  address payable public public_savings = 0x77B2aD074a1aF1AF2a408E3D48465E5F9ec75f45;
  address payable private_savings = 0x873Ad450656C46cb564eaf418472A1c77d7327Ad;
  string account_holder = "Jane Doe";
  address payable  accountOne;
    address payable  accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;


  function withdraw(uint amount, address payable recipient) public {
  require ((recipient == public_savings || recipient == private_savings), "This is not your account");
  require (address(this).balance >= amount, "You dont have enough funds"); 
  if(lastToWithdraw != recipient) {
    lastToWithdraw = recipient;
  }

  recipient.transfer(amount);
  lastWithdrawAmount= amount;
  contractBalance = address(this).balance; 
  
    }
 function deposit()public payable {
 contractBalance = address(this).balance;
 }
 function setAccounts(address payable account1, address payable account2) public{
  accountOne = account1;
  accountTwo = account2;
 }
 function() payable external {

 }
  }







 