// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external returns (uint256) {
        (bool ok, bytes memory result) = _priceOracle1.call(
            abi.encodeWithSignature("price()")
        );
        require(ok, "FUCK");
        uint p1 = abi.decode(result, (uint));

        (ok, result) = _priceOracle2.call(
            abi.encodeWithSignature("price()")
        );
        require(ok, "FUCK");
        uint p2 = abi.decode(result, (uint));
        if (p1 < p2) {
            return p1;
        } else {
            return p2;
        }
    }   
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
