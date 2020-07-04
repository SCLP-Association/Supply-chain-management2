pragma solidity 0.5.17;

contract SupplyChain{
    address public manufacturerAddress;
    address public partnersAddress;
    struct manufacturer { 
        address mfgaddress;
        bytes32 mfgName;
        bytes32 mfgLocation;
    }
 
mapping(address=>manufacturer) manufacturerDetails;
address[] public manufacturers;
    

struct partner{
    address partnerAddress;
    bytes32 partnerName;
    bytes32 partnerLocation;
    bytes32 role;
}

mapping(address => partner) partnerDetails;
address[] public partners;


struct product{
    uint256 proId;
    bytes32 proName;
    bytes32[] proState;
    bytes32[] timeStamp;
    address[] partAddress;
}

mapping(uint256 => product) public productDetails;  
uint256[] public products;
  
constructor() public{
	manufacturerAddress = msg.sender;
}
modifier onlymanufacturer() {
  require(msg.sender == manufacturerAddress);
  _;

}
modifier onlyPartner(){
   require(msg.sender == partnersAddress);
   _; 
}

    function addManufacturer(address mfgaddress,bytes32 mfgName,bytes32 mfgLocation) public {
        mfgaddress=manufacturerAddress;
        manufacturerDetails[mfgaddress].mfgaddress = mfgaddress;
        manufacturerDetails[mfgaddress].mfgName = mfgName;
        manufacturerDetails[mfgaddress].mfgLocation = mfgLocation;
        manufacturers.push(mfgaddress);
    }
    
    function verifyManufacturer(address mfgaddress) view public returns(bytes32, bytes32){
        return(manufacturerDetails[mfgaddress].mfgName, manufacturerDetails[mfgaddress].mfgLocation);
    }
    
    function addPatner(address partnerAddress,bytes32 partnerName,bytes32 partnerLocation,bytes32 role) public onlymanufacturer() {
        partnerAddress=partnersAddress;
        partnerDetails[partnerAddress].partnerAddress = partnerAddress;
        partnerDetails[partnerAddress].partnerName = partnerName;
        partnerDetails[partnerAddress].partnerLocation = partnerLocation;
        partnerDetails[partnerAddress].role = role;
        partners.push(partnerAddress);
        
        
    }
    
    function editPartner(address partnerAddress,bytes32 partnerName,bytes32 partnerLocation,bytes32 role)  public onlymanufacturer() {
	
        partnerDetails[partnerAddress].partnerName = partnerName;
        partnerDetails[partnerAddress].partnerLocation = partnerLocation;
        partnerDetails[partnerAddress].role = role;
    }
    
    function verifyPartner(address _partnerAddress) view public returns(bytes32, bytes32,bytes32){
        return(partnerDetails[_partnerAddress].partnerName, partnerDetails[_partnerAddress].partnerLocation, partnerDetails[_partnerAddress].role);
    }
    
    function addProduct(uint256 proId,address[] memory partAddress,bytes32 proName,bytes32[] memory proState,bytes32[] memory timeStamp)  public onlymanufacturer(){
        
        productDetails[proId].proName = proName;
        productDetails[proId].proState = proState;
        productDetails[proId].timeStamp = timeStamp;
        productDetails[proId].partAddress = partAddress;
        products.push(proId);
    }
    
    function updateProduct(uint256 proId,bytes32[] memory proState,bytes32[] memory timeStamp)  public onlyPartner() {
        
        productDetails[proId].proState = proState;
        productDetails[proId].timeStamp = timeStamp;     
    
    }
    
    function verifyProduct(uint256 proId) view public returns(bytes32,bytes32[] memory,bytes32[] memory,address[]memory){
        return(productDetails[proId].proName, productDetails[proId].proState, productDetails[proId].timeStamp,productDetails[proId].partAddress);
    }
 
}