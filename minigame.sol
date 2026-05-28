// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;
contract minecraft {
    mapping(address => address) private _players;

    function createPlayer(string memory _name, uint _hp, uint _damage) external {
        Player newPlayer = new Player(_name, _hp, _damage);
        _players[msg.sender] = address(newPlayer);
    }

    function getPlayerInfo() external view returns (Player.Info memory) {
        require(_players[msg.sender] != address(0), "no info");
        return Player(_players[msg.sender]).getInfo();
    }
}

contract Player {
    struct Info {
        string _name;
        uint hp;
        uint damage;
    }

    Info public info;

    constructor(string memory _name, uint _hp, uint _damage) {
        info = Info(_name, _hp, _damage);
    }

    function getInfo() external view returns (Info memory) {
        return info;
    }
}