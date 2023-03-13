// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


/**
* @title IYieldSyncGovernance
*/
interface IYieldSyncGovernance
{
	/**
	* @notice Get
	* @dev [!restriction]
	* @dev [view-mapping]
	* @return {bytes32}
	*/
	function role_roleHash(string memory role)
		external
		view
		returns (bytes32)
	;

	/**
	* @notice Add to role_roleHash
	* @dev [restriction] AccessControlEnumerable → DEFAULT_ADMIN_ROLE
	* @dev [add] `role_roleHash`
	*      [update] AccessControlEnumerable → Add `_role`
	* @param role {string}
	*/
	function addRole_roleHash(string memory role)
		external
	;
}
