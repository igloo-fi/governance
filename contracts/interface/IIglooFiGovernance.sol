// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


/**
* @title IIglooFiGovernance
* @author harpoonjs.eth
*/
interface IIglooFiGovernance 
{
	/**
	* @notice governanceRoles
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
	* @notice Invalid return value for isValidSignature
	*
	* @dev [restriction] AccessControlEnumerable → DEFAULT_ADMIN_ROLE 
	* @dev [add] `govRoles`
	*      [update] `AccessControlEnumerable` → `_roles`
	*
	* @param role {string}
	*/
	function addGovernanceRole(string memory role)
		external
	;
}