// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

import "./interface/IYieldSyncGovernance.sol";


/**
* @title YieldSyncGovernance
*/
contract YieldSyncGovernance is
	AccessControlEnumerable,
	IYieldSyncGovernance
{
	/* [state-variables] */
	// [internal]
	mapping (string => bytes32) internal _governanceRoles;


	/* [constructor] */
	constructor ()
	{
		// [add] `_governanceRoles`
		_governanceRoles["DEFAULT_ADMIN_ROLE"] = DEFAULT_ADMIN_ROLE;

		// [add] msg.sender to DEFAULT_ADMIN_ROLE on `AccessControlEnumerable`
		_setupRole(_governanceRoles["DEFAULT_ADMIN_ROLE"], _msgSender());
	}


	/// @inheritdoc IYieldSyncGovernance
	function governanceRoles(string memory role)
		public
		view
		returns (bytes32)
	{
		return _governanceRoles[role];
	}

	/// @inheritdoc IYieldSyncGovernance
	function addGovernanceRole(string memory role)
		public
		onlyRole(_governanceRoles["DEFAULT_ADMIN_ROLE"])
	{
		// [add] `_governanceRoles`
		_governanceRoles[role] = keccak256(abi.encodePacked(role));

		// [update] `AccessControlEnumerable` → `_roles`
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