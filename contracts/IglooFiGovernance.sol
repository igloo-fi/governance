// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

import "./interface/IIglooFiGovernance.sol";


/**
* @title IglooFiGovernance
*/
contract IglooFiGovernance is
	AccessControlEnumerable,
	IIglooFiGovernance
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


	/// @inheritdoc IIglooFiGovernance
	function governanceRoles(string memory role)
		public
		view
		returns (bytes32)
	{
		return _governanceRoles[role];
	}

	/// @inheritdoc IIglooFiGovernance
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
*    ___________   ____  ____    ________
*   /  _/ ___/ /  / __ \/ __ \  / __/  _/
*  _/ // (_ / /__/ /_/ / /_/ / / _/_/ /  
* /___/\___/____/\____/\____/ /_/ /___/  
*                                        
*        ⢀⣤⣴⡆⢰⣶⣤⣀
*       ⠚⠛⠛⠛⠃⠘⠛⠛⠛⠛⠂
*    ⣠⣾⣿⠏⢠⣾⣿⣿⣿⣿⣿⣦⠈⢿⣿⣦
*   ⠐⠛⠛⠛ ⠛⠛⠛⠛⠛⠛⠛⠛⠃⠘⠛⠛⠓
*  ⢰⠇⣾⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⠏⣰⣿⣿⡏⢠⣾⣿⡟⠁⠸⣷
*  ⣉⣀⣉⣉⣉⠉⣉⣉⣉⣁⣈⣉⣉⡉ ⣉⣉⣉ ⣈⣉⣉    ⣿⡇
* ⠸⠿⠿⠿⠿⠿ ⠿⠿⠿⠿⠿⠿⠿⠟ ⠿⠿⠿ ⠿⠿⠿    ⠻⠇
*/