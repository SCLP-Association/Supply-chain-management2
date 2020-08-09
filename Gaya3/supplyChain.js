var  contractAddress = "0x021c8b35f6a72ab88bf97b5e8011f5b2ee48a548";
var accounts;
abi = [
	{
		"inputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "mfgName",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "mfgLocation",
				"type": "bytes32"
			}
		],
		"name": "addManufacturer",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "address",
				"name": "partnerAddress",
				"type": "address"
			},
			{
				"internalType": "bytes32",
				"name": "partnerName",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "partnerLocation",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "role",
				"type": "bytes32"
			}
		],
		"name": "addPatner",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "address[]",
				"name": "partAddress",
				"type": "address[]"
			},
			{
				"internalType": "bytes32",
				"name": "proName",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32[]",
				"name": "proState",
				"type": "bytes32[]"
			},
			{
				"internalType": "bytes32[]",
				"name": "timeStamp",
				"type": "bytes32[]"
			}
		],
		"name": "addProduct",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "address",
				"name": "_partnerAddress",
				"type": "address"
			},
			{
				"internalType": "bytes32",
				"name": "partnerName",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "partnerLocation",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "role",
				"type": "bytes32"
			}
		],
		"name": "editPartner",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "partnerDetails",
		"outputs": [
			{
				"internalType": "address",
				"name": "partnerAddress",
				"type": "address"
			},
			{
				"internalType": "bytes32",
				"name": "partnerName",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "partnerLocation",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "role",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "proId",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "productDetails",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "proName",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "products",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_proId",
				"type": "uint256"
			},
			{
				"internalType": "address[]",
				"name": "partAddress",
				"type": "address[]"
			},
			{
				"internalType": "bytes32[]",
				"name": "proState",
				"type": "bytes32[]"
			},
			{
				"internalType": "bytes32[]",
				"name": "timeStamp",
				"type": "bytes32[]"
			}
		],
		"name": "updateProduct",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "verifyManufacturer",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			},
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "address",
				"name": "_partnerAddress",
				"type": "address"
			}
		],
		"name": "verifyPartner",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_proId",
				"type": "uint256"
			}
		],
		"name": "verifyProduct",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			},
			{
				"internalType": "bytes32[]",
				"name": "",
				"type": "bytes32[]"
			},
			{
				"internalType": "bytes32[]",
				"name": "",
				"type": "bytes32[]"
			},
			{
				"internalType": "address[]",
				"name": "",
				"type": "address[]"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	}
]

window.addEventListener('load',async()=>{

	if(window.ethereum){
		window.web3 = new Web3(ethereum);

		try{
			await ethereum.enable();

			if(typeof web3 !== "undefined"){
				web3 = new Web3(web3.currentProvider);
			}else{
				web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/v3/37adf31dd7164cd1995d21a8eb24c671"));
			}

			SupplyChain = await new web3.eth.Contract(abi,contractAddress);
			accounts = await web3.eth.getAccounts();
			console.log(accounts);
			web3.eth.defaultAccount = accounts[0];
			console.log(web3.eth.defaultAccount);
		}catch (error){
			console.log(error);
		}
		
	}else if(window.web3){
		window.web3 = new Web3(web3.currentProvider);
	}else{
		alert("Non-ethereum browser detected,Try using MetMask");
	}
	
});

async function addUser() {
	var userName = $('#userName').val();
	var location = $('#userLocation').val();
	var ethAddress = $('#userAddress').val();
	var role = $('#userRole').val();
	var userId=345678;
	var userData;
	console.log(userName,location,ethAddress,role);
	console.log("iam a issue function");
	if(role = 'assembler'){
		SupplyChain.methods
		.addManufacturer(ethAddress,web3.utils.fromAscii(userName),web3.utils.fromAscii(location))
		.send({from: web3.eth.defaultAccount})
		 .on('receipt',function(receipt){
			 console.log(receipt);
		 });
	
	userData=' <tr><td class="text-center text-muted">'+userId+'</td> <td> <div class="widget-content p-0"> <div class="widget-content-wrapper"> <div class="widget-content-left flex2"> <div class="widget-heading">'+userName+'</div> </div> </div> </div> </td> <td class="text-center">'+location+'</td> <td class="text-center">'+ethAddress+'</td> <td class="text-center"><div class="badge badge-warning" value="Pending">Pending</div></td><td class="text-center"><button type="button" data-toggle="modal" class="btn btn-primary btn-sm" data-target="#viewUpdateUser">View / Update</button></td></tr>'
	userId++;
	$('#userDetails').append(userData);
	}
	else{
		SupplyChain.methods
		.addPatner(ethAddress,web3.utils.fromAscii(userName),web3.utils.fromAscii(location),web3.utils.fromAscii(role))
		.send({from: web3.eth.defaultAccount})
		 .on('receipt',function(receipt){
			 console.log(receipt);
		 });
	
		userData=' <tr><td class="text-center text-muted">'+userId+'</td> <td> <div class="widget-content p-0"> <div class="widget-content-wrapper"> <div class="widget-content-left flex2"> <div class="widget-heading">'+userName+'</div> </div> </div> </div> </td> <td class="text-center">'+location+'</td> <td class="text-center">'+ethAddress+'</td> <td class="text-center"><div class="badge badge-warning" value="">Pending</div></td><td class="text-center"><button type="button" data-toggle="modal" class="btn btn-primary btn-sm" data-target="#viewUpdateUser">View / Update</button></td></tr>'
		userId++;
		$('#userDetails').append(userData);
	}
	
}
// async function addProduct() {
// 	var productName = $('#productName').val();
// 	var productState = $('#productState').val();
// 	var timeStamp = $('#timeStamp').val();
// 	var partnerAddress = $('#partnerAddress').val();
// 	var proId=1000;
// 	var productData;
// 	console.log(productName,productState,timeStamp,partnerAddress);
// 	console.log("iam a issue function");
// 		SupplyChain.methods
// 		.addProduct(web3.utils.fromAscii(productName),web3.utils.fromAscii(productState),web3.utils.fromAscii(timeStamp),partnerAddress)
// 		.send({from: web3.eth.defaultAccount})
// 		 .on('receipt',function(receipt){
// 			 console.log(receipt);
// 		 });
	
// 		 productData=' <tr><td class="text-center text-muted">'+proId+'</td> <td> <div class="widget-content p-0"> <div class="widget-content-wrapper"> <div class="widget-content-left flex2"> <div class="widget-heading">'+userName+'</div> </div> </div> </div> </td> <td class="text-center">'+location+'</td> <td class="text-center">'+ethAddress+'</td> <td class="text-center"><div class="badge badge-warning">Pending</div></td><td class="text-center"><button type="button" id="PopoverCustomT-1" class="btn btn-primary btn-sm">View / Update</button></td></tr>'
// 		 proId++;
// 	$('#userDetails').append(productData);
// }


