// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "../tokens/NFTokenMetadata.sol";
import "../ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */

contract  NFTokenMetadataMock is NFTokenMetadataMock,  Ownable  {
    
    
    
    
    /** 
     * dev Contrac  constructor.
     * @param _name is the name descrption for collection of NFTs
     * @param _symbol is  abbreviated name for NFTokens.
     */
     
     constructor (string memory  _name, string memory _symbol) {
         nftName = _name; 
         nftSymbol = _symbol;
     }
     
     /**
      * @dev Mints a new NFT.
      * @param _to address that will own the minted NFT 
      * @param _tokenID  NFT to be minsted to msg,sender
      * @param _uri String representing RFC 3986 URI
      */ 
      
      function mint(address _to, uint256  _tokenID, string calldata  _uri) 
        external onlyOwner  {
            super._mint(_to, _tokenID);
            super._setTokenUrri(_tokenID, _uri);
        }
        
        
  /**
   * @dev Removes a NFT from owner.
   * @param _tokenId Which NFT we want to remove.
   */
  function burn(uint256 _tokenId)
    external  onlyOwner {
    super._burn(_tokenId);
  }

}