==================
Truffle Exercises
==================

1. `Simple Storage Exercise <https://raw.githubusercontent.com/Blockchain-Learning-Group/dapp-fundamentals/master/exercises/Voting_02.sol>`_
=====================================================================================================================
- `View Final Solution Simple Storage <https://drive.google.com/open?id=1HUlqRB62Y57RXIbGmp4ckmHuc2cpHqkb>`_

`Video Tutorial[1.1 - 1.3][no audio] <https://drive.google.com/open?id=13DBLIclqpJ9iNtRWzSvJ8NGzBM-LTbdD>`_

1.1 Copy the exercise over to `remix <https://remix.ethereum.org/#optimize=false&version=soljson-v0.4.24+commit.e67f0147.js>`_.
------------------------------------

1.2 Define the Simple Storage contract and storedData variable
--------------------------------------------
::
    contract SimpleStorage {
        uint256 storedData;
    }

1.3 Create the functions to set and get the storedData value
-----------------------------------------------------

  - 1.3a Create a function to set the data
  ::

    function set(uint256 x) public {
        storedData = x;
    }

  - 1.3b Create an event for when a vote is cast, Line 18
  -----------------------------
  ::

    event VoteCast(address voter, string votedFor);

  - 1.3c Emit an event that a new vote has been cast, Line 46
  ::