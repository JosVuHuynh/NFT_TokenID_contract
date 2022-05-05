pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

// # List array token NFT 721 [token1,token2,token3], address owner
// # Return [[token1,[id1,id2]],[token2,[id1,id2]],[token3,[id1,id2]] ]
// interface IToken is ERC721 {

// }

contract ContractInfo {

    struct TokenIDInfo {
        address typeOfToken;
        uint256[] IDs;
    }

    TokenIDInfo[] tokenIDInfos;

    function getAllTokenIDs(address ownerAddress, address[] memory tokens) public {
        for (uint256 i = 0; i < tokens.length; i++){
            ERC721Enumerable token = ERC721Enumerable(tokens[i]);

            uint256 j = token.balanceOf(ownerAddress);

            if (j == 0) {
                continue;
            }

            uint256[] memory ids;

            for (uint256 k = 0; k<j; k++){
                ids[k] = token.tokenOfOwnerByIndex(ownerAddress, k);
            }
            tokenIDInfos.push(TokenIDInfo(tokens[i],ids));
        }
    }
    
}
