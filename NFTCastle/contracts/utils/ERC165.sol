// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface  ERC165 {
    function supportInterface(bytes4 _interfaceID)  
        external view returns(bool);
}