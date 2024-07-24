import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const EtherealId = buildModule("EtherealId", (m) => {
  const etherealId = m.contract('EtherealId');
  return { etherealId };
});

export default EtherealId;
