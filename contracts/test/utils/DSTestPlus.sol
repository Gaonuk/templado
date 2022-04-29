// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.9;

import {XConsole} from "./Console.sol";

import {DSTest} from "ds-test/src/test.sol";

import {stdCheats, stdError} from "forge-std/src/stdlib.sol";
import {Vm} from "forge-std/src/Vm.sol";

contract DSTestPlus is DSTest, stdCheats {
    /* solhint-disable */
    XConsole console = new XConsole();
    /* solhint-enable */
    
    /// @dev Use forge-std Vm logic
    Vm public constant vm = Vm(HEVM_ADDRESS);
}
