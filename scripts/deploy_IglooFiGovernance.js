const { ethers } = require('hardhat');

async function main() {
	const [deployer] = await ethers.getSigners();

	const admin = ethers.utils.getAddress("0x01208B888908b10089503E4C691FB91863041920");

	console.log(`Deploying contracts with the account: ${deployer.address}`);

	const IglooFiGovernance = await ethers.getContractFactory(
		'IglooFiGovernance'
	);

	const iglooFiGovernance = await IglooFiGovernance.deploy();

	console.log(`Contract address: ${iglooFiGovernance.address}`);
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