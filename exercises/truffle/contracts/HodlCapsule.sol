pragma solidity 0.4.24;

    // declare all the required variables with their visibility

    /*
     * @notice will create an instance of parent contract
     * @param _unlockTime   specifies how many minutes after creation the value sent will be available
     */
    // create a constructor function that will take the _unlockTime as an argument, make it both public and payable

    /*
     * @notice will return available value to the owner
     */
    
    // Withdraw the capsule amount, destroying this capsule
        // require that the user trying to access the value is the owner
        // require that enough time has passed before allowing the user to unlock the value
        // use the selfdestruct method to return the value of the contract to the user