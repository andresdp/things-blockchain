//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FirstContract {
    uint cedula; // Estas variables de estado se van a persistir en la BC
    string nombre;
    uint edad;

    function setData(uint _cedula, string memory _nombre, uint _edad) public { // Si es publico, cualquier contrato puede invocar este funcion
        cedula = _cedula; 
        nombre = _nombre;
        edad = _edad;
    }

    function getId() public view returns (uint) { // La palabra view quiere decir que vamos a poder acceder a variables de estado
        return cedula;
    }

    function getName() public view returns (string memory) {
        return nombre;
    }

    function getAge() public view returns (uint) {
        return edad;
    }

    function getFullData() public view returns(uint, string memory, uint) {
        return (cedula, nombre, edad);
    }

}