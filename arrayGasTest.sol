pragma solidity 0.7.5;
pragma abicoder v2;

contract arrayAssign {
    struct Entity {
        uint256 data;
        address _address;
    }

    Entity[] EntityArray;

    function addEntity(uint256 _data) public returns (bool success) {
        Entity memory newEntity;
        newEntity.data = _data;
        newEntity._address = msg.sender;
        EntityArray.push(newEntity);
        return true;
    }

    function updateEntity(uint256 _index, uint256 _data)
        public
        returns (bool success)
    {
        require(
            EntityArray[_index]._address == msg.sender,
            "Only entity owner can update values."
        );
        EntityArray[_index].data = _data;
        return true;
    }

    // validating and getting values
    function getEntityArr() public view returns (Entity[] memory) {
        return EntityArray;
    }
}

// Contract deplyoment cost
// 264366 gas

// Cost on adding entity
// transaction cost - 83747 gas
// execution cost - 62283 gas

// Cost on updating entity
// transaction cost - 84049 gas
// execution cost - 62585 gas
