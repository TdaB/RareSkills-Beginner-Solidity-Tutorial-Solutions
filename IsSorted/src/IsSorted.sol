// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public view returns (bool) {
        if (arr.length == 0) {
            return true;
        }
        uint last = arr[0];
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] < last) {
                return false;
            }
            last = arr[i];
        }
        return true;
    }
}
