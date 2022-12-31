import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: process.env.ALCHEMY_API_HTTPS_ENDPOINT_GOERLI,
      accounts: [process.env.ETHEREUM_WALLET_PRIVATE_KEY]
    },
    mainnet: {
      url: process.env.ALCHEMY_API_HTTPS_ENDPOINT_MAINNET,
      accounts: [process.env.ETHEREUM_WALLET_PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
};

export default config;
