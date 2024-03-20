import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const config: HardhatUserConfig = {
  solidity: "0.8.0",
  defaultNetwork: "BNB Smart Chain",
  networks: {
    mainnet: {
      url: "https://data-seed-prebsc-2-s1.bnbchain.org:8545",
      accounts: [process.env.PRIVATE_KEY_OWNER],
      chainId: 56
    },
    testnet: {
      url: "https://data-seed-prebsc-2-s1.bnbchain.org:8545",
      accounts: [process.env.PRIVATE_KEY_OWNER],
      chainId: 97
    }
  }
};

export default config;
