// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "lib/forge-std/src/Test.sol";
import {StatusTracker} from "src/mappings/StatusTracker.sol";

contract StatusTrackerTest is Test {
    event StatusUpdated(address indexed user, string newStatus);

    StatusTracker public statusTracker;

    address public ALI = makeAddr("ALI");

    function setUp() public {
        statusTracker = new StatusTracker();
    }

    function testUserCanSetStatus() public {
        // Arrange
        string memory status = "Ali learning Solidity";

        // Act
        vm.prank(ALI);
        statusTracker.setStatus(status);

        // Assert
        string memory storedStatus = statusTracker.getStatus(ALI);
        assertEq(storedStatus, status);
    }

    function testStatusUpdatedEmitsEvent() public {
        // Arrange
        string memory status = "Ali learning Solidity";

        // Act
        vm.prank(ALI);
        vm.expectEmit(true, false, false, false);
        emit StatusUpdated(ALI, status);
        statusTracker.setStatus(status);
    }
}
