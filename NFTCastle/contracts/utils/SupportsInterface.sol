// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "./ERC165.sol";

contract  SupportsInterface is ERC165 {
    
    
    mapping(bytes4  =>  bool) interface supportsInterfaces;
    
    constructor() {
        supportsInterfaces[0x01ffc9a7] = true;
        
        function supportsInterfaces(bytes4 _interfaceID)
        
        external 
        override
        view
        returns(bool) {
            return supportedInterfaces[_interfaceID];
        }
    }
}