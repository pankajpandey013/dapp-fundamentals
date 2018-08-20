==================
Solidity Exercises
==================

1. `HODL Exercise <https://raw.githubusercontent.com/Blockchain-Learning-Group/dapp-fundamentals/master/exercises/Voting_02.sol>`_
=====================================================================================================================

1.1 Copy the exercise over to `remix <https://remix.ethereum.org/#optimize=false&version=soljson-v0.4.24+commit.e67f0147.js>`_.
------------------------------------

1.2 Define HODL Smart Contract and the required variables
--------------------------------------------
::

    // declare all the required variables with their visibility
    address public owner_;
    uint256 public amount_;
    uint public unlockTime_;

1.3 Create the contructor function
-----------------------------------------------------
    
  - 1.3a Define the function with its params
::

   constructor(uint256 _unlockTime) public payable {
        // specify the owner_
        owner_ = msg.sender;
        // specify the amount_
        amount_ = msg.value;
        // specify the unlockTime_
        unlockTime_ = now + _unlockTime;
    }

1.4 Create the withdraw functionality
-----------------------------
    - 1.4a Define
    ::

        // Withdraw the capsule amount, destroying this capsule
        function withdraw() external {
        }

     - 1.4b Require 1
    ::
        // require that the user trying to access the value is the owner
        require(msg.sender == owner_, "msg.sender != owner");
    
     - 1.4c Require 2
    ::
        // require that enough time has passed before allowing the user to unlock the value
        require(now >= unlockTime_, "Capsule not unlocked yet.");

    - 1.4d Return Value
        // use the selfdestruct method to return the value of the contract to the user
        selfdestruct(owner_);

====