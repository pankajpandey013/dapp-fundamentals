==================
Solidity Exercises
==================

1. `Batch Send Exercise <https://raw.githubusercontent.com/Blockchain-Learning-Group/dapp-fundamentals/master/exercises/Voting_02.sol>`_
=====================================================================================================================

1.1 Copy the exercise over to `remix <https://remix.ethereum.org/#optimize=false&version=soljson-v0.4.24+commit.e67f0147.js>`_.
------------------------------------

1.2 Define BatchSend Smart Contract and an event BatchSent to return an array of addresses
--------------------------------------------
::

    contract BatchSend {
        event BatchSent(address[] addresses);
        // add function here
    }

1.3 Create the batchSend payable function
-----------------------------------------------------
    
  - 1.3a Define the function with its params
::

     /*
      * @param _addresses  Array of addresses that will be recieving value
      * @param _values     Corresponding array of how much value each will be recieving
      */
    function batchSend(
        address[] _addresses, 
        uint256[] _values
    ) 
    {
        // add functionality here
    }

  - 1.3b Add the external visibility, return variable and make the function payable
  -----------------------------
  ::

     /*
      * @param _addresses  Array of addresses that will be recieving value
      * @param _values     Corresponding array of how much value each will be recieving
      */
    function batchSend(
        address[] _addresses, 
        uint256[] _values
    )   external
        payable
        returns(bool) 
    {
        //add functionality here
    }

1.4 Ensure that each address has an associated value to be sent
-----------------------------
  ::

    require(_addresses.length == _values.length, "Sanity check, array lengths do not match");


1.5 Create a counter to ensure no value from contract being used, only the ether sent to the contract is available
--------------------------------------------
  ::

    uint256 remainingValue = msg.value;
1.6 Loop through the lists and send the transactions
--------------------------------------------
::
    for (uint8 i = 0; i < _addresses.length; i++) {
            // require that the user has sent enough ether to send to the appropriate users
            require(remainingValue >= _values[i], "Insufficient ether sent to fill the batch");
            // user the .transfer(<value>) method to send ether to the specified addresses
            _addresses[i].transfer(_values[i]);
            // decrease the remainingValue based on the amount sent to the address in this iteration
            remainingValue -= _values[i]; 
        }

1.7 Send back any remaining value to sender
--------------------------------------------
::
    // send back any remaining value to sender using an if statement checking the remainingValue
    if (remainingValue > 0) {
        // send back remaining ether to the user
        msg.sender.transfer(remainingValue);
    }   

1.8 Emit an event with the appropriate argument and return true to the function
        emit BatchSent(_addresses);
        return true;
--------------------------------------------
::
    // send back any remaining value to sender using an if statement checking the remainingValue
    if (remainingValue > 0) {
        // send back remaining ether to the user
        msg.sender.transfer(remainingValue);
    }   
====