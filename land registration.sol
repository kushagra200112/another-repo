pragma solidity 0.5.0;
contract land_buyer{

    event Buy(
        address buyer,
        address seller,
        uint256 indexed value,
        string indexed locality,
        uint256 date
    );

    event Pay_tax(
        address indexed inspector,
        address indexed buyer,
        uint tax
    );

    mapping(address => uint256) public account;
    mapping(address => string) public area;


    function transact(address buyer,address seller, string memory locality, uint256 value) public {
        account[buyer]-=value;
        account[seller]+=value;
        locality=area[seller];
        area[buyer]=locality;
        emit Buy(buyer, seller, value, locality, block.timestamp);
    }

    function tax_transact(address inspector, address buyer, uint tax) public{
        account[buyer]-=tax;
        account[inspector]+=tax;
        emit Pay_tax(inspector, buyer, tax);
    }
}
