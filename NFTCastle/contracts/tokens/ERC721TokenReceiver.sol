// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


interface ERC721TokenReceiver {
    
    
    function onERC721Received(address _operator,  address _from, uint256  _tokenID, bytes callData,  _data)
    external  returns(bytes4);
}