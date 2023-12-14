// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/**
 * @title Function Type を学ぼう
 * フリーファンクションとpure/viewファンクション
 */

/// @dev contract外でも定義可能。「フリーファンクション」とも呼ばれ、常に暗黙のInternal visibilityを持つ
function sum(uint256[] memory array) pure returns (uint256 s) {
    for (uint256 i; i < array.length; i++) {
        s += array[i];
    }
}

function mul(uint256[] memory array) pure returns (uint256) {
    uint256 m = 1;
    for (uint256 i; i < array.length; i++) {
        m *= array[i];
    }
    return m;
}

contract Function {
    /** @dev ファンクションヘッダーの構文
     * function (<parameter types>) {external|public|internal|private} [pure|view|payable] [returns (<return types>)]
     */

    // State Mutability
    /**
     * @dev 何も指定しない/view/pureを宣言することができる
     * 何も指定しない : 状態変数を変更したりするときに使う（ = トランザクション発行）
     * pure : 状態変数やグローバル変数にアクセスしない場合に指定。
     * view : 状態変数やグローバル変数を参照する場合に指定。状態を変更しないことが約束される。
     * (payable : ETH送金などのときにはpayableの指定が上記に追加で必要)
     */

    // Member Method
    /**
     * @dev ファンクション型のメンバーメソッド(.address)を返す
     * .address : 指定のファンクションが属するコントラクトのアドレスを取得
     */
    function viewF() public view returns (address) {
        return this.viewF.address;
    }

    function pureF(uint256 a, uint256 b) public pure returns (uint256) {
        return (a + b);
    }

    /// @dev Function return variables（関数の戻り値変数）を利用した複数return
    function sumMulF(uint256[] memory array)
        public
        pure
        returns (uint256, uint256)
    {
        return (sum(array), mul(array));
    }
}
