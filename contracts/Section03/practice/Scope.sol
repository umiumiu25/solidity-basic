// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/**
 * @title 変数スコープ を学ぼう
 */
contract Scope {
    function blockScope() public pure {
        {
            uint256 a;
            a = 10;
        }
        // ブロックが異なるので同じ変数名を定義可能
        {
            uint256 a;
            a = 11;
        }

        // このブロックスコープにaの定義はないので以下行はcompileエラーになる
        // return a;
    }

    function blockScope2() public pure returns (uint256) {
        uint256 a;
        {
            // aに代入
            a = 10;
        }
        {
            // aに代入
            a = 11;
        }
        return a;
    }

    function blockScope3() public pure returns (uint256) {
        uint256 a;
        a = 11;
        {
            // Compileエラー。下位ブロックで上位定義済みのaを再定義できない
            uint256 a;
            // aに代入
            a = 10;
        }
        return a;
    }
}
