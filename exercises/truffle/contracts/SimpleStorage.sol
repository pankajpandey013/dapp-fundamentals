pragma solidity 0.4.24;


    // define a uint256 variable called storedData


    /*
     * @notice will set the value of the storedData variable
     * @param x  value to be stored
     */
    // create a function to set() the value of storedData - change its visibility to public

    /*
     * @notice will return the value of storedData
     */
    // create a function to get() the value of storedData - change its visibility to public view 
    function get() public view returns (uint256) {
        return storedData;
    }
}