// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Pochibukuro is ERC721, Ownable {
  string baseURI;
  address immutable public designer;
  address immutable public programmer;
  uint256 private constant _FEE = 0.0005 ether;

  constructor(
    address _designer,
    address _programmer
  ) ERC721("Pochibukuro", "PCBKR") {
    designer = _designer;
    programmer = _programmer;
  }

  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }

  function setBaseURI(string memory _newBaseURI) external onlyOwner {
    baseURI = _newBaseURI;
  }

  function otoshidama(address _destination) payable external {
    require(msg.value >= _FEE * 4, "More ether required");

    address payable designerAddress = payable(designer);
    address payable programmerAddress = payable(programmer);
    designerAddress.transfer(_FEE);
    programmerAddress.transfer(_FEE);

    address payable destination = payable(_destination);
    destination.transfer(msg.value - _FEE * 2);

    uint256 tokenId = totalSupply() + 1;
    _safeMint(_destination, tokenId);
  }
}
