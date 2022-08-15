// SPDX-License-Identifier: MIT

//Specifying the solidity version

pragma solidity ^0.8.15;

//Using OpenZeppelin for importing functions

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

//Declaring a contract with the name W3dev and referring it to the ERC20 OpenZeppelin framework

contract W3Dev is ERC20{

    /*Specifying owner as public to only mint by him not others
    Creating a token with the name W3Dev and with the symbol WED
    Transferring the minted tokens to owner address inorder to circualte through ICO,exchange,etc..
    Setting the owner as the person who mint*/

    address public Owner; 
    constructor() ERC20('W3Dev','WED'){
        _mint(msg.sender,10484848);
        Owner = msg.sender;
    }

    /*Creating a function mint to mint the tokens,Specifying the address and amount as parameters to the functions
    Verifying the Owner is the person who is able to mint through owner from previous function
    _mint to mint to and their amount*/

    function mint(address to , uint amount) external{
        require(msg.sender == Owner, 'Only owner can mint');
        _mint(to,amount);
    }

    /*function burn to burn tokens if needed,Obtains amount as parameter
    Contains from address and amount to burn*/
    
    function burn(uint amount) external{
        _burn(msg.sender,amount);
    }

}