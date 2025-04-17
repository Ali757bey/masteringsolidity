// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract StatusTracker {
    /* State Variables */
    mapping(address => string) private s_statuses;

    /* Events */
    event StatusUpdated(address indexed user, string newStatus);

    /* Functions */
    function setStatus(string memory _status) public {
        // Effect
        s_statuses[msg.sender] = _status;

        // Interact
        emit StatusUpdated(msg.sender, _status);
    }

    /* Getter */
    function getStatus(address _user) public view returns (string memory) {
        return s_statuses[_user];
    }
}
