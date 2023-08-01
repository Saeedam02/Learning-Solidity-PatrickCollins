// SPDX-License-Identifier:MIT
pragma solidity 0.8.18;


contract SimpleStorage{
    //favoritenumber gets initialized
    uint256 favoriteNumber; // initialized to zero
    // this is a storage variable/state variable

// virtual keyword means that this func is overridable and we will override in the AddFiveStorage contract.
    function store(uint256 _favoriteNumber) public virtual {
        //this is a local variable
        favoriteNumber = _favoriteNumber;
    }
    //public does something like a getter function which gets a value from variables
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
    // view function disallows updating state variables
    //pure function will get back a pure number like:
    // function retrieve() public pure returns(uint256) {
    // return 7; }
    //we don't need to spend gas for pure and view functions so because of that their color in the deploy part is blue
    //but if inside of other functions we call them it will cost gas


    //for storing others' favnum we can use an array or list
    //uint256 [] listoffav; //[0,7,12]
    //we can use a struct to create our own type of variable
    struct person{
    uint256 favnum;
    string nmae;
    }
    person public pat=person(7,"pat"); //person({favnum:7,name:"pat"})




    //the following array is a static array and it's up to index 3
    //person[3] public listofpersons;


    //the following array is a dynamic array
    person[] public listofpeople; //we are creating a list of our variable


    //let's create a function to update the dynamic array


    mapping(string=>uint256) public nametofavnum;

    function addperson(string memory _name, uint256 _favnum) public {
        // person memory newperson =person(_favnum,_name);
        // listofpeople.push(newperson);
        // note that data location can only be specified for array ,struct or mapping types.
                //second way is:
        listofpeople.push(person(_favnum,_name));
        nametofavnum[_name] = _favnum;
    }



}




    //For deploying our contract, we use a fake environment named Remix VM (Merge).this is a fake local blockchain
    //If we want to see the favoriteNumber we can use uint256 public favorite number
    //We have 4 visibility specifiers in solidity:
    // 1: public which is visible externally and internally and other contracts can call this variable and see its value
    // 2: private which is only visible in the current contract
    // 3: external which is only visible externally(only for functions)
    // 4: internal which is only visible internally
    // note that everything on evm chain is public data and setting a variable to private isn't a good way to hide
contract SimpleStorage1{}
contract SimpleStorage2{}
contract SimpleStorage3{}