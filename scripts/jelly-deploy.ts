import { formatEther, parseEther } from "viem";
import hre from "hardhat";

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = BigInt(currentTimestampInSeconds + 60);

  const amount = parseEther("0.001");

  const Jelly = await hre.viem.deployContract("Jelly", [unlockTime], {
    value: amount,
  });

  console.log(
    `Lock with ${formatEther(
      amount
    )}ETH and unlock timestamp ${unlockTime} deployed to ${Jelly.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
