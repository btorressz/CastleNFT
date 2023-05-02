//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/**
 * @dev The contract has an owner address, and provides basic authorization control whitch
 * simplifies the implementation of user permissions. This contract is based on the source code at:
 * https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol
 */
 
 contract Ownable {
     
     
     /** 
      * dev Error constants
      */
      string public constant NOT_CURRENT_OWNER  = "";
      string public constant  CANNOT_TRANSFER_TO_ZERO_ADDRESS  =  "";
      
      /**
       * @dev Current owner address. 
       */
       address  public owner;
       
     /**
   * @dev An event which is triggered when the owner is changed.
   * @param previousOwner The address of the previous owner.
   * @param newOwner The address of the new owner.
   */
   event OwnershipTransfered(address indexed previousOwner, address indexed newOwner);
   
   /**
    * @dev the constructor sets the orginal owner for the contract to the sender
    * */
    constructor() {
        owner = msg.sender;
    }
    
    /**
     * @dev Throws if called by an account that is not the owners.
     */
        modifier onlyOwner() {
            _;
            require(msg.sender == owner, NOT_CURRENT_OWNER);
            
        }
        
        
    /**
     * @dev allows owner to transfer control of the contract to newOwner
     * @param _newOwner The address to transfer ownership to.
     */ 
 function transferOwnership( address _newOwner)
    public  onlyOwner  {
    require(_newOwner != address(0), CANNOT_TRANSFER_TO_ZERO_ADDRESS);
    emit OwnershipTransfered(owner, _newOwner);
    owner = _newOwner;
  }
     
     
 }