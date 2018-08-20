pragma solidity 0.4.24;

// import the batch send functionalities from the contract to make all of its functions available to use
import "./BatchSend.sol";


contract HodlBatchCapsule {
    // declare all the variables required for the capsule
    address public owner_;
    uint256 public amount_;
    uint256 public unlockTime_;

    // Batch structure to define independent capsule

    // Enable only single batch to be held per capsule by creating a private instance of the Batch struct
    // Structs may only be accessed internally and may not be defined as public
    Batch private batch_;

    // Contract instance to send batch through
    BatchSend public batchSend_;

    /*
     * @notice will construct the parent contract and create a new BatchSend contract
     * @param _unlockTime how long before the capsule may be unlocked
     */
    //create the constructor function

    /*
     * @notice            Creates a new capsule batch struct if one doesn't yet exist
     * @param _addresses  Who to send the batch to 
     * @param _values     How much to send to each address
     * @param _unlockTime How long to keep value locked
     */
    // define createBatch()

        //require that the user calling the function is the owner
        
        // ensure that no batch already exists

        // create a Batch struct with filling all the variables 
    
    /*
     * @notice will send the required values to the batchSend function after the unlock time
     */
    // Define withdrawBatch() Withdraw the current batch, executing the tranfers

        //require: only owner can call, the batch exists, the capsule is unlocked 
        
        // Execute the batch, sending the eth from this contract
        // 1. call the .batchSend method of the batchSend_ contract instance
        // 2. the .value() of the call should be the .totalValue stored in the batch_ struct
        //    - this will send ether from this contract to the batchSend contract
        // 3. include the .addresses and .values from the batch_ struct

    /*
     * @returns unlocktime   the time after which the funds are available for collection
     */
    //Define batchUnlockTime() getter function
    // Structs are private so creating a getter to read batch unlockTime
        // return the unlockTime from the batch_ struct

}