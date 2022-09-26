//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Item {
    uint priceInWei;
    uint index;
    uint paidWei;

    itemManager parentContract;

    constructor(itemManager _parentContract, uint _priceInWei, uint _index) {
        priceInWei = _priceInWei;
        index = _index;
        parentContract = _parentContract;
    }

    receive() external payable {
        require(msg.value == priceInWei, "only supports full pyament..");
        require(paidWei == 0, "already paid..");
        paidWei += msg.value;

        (bool success,) = address(parentContract).call{value: msg.value}(abi.encodeWithSignature("triggerPayment(uint256)", index));

        require(success, "delivery didn't work!");
    }

    fallback() external {}
}

contract itemManager {

    enum SupplyChainSteps {
        Created,
        Paid,
        Delivered
    }

    struct S_Item {
        Item _item;
        string identifier;
        itemManager.SupplyChainSteps _states;
    }

    mapping(uint => S_Item) public items;
    uint index;

    event SupplyChainStep(uint _ietmIndex, uint _state, address _address);

    function createItem(string memory _identifier, uint _priceInWei) public {
        Item item = new Item(this, _priceInWei, index);
        items[index]._item = item;

        items[index].identifier = _identifier;
        items[index]._states = SupplyChainSteps.Created;

        emit SupplyChainStep(index, uint(items[index]._states), address(item));
        index++;
    }

    function triggerPayment(uint _ietmIndex) public payable {
        Item item = items[_ietmIndex]._item;
        require(address(item) == msg.sender, "Only items are allowed to update themselves");
        // require(item.priceInWei() == msg.value, "Not fully paid yet");

        require(items[index]._states == SupplyChainSteps.Created, "item is further in supply chain");
        items[_ietmIndex]._states = SupplyChainSteps.Paid;

        emit SupplyChainStep(_ietmIndex, uint(items[_ietmIndex]._states), address(item));
    }

    function triggerDelivery(uint _ietmIndex) public {
        require(items[_ietmIndex]._states == SupplyChainSteps.Paid, "item is further in supply chain");
        items[_ietmIndex]._states = SupplyChainSteps.Delivered;

        emit SupplyChainStep(_ietmIndex, uint(items[_ietmIndex]._states), address(items[_ietmIndex]._item));
    }
}