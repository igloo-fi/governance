// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


/* [import] */
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

import "./interface/IIglooFiGovernance.sol";


/**
* @title IglooFiGovernance
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
		_setRoleAdmin(S, S);
		_setRoleAdmin(A, S);
		_setRoleAdmin(B, S);
		_setRoleAdmin(C, S);

		_setupRole(S, _msgSender());
	}
}


/*
*  __  ___  __     __    __     ____  __  
* (  )/ __)(  )   /  \  /  \   (  __)(  ) 
*  )(( (_ \/ (_/\(  O )(  O )   ) _)  )(  
* (__)\___/\____/ \__/  \__/   (__)  (__) 
*
*  ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⡆⢰⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
*  ⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⠛⠃⠘⠛⠛⠛⠛⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
*  ⠀⠀⠀⠀⣠⣾⣿⠏⢠⣾⣿⣿⣿⣿⣿⣦⠈⢿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
*  ⠀⠀⠀⠐⠛⠛⠛⠀⠛⠛⠛⠛⠛⠛⠛⠛⠃⠘⠛⠛⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀
*  ⠀⠀⢰⠇⣾⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⠏⣰⣿⣿⡏⢠⣾⣿⡟⠁⠸⣷⠀⠀
*  ⠀⠀⣉⣀⣉⣉⣉⠉⣉⣉⣉⣁⣈⣉⣉⡉⠀⣉⣉⣉⠀⣈⣉⣉⠁⠀⠀⣿⡇⠀
*  ⠀⠸⠿⠿⠿⠿⠿⠀⠿⠿⠿⠿⠿⠿⠿⠟⠀⠿⠿⠿⠀⠿⠿⠿⠁⠀⠀⠻⠇⠀
*
*/