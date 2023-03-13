const { ethers } = require('hardhat');

async function main() {
	const [deployer] = await ethers.getSigners();

	console.log(`Deploying contracts with the account: ${deployer.address}`);

	const YieldSyncGovernance = await ethers.getContractFactory(
		'YieldSyncGovernance'
	);

	const yieldSyncGovernance = await YieldSyncGovernance.deploy();

	console.log(`Contract address: ${yieldSyncGovernance.address}`);
}

main()
	.then(() => {
		process.exit(0);
	})
	.catch((error) => {
		console.error(error);
		process.exit(1);
	})
;