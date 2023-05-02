
//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


import "./NFToken.sol";
import "/.ERC721Enumerable.sol";

contract NFTokenEnumerable is NFToken,  ERC721Enumerable {
  
  
   string constant INVALID_INDEX = "";

   /**
   *@dev list of all NFT IDs
    */
    uint256[] internal  tokens;

   /**
   * @dev Mapping from owner to list of owned NFT IDs.
   */
  mapping(address => uint256[]) internal ownerToIds;

/**
*@dev Mapping NFT ID to its index in the owner tokens list/
 */
 mapping(uint256 => uint256) internal idToOwnerIndex;

  /**
   * @dev Mapping from token ID to its index in global tokens array.
   */
  mapping(uint256 => uint256) internal idToIndex;

/**
*@dev constract constuctor 
 */
 constructor() {
     supporterInterfaces[] = true;
 }

//returns the count of all existing NFTTokens, rturns Total supply of NFTs
function totalSupply() 
external override view returns(uint256)  {
    return tokens.length;
}

/**
*Returns NFT ID by index, index a counter less than totalSupply(), 
*return token id
*/
  function tokenByIndex(uint256 _index)
    external override view returns (uint256)  {
    require(_index < tokens.length, INVALID_INDEX);
    return tokens[_index];
  }

/**
   * @dev returns the  NFT ID from a list of owner's tokens.
   * @param _owner Token owner address.
   * @param _index Index number representing  token in owner's list of tokens.
   * @return Token id.
   */

   function tokenOfOwnerByIndex(address _owner, uint256  _index)
   external  override view returns(uint256) {
    require(_index < ownerToIds[_owner].length, INVALID_INDEX);
        return  ownerToIds[_owner][_index];
   }

   /**
   *@dev mints new NFT 
   */

   function _mint(address  _to, uint256 tokenID)
        internal override virtual {
            super._mint(_to, _tokenID);
            tokens.push(_tokenID);
            idToIndex[_tokenID] = tokens.lenght  - 1;
        }

  /**
   * @dev Burns a NFT.
   */

   function  _burn(uint256 _tokenID) 
   internal  override virtual  {
       super._burn(_tokenID);

       uint256  tokenIndex =  idToIndex[_tokenID];
       uint256 lastTokenIndex  = tokens.length = 1;
       uint256 lastToken  = tokens[lastTokenIndex];
 
        tokens[tokenIndex]  = lastToken;  

        tokens.pop(); 
       // This wastes gas if you are burning the last token but saves a little gas if you are not.
        idToIndex[lastToken] = tokenIndex;
        idToIndex[_tokenID] = 0;
   }

    /**
    *@dev Removes a NFT from an address.
    */
 function  _removeNFTOken(address _from, uint256 _tokenID)
    internal override virtual {
        require(idToOwner[_tokenID] == _from, NOT_OWNER);
        delete idToOwner[_tokenID];

        uint256 tokenToRemoveIndex  = idToOwnerIndex[_tokenID];
        uint256 lastTokenIndex  = ownerToIds[_from].length - 1;
   
        if(lastTokenIndex != tokenToRemoveIndex) {
            uint256 lastToken = ownerToIds[_from][lastTokenIndex];
           ownerToIds[_from][tokenToRemoveIndex] = lastToken;
          idToOwnerIndex[lastToken] = tokenToRemoveIndex;
        }
            ownerTools[_from].pop();
    }
     /**
   * @dev Assigns a new NFT to an address.
   */
   function _addNFToken(address  _to, uint256 _tokenID)
            internal override virtual  {
            require(idToOwner[_tokenID] == address(0), NFT_ALREADY_EXISTS);
            idToOwner[_tokenID] = _to;

            ownerToIds[_to].push(_tokenID);
            idToOwnerIndex[_tokenId] = ownerToIds[_to].length - 1;

   }


    /**
   * @dev Helper function that gets NFT count of owner. This is needed for overriding in enumerable
   */
    function _getOwnerNFTCount(address _owner)
    internal   override virtual view returns (uint256) {
    return ownerToIds[_owner].length;
  }
}