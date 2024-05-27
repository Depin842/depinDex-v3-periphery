import { abi as POOL_ABI } from 'depin-dex-v3-core/artifacts/contracts/DepinDexPool.sol/DepinDexPool.json'
import { Contract, Wallet } from 'ethers'
import { IUniswapV3Pool } from '../../typechain'

export default function poolAtAddress(address: string, wallet: Wallet): IUniswapV3Pool {
  return new Contract(address, POOL_ABI, wallet) as IUniswapV3Pool
}
