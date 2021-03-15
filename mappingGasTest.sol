pragma solidity 0.7.5;

contract mappingAssign {
    struct Entity {
        uint256 data;
        address _address;
    }

    mapping(address => Entity) Entities;

    // addEntity(). Creates a new entity for msg.sender and adds it to the mapping.
    function addEntity(uint256 _data) public returns (bool success) {
        Entities[msg.sender].data = _data;
        Entities[msg.sender]._address = msg.sender;
        return true;
    }

    // updateEntity(). Updates the data in a saved entity for msg.sender
    function updateEntity(uint256 _data) public returns (bool success) {
        Entities[msg.sender].data = _data;
        return true;
    }

    // validating and getting values
    function getEntityMap() public view returns (uint256, address) {
        return (Entities[msg.sender].data, Entities[msg.sender]._address);
    }
}

// Contract deployment cost
// 197669 gas

// Cost on adding entity
// transaction cost - 62818 gas
// execution cost - 41354 gas

// Cost on updating entity
// transaction cost - 26879 gas
// execution cost - 5415 gas
