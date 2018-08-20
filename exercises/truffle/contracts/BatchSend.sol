pragma solidity ^0.4.24;
    
// define an event: batchSent that will return an array of addresses

/*
* @param _addresses  Array of addresses that will be recieving value
* @param _values     Corresponding arr of how much value each will be recieving
*/
//define the BatchSend Contract with the appropriate params


        // ensures that each address has an associated value to be sent


        // counter to ensure no value from contract being used, only the ether sent to the contract is available


        // create a loop to iterate through each address and ether to send all transactions.

            // require that the user has sent enough ether to send to the appropriate users

            // user the .transfer(<value>) method to send ether to the specified addresses

            // decrease the remainingValue based on the amount sent to the address in this iteration


        //  if statement checking if remainingValue > 0

            // send back remaining ether to the user


        // emit the event declared with the appropriate argument
        // return the true to the function