// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Struct {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function exapmles () external {
        Car memory toyota = Car("toyota", 1990 , msg.sender);
        Car memory lambo = Car({ year: 2000, model:"lambo", owner:msg.sender });
        Car memory tesla;
        tesla.model = "tesla";
        tesla.year = 2022;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        Car storage _car = cars[0];
        _car.year = 1999;
        delete _car.owner;

        delete cars[1];
    }
}