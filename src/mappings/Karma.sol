// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

error Karma__CannotSendToSelf();

contract Karma {
    /* State Variable */
    mapping (address => uint256) private s_karma;

    /* Event */
    event KarmaSent (address indexed from, address indexed to, uint256 totalReceived);

    /* Functions */
    function sendKarma (address _to) public {
        // Check
        if(_to == msg.sender) revert Karma__CannotSendToSelf();

        // Effect
        s_karma[_to] += 1;

        // Interaction
        emit KarmaSent(msg.sender, _to, s_karma[_to]);
    }

    /* Getters */
    function getKarma (address _user) public view returns (uint256) {
        return s_karma[_user];
    }
}
