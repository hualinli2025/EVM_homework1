// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorldGroup {
    string private text;
    string private password;  // Simple authentication method

    event TextUpdated(string newText, address updatedBy);
    event PasswordChanged(string newPassword);

    constructor(string memory initialPassword) {
        text = "Hello World";
        password = initialPassword;
    }

    function helloWorld() public view returns (string memory) {
        return text;
    }

    function setText(string calldata newText, string calldata pass) public {
        require(keccak256(abi.encodePacked(pass)) == keccak256(abi.encodePacked(password)), "Wrong password!");
        text = newText;
        emit TextUpdated(newText, msg.sender);
    }

    function changePassword(string calldata newPass, string calldata oldPass) public {
        require(keccak256(abi.encodePacked(oldPass)) == keccak256(abi.encodePacked(password)), "Wrong password!");
        password = newPass;
        emit PasswordChanged(newPass);
    }
}
