// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;

import 'depin-dex-v3-core/contracts/interfaces/IDepinDexPool.sol';
import './PoolAddress.sol';

/// @notice Provides validation for callbacks from DepinDex  Pools
library CallbackValidation {
    /// @notice Returns the address of a valid DepinDex  Pool
    /// @param factory The contract address of the DepinDex  factory
    /// @param tokenA The contract address of either token0 or token1
    /// @param tokenB The contract address of the other token
    /// @param fee The fee collected upon every swap in the pool, denominated in hundredths of a bip
    /// @return pool The  pool contract address
    function verifyCallback(
        address factory,
        address tokenA,
        address tokenB,
        uint24 fee
    ) internal view returns (IDepinDexPool pool) {
        return verifyCallback(factory, PoolAddress.getPoolKey(tokenA, tokenB, fee));
    }

    /// @notice Returns the address of a valid DepinDex  Pool
    /// @param factory The contract address of the DepinDex  factory
    /// @param poolKey The identifying key of the  pool
    /// @return pool The  pool contract address
    function verifyCallback(address factory, PoolAddress.PoolKey memory poolKey)
        internal
        view
        returns (IDepinDexPool pool)
    {
        pool = IDepinDexPool(PoolAddress.computeAddress(factory, poolKey));
        require(msg.sender == address(pool));
    }
}
