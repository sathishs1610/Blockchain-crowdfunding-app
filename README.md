# Blockchain Crowdfunding DApp

Decentralized crowdfunding application on Ethereum (Sepolia testnet) built with Solidity, ethers.js and MetaMask.

## Features
- Contribute Ether to a campaign until the deadline
- Owner can withdraw funds only after the funding goal is met
- Contributors can claim a refund if the goal is not met by the deadline
- Events emitted for every contribution, withdrawal and refund

## Tech Stack
- Smart contract: Solidity 0.8
- Frontend: HTML, CSS, JavaScript, ethers.js (v6)
- Wallet: MetaMask
- Tools: Remix IDE, Ethereum Sepolia testnet

## Smart Contract
`Crowdfunding.sol` is a single-campaign contract with three functions:
- `contribute()` accepts Ether before the deadline
- `withdraw()` lets the owner withdraw once the goal is reached
- `refund()` returns a contributor's funds if the goal is missed after the deadline

The funding goal and deadline are set when the contract is deployed.

## How to Run
1. Open `Crowdfunding.sol` in [Remix IDE](https://remix.ethereum.org).
2. Compile with Solidity 0.8.x.
3. Deploy on the Sepolia testnet using MetaMask (set goal and deadline in the constructor).
4. Connect a frontend with ethers.js using the deployed contract address and ABI.

## Testing
Verified with 10 manual test cases in Remix and on Sepolia (contribution, withdrawal, refund and access control).

## Known Limitations
- One campaign per contract (multi-campaign support is future scope)

## Future Scope
- Multi-campaign support
- IPFS storage for campaign details
- ERC-20 stablecoin contributions
- React Native mobile app with WalletConnect

## Team
Academic team project (team of 4).
