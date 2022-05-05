pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";


contract TokenIDInfo {

    struct TokenIDInfo {
        address tokenAddres;
        uint256[] tokenIDs;
    }

    TokenIDInfo[] public tokenIDInfos;

    function findAllTokenID(address ownerAddress, address[] memory tokens) public  {
        for (uint256 i = 0; i < tokens.length; i++){
            ERC721Enumerable token = ERC721Enumerable(tokens[i]);

            uint256 balance = token.balanceOf(ownerAddress);

            if (balance == 0) {
                continue;
            }

            uint256[] memory tokenIDs = new uint256[](balance);

            for (uint256 j = 0; j < balance; j++){
                tokenIDs[j] = token.tokenOfOwnerByIndex(ownerAddress, j);
            }

            tokenIDInfos.push(TokenIDInfo(tokens[i],tokenIDs));
        }

    }
    

    function getTokenIDInfo() public view returns(TokenIDInfo[] memory) {
        return tokenIDInfos;
    }
    
}
