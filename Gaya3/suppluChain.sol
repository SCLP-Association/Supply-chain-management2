pragma solidity 0.5.17;
contract SupplyChain{
address public owner;
uint256 public proId;
constructor() public{
	owner = msg.sender;
	proId = 1000;
}
modifier onlyOwner() {
  require(msg.sender == owner);
  _;
}
modifier onlyManufacturer(){
    for(uint i=0;i<manufacturers.length;i++){
        require(manufacturers[i] == msg.sender);
        _;
    }
}

modifier onlyPartner(){
    for(uint i=0;i<partners.length;i++){
        require(partners[i] == msg.sender);
        _;
    }
}
struct manufacturer{
    address mfgaddress;
    bytes32 mfgName;
    bytes32 mfgLocation;
}
mapping(address=>manufacturer) manufacturerDetails;
address[] manufacturers;
struct partner{
    address partnerAddress;
    bytes32 partnerName;
    bytes32 partnerLocation;
    bytes32 role;
}
mapping(address => partner) public partnerDetails;
address[]  partners;
struct product{
    bytes32 proName;
    bytes32[] proState;
    bytes32[] timeStamp;
    address[] partAddress;
}
mapping(uint256 => product) public productDetails;
uint256[] public products;

    function addManufacturer(address mfgaddress,bytes32 mfgName,bytes32 mfgLocation) public onlyOwner(){
        manufacturerDetails[mfgaddress].mfgaddress = mfgaddress;
        manufacturerDetails[mfgaddress].mfgName = mfgName;
        manufacturerDetails[mfgaddress].mfgLocation = mfgLocation;
        manufacturers.push(mfgaddress);
    }
    function verifyManufacturer(address mfgaddress) view public returns(address,bytes32, bytes32){
        return(manufacturerDetails[mfgaddress].mfgaddress,manufacturerDetails[mfgaddress].mfgName, manufacturerDetails[mfgaddress].mfgLocation);
    }

    function addPatner(address partnerAddress,bytes32 partnerName,bytes32 partnerLocation,bytes32 role) public onlyManufacturer() {
        partnerDetails[partnerAddress].partnerAddress = partnerAddress;
        partnerDetails[partnerAddress].partnerName = partnerName;
        partnerDetails[partnerAddress].partnerLocation = partnerLocation;
        partnerDetails[partnerAddress].role = role;
        partners.push(partnerAddress); 
    }
    function editPartner(address _partnerAddress,bytes32 partnerName,bytes32 partnerLocation,bytes32 role)  public onlyManufacturer() {
         for(uint i=0;i<partners.length;i++){
            if(partners[i] == _partnerAddress){
             partnerDetails[_partnerAddress].partnerName = partnerName;
             partnerDetails[_partnerAddress].partnerLocation = partnerLocation;
             partnerDetails[_partnerAddress].role = role;
            }
        }
    }
    function verifyPartner(address _partnerAddress) view public returns(bytes32, bytes32,bytes32){
        return(partnerDetails[_partnerAddress].partnerName, partnerDetails[_partnerAddress].partnerLocation, partnerDetails[_partnerAddress].role);
    }
    function addProduct(address[] memory partAddress,bytes32 proName,bytes32[] memory proState,bytes32[] memory timeStamp)  public onlyManufacturer(){
        productDetails[proId].proName = proName;
        productDetails[proId].proState = proState;
        productDetails[proId].timeStamp = timeStamp;
        productDetails[proId].partAddress = partAddress;
        products.push(proId);
        proId ++;    
    }
    function updateProduct(uint256 _proId,address[] memory partAddress,bytes32[] memory proState,bytes32[] memory timeStamp)  public  onlyPartner() {
        for(uint i=0;i<products.length;i++){
            if(products[i] == _proId){
                productDetails[_proId].partAddress = partAddress;
                productDetails[_proId].proState = proState;
                productDetails[_proId].timeStamp = timeStamp;     
            }
        }
    }
    function verifyProduct(uint256 _proId) view public returns(bytes32,bytes32[] memory,bytes32[] memory,address[]memory){
        for(uint i=0;i<products.length;i++){
            if(products[i] == _proId){
                return(productDetails[_proId].proName, productDetails[_proId].proState, productDetails[_proId].timeStamp,productDetails[_proId].partAddress);
            }
        }
    }
}