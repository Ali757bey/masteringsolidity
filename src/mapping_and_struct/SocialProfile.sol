// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

error SocialProfile__AlreadyRegistered();

contract SocialProfile {
    /* Data Type */
    struct Profile {
        string username;
        string bio;
        uint256 karma;
    }

    /* State Variables */
    mapping(address => Profile) private s_profiles;
    mapping(address => bool) private s_isRegistered;

    /* Events */
    event ProfileCreated(address indexed user, string username, string bio);
    event BioUpdated(address indexed user, string bio);

    /* Functions */
    function register(string memory _username, string memory _bio) public {
        // Check
        if (s_isRegistered[msg.sender])
            revert SocialProfile__AlreadyRegistered();

        // Effect
        s_profiles[msg.sender] = Profile(_username, _bio, 0);
        s_isRegistered[msg.sender] = true;

        // Interact
        emit ProfileCreated(msg.sender, _username, _bio);
    }

    function updateBio(string memory _bio) public {
        s_profiles[msg.sender].bio = _bio;
        emit BioUpdated(msg.sender, _bio);
    }

    /* Getter */
    function getProfile(
        address _user
    ) public view returns (string memory, string memory, uint256) {
        return (
            s_profiles[_user].username,
            s_profiles[_user].bio,
            s_profiles[_user].karma
        );
    }

    function getKarma(address _user) public view returns (uint256) {
        return s_profiles[_user].karma;
    }
}
