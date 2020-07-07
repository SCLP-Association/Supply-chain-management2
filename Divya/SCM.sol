pragma solidity 0.5.17;

/*iPhone7 Supply Chain */

contract SCM {
    address public manufacturerAddress; /* manufacturer update the partner details*/
    address public PartnerAddress; //partner updates the product details and status
    uint256 public proId;
    /* restricting the users or partners to edit or add the details.Only manufacturerAddress can add or edit*/

    constructor(address) public {
        manufacturerAddress = msg.sender;
        proId = 34567;
    }

    /*if msg.sender is equals to owner(manufacturer) then able to push the data, if not the below error will pop */
    modifier onlymanufacturer() {
        require(
            msg.sender == manufacturerAddress,
            "you can't update or edit the details"
        );
        _;
    }
    /*if msg.sender is equals to PartnerAddress then able to push the data, if not the below error will pop */
    modifier onlypartner() {
        require(
            PartnerAddress == msg.sender,
            "Only Partner can add or update the part details"
        );
        _;
    }

    struct manufacturer {
        bytes32 mfgName;
        bytes32 mfgLocation;
        address mfgAddress; /* mfgAddress means eth address */
    }
    mapping(address => manufacturer) public mfgAddress;
    address[] public mfgDetails;

    struct partner {
        bytes32 partnerName;
        bytes32 partnerLocation;
        address partnerAddress;
        bytes32 role;
    }
    mapping(address => partner) public partnerAddress;
    address[] public partnerDetails;

    struct product {
        
        bytes32 proName;
        bytes32[] proState;
        bytes32[] timeStamp;
        address[] partAddress;
    }
    mapping(uint256 => product) public proId;
    uint256[] public proDetails;

    /* Adding the manufacturerdetails by Owner */

    function addManufacturer(bytes32 _mfgName,bytes32 _mfgLocation,address _mfgAddress) public onlymanufacturer {
        mfgAddress[_mfgAddress].mfgName = _mfgName;
        mfgAddress[_mfgAddress].mfgLocation = _mfgLocation;
        mfgAddress[_mfgAddress].mfgAddress = _mfgAddress;

        mfgDetails.push(_mfgAddress);
    }
    function veryManufacturer(address _mfgAddress) view public returns(bytes32 _mfgName,bytes32 _mfgLocation){
        return (mfgAddress[_mfgAddress].mfgName,mfgAddress[_mfgAddress].mfgLocation);
    }

    /*Adding multiple partner details by manufacturer*/

    function addPartner(bytes32 _partnerName,bytes32 _partnerLocation,address _partnerAddress,bytes32 _role) public onlymanufacturer {
        partnerAddress[_partnerAddress].partnerName = _partnerName;
        partnerAddress[_partnerAddress].partnerLocation = _partnerLocation;
        partnerAddress[_partnerAddress].partnerAddress = PartnerAddress;
        partnerAddress[_partnerAddress].role = _role;

        partnerDetails.push(_partnerAddress);
    }
    function veryPartner(address _partnerAddress) view public returns(bytes32 _partnerName,bytes32 _partnerLocation,bytes32 _role){
        return (partnerAddress[_partnerAddress].partnerName,partnerAddress[_partnerAddress].partnerLocation,partnerAddress[_partnerAddress].role);
    }
    
    /*Editing multiple partner details by manufacturer*/

    function updatePartnerDetails(
        bytes32 _partnerName,
        bytes32 _partnerLocation,
        address _partnerAddress,
        bytes32 _role
    ) public onlypartner {
        partnerAddress[_partnerAddress].partnerName = _partnerName;
        partnerAddress[_partnerAddress].partnerLocation = _partnerLocation;
        partnerAddress[_partnerAddress].partnerAddress = _partnerAddress;
        partnerAddress[_partnerAddress].role = _role;

    }

    /*Partner details will be displaied based on partnerAddressAddress*/

    function getAllPartnerDetails() public view returns (address[] memory) {
        return partnerDetails;
    }

    /*Adding the products*/

    /*Adding products screen ,battery,motherboard details by manufacturer or partner*/

    function addProduct(
        uint256 _proId,
        bytes32 _proName,
        bytes32[] memory _proState,
        bytes32[] memory _timeStamp,
        address[] memory _partAddress
    ) public {
        require(
            msg.sender == PartnerAddress || msg.sender == manufacturerAddress
        ); /*Only partner and manufacturer are allowed to add the details*/
        proId[_proId].proId = _proId;
        proId[_proId].proName = _proName;
        proId[_proId].proState = _proState;
        proId[_proId].timeStamp = _timeStamp;
        proId[_proId].partAddress = _partAddress;
        proDetails.push(_proId);
    }

    function updateProduct(
        uint256 _proId,
        bytes32[] memory _proState,
        bytes32[] memory _timeStamp
    ) public onlypartner {
        require(
            msg.sender == PartnerAddress || msg.sender == manufacturerAddress
        ); /*Only partner or manufacturer are allowed to make the changes.*/
        proId[_proId].proState = _proState;
        proId[_proId].timeStamp = _timeStamp;

     }

    /*Product details will be displaied based on proId*/

    function getAllProductDetails() public view returns (uint256[] memory) {
        return proDetails;
    }
}