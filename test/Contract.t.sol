pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;
import "../lib/forge-std/src/Test.sol";
import "src/Maya.sol";
import "src/MERC20.sol";


contract TestMaya is Test {
        
    Maya public maya;
    MERC20 public token;
    uint256 price = 500 ether;
    address owner = vm.addr(23462);

    function setUp() public {
        token = new MERC20();
        maya = new Maya(address(token) , price);
        token.setMaya(address(maya));
    }

    function testBuyMaya() public{
        vm.startPrank(owner);
        console.log(address(maya));
        token.approve(address(maya), 100000 ether);
        token.getTokens();
        maya.buy{gas:110000}();
        maya.buy{gas:60000}();
        maya.buy();
        maya.hunter();
        vm.stopPrank();


    }

    // function forgeAddress(address a ) public returns (address) {
    //     bytes[] addr ;
    //     bytes20 ad = bytes20(a);
    //     for (uint256 index = 0; index < a.length; index++) {
    //         addr[index] = byte(uint8(uint(a) / (2**(8*(19 - index)))));
    //     }
    //     return address(0);
    // }

  
}

