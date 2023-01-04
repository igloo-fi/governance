// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


/**
* @title IIglooFiGovernance
*/
interface IIglooFiGovernance 
{
	/**
	* @notice Governance Roles
	*
	* @dev [!restriction]
	* @dev [view][mapping]
	*
	* @return {bytes32}
	*/
	function governanceRoles(string memory role)
		external
		view
		returns (bytes32)
	;

	/**
	* @notice Adds a role to `_governanceRoles`
	*
	* @dev [restriction] AccessControlEnumerable → DEFAULT_ADMIN_ROLE 
	* @dev [add] `_governanceRoles`
	*      [update] `AccessControlEnumerable` → `_roles`
	*
	* @param role {string}
	*/
	function addGovernanceRole(string memory role)
		external
	;
}