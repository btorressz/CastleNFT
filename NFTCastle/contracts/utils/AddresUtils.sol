//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

library AddresUtils {
    
    function  isContract(address  _addr) internal view returns(bool addressCheck) {
        bytes32  codehash;
        bytes32 accountHash = "";
       assembly { codehash := extcodehash(_addr) } // solhint-disable-line
       addressCheck = (codehash != 0x0 && codehash != accountHash);

    }
}