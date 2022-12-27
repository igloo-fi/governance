// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

import "./interface/IIglooFiGovernance.sol";


/**
* @title Igloo Fi Governance
* @author harpoonjs.eth
*/
contract IglooFiGovernance is
	AccessControlEnumerable,
	IIglooFiGovernance
{
	/* [state-variables] */
	/// @inheritdoc IIglooFiGovernance
	bytes32 public constant S = keccak256("S");
	/// @inheritdoc IIglooFiGovernance
	bytes32 public constant A = keccak256("A");
	/// @inheritdoc IIglooFiGovernance
	bytes32 public constant B = keccak256("B");
	/// @inheritdoc IIglooFiGovernance
	bytes32 public constant C = keccak256("C");


	/* [constructor] */
	constructor ()
	{
		_setRoleAdmin(DEFAULT_ADMIN_ROLE, S);

		_setupRole(S, _msgSender());
	}
}
/*
*    _________    ____  ____  _____   _____    __       ____  ____  ____  __________  __________  __ 
*   / ____/   |  / __ \/ __ \/  _/ | / /   |  / /      / __ \/ __ \/ __ \/_  __/ __ \/ ____/ __ \/ / 
*  / /   / /| | / /_/ / / / // //  |/ / /| | / /      / /_/ / /_/ / / / / / / / / / / /   / / / / /  
* / /___/ ___ |/ _, _/ /_/ // // /|  / ___ |/ /___   / ____/ _, _/ /_/ / / / / /_/ / /___/ /_/ / /___
* \____/_/  |_/_/ |_/_____/___/_/ |_/_/  |_/_____/  /_/   /_/ |_|\____/ /_/  \____/\____/\____/_____/
*/