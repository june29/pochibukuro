import { ethers } from "hardhat";

async function main() {
  const PochiBukuroContract = await ethers.getContractFactory("PochiBukuro");
  const PochiBukuro = await PochiBukuroContract.deploy(
    "0x14Aea32f6E6dCAecFA1BC62776b2e279Db09255d", // chanoha.eth
    "0xc66d779B340E333bA696B2b3687FB4Bca1Eb7D0b"  // june29.eth
  );

  await PochiBukuro.deployed();

  console.log(`Deployed to ${PochiBukuro.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
