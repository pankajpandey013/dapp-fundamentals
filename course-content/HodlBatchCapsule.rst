==================
Solidity Exercises
==================

1. `HODLBatch Exercise <https://raw.githubusercontent.com/Blockchain-Learning-Group/dapp-fundamentals/master/exercises/Voting_02.sol>`_
=====================================================================================================================

1.1 Copy the exercise over to `remix <https://remix.ethereum.org/#optimize=false&version=soljson-v0.4.24+commit.e67f0147.js>`_.
------------------------------------

1.2 Create the constructor function
--------------------------------------------
 - 1.2a include the unlock time param get define other hodl variables 
::
    /*
     * @notice will construct the parent contract and create a new BatchSend contract
     * @param _unlockTime how long before the capsule may be unlocked
     */
    constructor(uint256 _unlockTime) public payable {
        owner_ = msg.sender;
        amount_ = msg.value;
        unlockTime_ = now + _unlockTime;
    }
- 1.2b Create a new instance of BatchSend to use later
::
        batchSend_ = new BatchSend();

1.3 Create the createBatch function
--------------------------------------------
-1.3a Define the createBatch payable and external function
::
    /*
     * @notice            Creates a new capsule batch struct if one doesn't yet exist
     * @param _addresses  Who to send the batch to 
     * @param _values     How much to send to each address
     * @param _unlockTime How long to keep value locked
     */
    function createBatch(
        address[] _addresses, 
        uint256[] _values,
        uint256 _unlockTime
    )   external 
        payable
    {
        require(msg.sender == owner_, "msg.sender != owner");
        // ensure that no batch already exists
        require(batch_.addresses.length == 0, "batch already exists, try again later...");
        // create a Batch struct with filling all the variables 
        batch_ = Batch(_addresses, _values, now + _unlockTime, msg.value);
    }

1.4 Create the withdrawBatch() function
--------------------------------------------
::
    /*
     * @notice will send the required values to the batchSend function after the unlock time
     */
    // Withdraw the current batch, executing the tranfers
    function withdrawBatch() external {
        require(msg.sender == owner_, "msg.sender != owner");
        require(batch_.addresses.length > 0, "batch does not exist");
        require(now >= batch_.unlockTime, "Capsule not unlocked yet.");

        // Execute the batch, sending the eth from this contract
        // 1. call the .batchSend method of the batchSend_ contract instance
        // 2. the .value() of the call should be the .totalValue stored in the batch_ struct
        //    - this will send ether from this contract to the batchSend contract
        // 3. include the .addresses and .values from the batch_ struct
        batchSend_.batchSend.value(batch_.totalValue)(batch_.addresses, batch_.values);
    }   

1.5 Create the batchUnlockTime function
--------------------------------------------
::
    /*
     * @returns unlocktime   the time after which the funds are available for collection
     */
    // Structs are private so creating a getter to read batch unlockTime
    function batchUnlockTime() external view returns(uint256) {
        // return the unlockTime from the batch_ struct
        return batch_.unlockTime;
    }