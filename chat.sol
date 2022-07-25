//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Chat {

    // Registro de usuarios, de acuerdo a su address
    mapping(address => string) private usuarios;

    struct Post {
        uint date;
        string mensaje;
        string username;
    }
    // Registro de mensajes del chat (arreglo dinamico)
    Post[] private mensajes; 

    // Acceso a todos los mensajes almacenados
    function messages() public view returns (Post[] memory) {
        return (mensajes);
    }
    
    // Agregado de un nuevo post
    function addMessage(string memory _user, string memory _text) public {
        usuarios[msg.sender] = _user; // Registra (o actualiza) el usuario segun su address
        mensajes.push(Post(block.timestamp, _text, _user)); // Agrega un nuevo struct al arreglo
    }

    // Retorna el ultimo mensaje registrado
    function getLastMessage() public view returns(string memory, string memory) {
        Post memory p = mensajes[mensajes.length-1];
        return (p.username, p.mensaje);
    }

    /*function getLastMessages(uint8 _n) public view returns(string[] memory) {
        string[] memory result;
        for (uint i = 0; (i < _n) && (i < mensajes.length); i++) {
            result[i] = mensajes[i].mensaje;
        }
        return result;
    }*/
}