// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


/**
 * @dev Optional metadata extension for ERC721  NFT standard 
 * https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md.
 */
 
 interface ERC721Metadata  {
     
     /**
      * @dev Returns a name for collection of NFTS in this contract
      *@return _name Representing name 
      */
      
       function name()
        external
        view
        returns (string memory _name);

    /**
   * @dev Returns a distinct Uniform Resource Identifier (URI) for a given asset. It Throws if
   * `_tokenId` is not a valid NFT. URIs are defined in RFC3986. The URI may point to a JSON file
   * that conforms to the "ERC721 Metadata JSON Schema".
   * @return URI of _tokenId.
   */
   function tokenURI(uint256 _tokenId)
     external
     view
     returns (string memory);

 }