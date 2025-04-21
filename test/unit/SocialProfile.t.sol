// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "lib/forge-std/src/Test.sol";
import {SocialProfile} from "src/mapping_and_struct/SocialProfile.sol";

error SocialProfile__AlreadyRegistered();

contract SocialProfileTest is Test {
    SocialProfile public social;

    address public ALI = makeAddr("ALI");

    function setUp() public {
        social = new SocialProfile();
    }

    function testRegisterStoresCorrectProfile() public {
        // Arrange
        string memory username = "ali";
        string memory bio = "Buildin' onchain";

        // Act
        vm.prank(ALI);
        social.register(username, bio);

        // Assert
        (
            string memory storedUsername,
            string memory storedBio,
            uint256 karma
        ) = social.getProfile(ALI);

        assertEq(storedUsername, username);
        assertEq(storedBio, bio);
        assertEq(karma, 0);
    }

    function testCannotRegisterTwice() public {
        // Arrange
        vm.prank(ALI);
        social.register("ali", "First one");

        // Act
        vm.prank(ALI);
        vm.expectRevert(SocialProfile__AlreadyRegistered.selector);
        social.register("ali", "Second one");
    }
}
