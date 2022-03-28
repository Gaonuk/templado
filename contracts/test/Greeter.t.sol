// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "ds-test/src/test.sol";
import "forge-std/src/Vm.sol";

contract ContractTest is DSTest {
    Vm public constant vm = Vm(HEVM_ADDRESS);

    function setUp() public {}

    function testExample() public {
        assertTrue(true);
    }
}
