// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

error StatusBoard__EmptyStatus();
error StatusBoard__StatusTooLong();

contract StatusBoard {
    /* State Variables */
    mapping (address => string) private s_statuses;

    /* Event */
    event StatusUpdated(address indexed user, string newStatus);

    /* Functions */
    function setStatus(string memory _status) public {
        if (bytes(_status).length == 0) revert StatusBoard__EmptyStatus();
        if (bytes(_status).length > 100) revert StatusBoard__StatusTooLong();

        s_statuses[msg.sender] = _status;
        emit StatusUpdated(msg.sender, _status);
    }

    /* Getters */
    function getStatus (address _user) public view returns (string memory) {
        return s_statuses[_user];
    }
}
