// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/**
 * @title Function Call を学ぼう
 * 以下Visibilityについては改めて解説する
 *  public   : コントラクトの外部からも内部からもアクセス可能
 *  external : コントラクトの外部のみアクセス可能
 *  internal : コントラクトの内部のみアクセス可能
 *  private  : コントラクトの内部のみアクセス可能だが、継承先でアクセスできない
 */
contract FunctionCall {
    /// @dev Publicファンクションは外部からCallできる
    function pub1(uint256 a, uint256 b) public pure returns (uint256) {
        return _itl1(a, b);
    }

    /// @dev Internalファンクションは外部からはCallできない。内部からのみCallできる
    function _itl1(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /// @dev External Function Call
    function ext1(uint256 a, uint256 b) external pure returns (uint256) {
        return a + b;
    }

    /// @dev PublicファンクションからPrivateファンクションをCallできる
    function pub2(uint256 a, uint256 b) public pure returns (uint256) {
        return _pri2(a, b);
    }

    function pub3(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    /// @dev PrivateファンクションからPublicファンクションをCallできる
    function _pri2(uint256 a, uint256 b) private pure returns (uint256) {
        return pub3(a, b);
    }

    /// @dev ExternalファンクションはInternalファンクションからCallできない
    function _itl3(uint256 a, uint256 b) internal view returns (uint256) {
        // return ext1(a, b);
        return this.ext1(a, b);
    }

    function pub4(uint256 a, uint256 b) public view returns (uint256) {
        return _itl3(a, b);
    }

    /// @dev 引数の指定
    function _itl4(uint256 a, uint256 b) internal pure returns (uint256) {
        return a**b;
    }

    //未使用の仮引数は名前を省略できる
    function pub5(
        uint256 a_,
        uint256 b_,
        uint256
    ) public pure returns (uint256) {
        // return _itl4({b: b_, a: a_});
        return _itl4(b_, a_);
    }
}
