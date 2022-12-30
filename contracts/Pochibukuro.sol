// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Pochibukuro is ERC721, Ownable {
  string baseURI;

  constructor() ERC721("Pochibukuro", "PCBKR") {}

  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }

  function setBaseURI(string memory _newBaseURI) external onlyOwner {
    baseURI = _newBaseURI;
  }

  function otoshidama(address _destination) payable external {
    require(msg.value >= 0.002 ether, "0.002 ether required");

    address payable destination = payable(_destination);
    destination.transfer(msg.value);

    uint256 tokenId = totalSupply() + 1;
    _safeMint(_destination, tokenId);
  }
}
