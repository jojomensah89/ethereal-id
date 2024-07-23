import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import fs from "fs";

const privateKey = fs.readFileSync("secret.txt").toString().trim();

const config = {
  defaultNetwork: "localhost",
  networks: {
    hardhat: {
      chainId: 1337 || 4202,
    },
    BitTorrent: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [privateKey],
      gasPrice: 1000000000,
    },
  },
  solidity: "0.8.24",
  allowUnlimitedContractSize: true,
  throwOnTransactionFailures: true,
  throwOnCallFailures: true,
  loggingEnabled: true,
};

export default config;
