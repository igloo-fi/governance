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
	mapping (string role => bytes32 roleHash) public role_roleHash;


	constructor ()
	{
		role_roleHash["DEFAULT_ADMIN_ROLE"] = DEFAULT_ADMIN_ROLE;

		_setupRole(role_roleHash["DEFAULT_ADMIN_ROLE"], _msgSender());
	}


	/// @inheritdoc IYieldSyncGovernance
	function addRole_roleHash(string memory role)
		public
		override
		onlyRole(role_roleHash["DEFAULT_ADMIN_ROLE"])
	{
		role_roleHash[role] = keccak256(abi.encodePacked(role));

		_setRoleAdmin(role_roleHash[role], DEFAULT_ADMIN_ROLE);
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
