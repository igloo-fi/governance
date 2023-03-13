// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import { AccessControlEnumerable } from "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

import { IYieldSyncGovernance } from "./interface/IYieldSyncGovernance.sol";


/**
* @title YieldSyncGovernance
*/
contract YieldSyncGovernance is
	AccessControlEnumerable,
	IYieldSyncGovernance
{
	// [mapping]
	mapping (string => bytes32) internal _governanceRoles;


	constructor ()
	{
		_governanceRoles["DEFAULT_ADMIN_ROLE"] = DEFAULT_ADMIN_ROLE;

		_setupRole(_governanceRoles["DEFAULT_ADMIN_ROLE"], _msgSender());
	}


	/// @inheritdoc IYieldSyncGovernance
	function governanceRoles(string memory role)
		public
		view
		override
		returns (bytes32)
	{
		return _governanceRoles[role];
	}

	/// @inheritdoc IYieldSyncGovernance
	function addGovernanceRole(string memory role)
		public
		override
		onlyRole(_governanceRoles["DEFAULT_ADMIN_ROLE"])
	{
		_governanceRoles[role] = keccak256(abi.encodePacked(role));

		_setRoleAdmin(_governanceRoles[role], DEFAULT_ADMIN_ROLE);
	}
}


/*
* __  ___      __    __   _____
* \ \/ (_)__  / /___/ /  / ___/__  ______  _____
*  \  / / _ \/ / __  /   \__ \/ / / / __ \/ ___/
*  / / /  __/ / /_/ /   ___/ / /_/ / / / / /__
* /_/_/\___/_/\__,_/   /____/\__, /_/ /_/\___/
*                           /____/
*/
