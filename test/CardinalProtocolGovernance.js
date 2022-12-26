const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Cardinal Protocol Governance Contract", function () {
  it(
    "Should set the msg.sender to DEFAULT_ADMIN_ROLE",
    async function () {
      const CardinalProtocol = await ethers.getContractFactory(
        "CardinalProtocolGovernance"
      );
      const cardinalProtocol = await CardinalProtocol.deploy();
    }
  );
});
