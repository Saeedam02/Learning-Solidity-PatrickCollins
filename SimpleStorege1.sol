// SPDX-License-Identifier:MIT  
pragma solidity 0.8.18;

contract SimpleStorage{
    //favoritenumber gets initialized 
     uint256 favoriteNumber; // initialized to zero
    // this is a storage variable/state variable

     function store(uint256 _favoriteNumber) public {
        //this is a local variables
        favoriteNumber = _favoriteNumber;
     }
 //public do something like getter function which gets a value from variables
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }    
// view function disallow updating state variables
//pure function will get back a pure bumber like:
//  function retrieve() public pure returns(uint256) {
//       return 7; }
//we don't need to spend gas for pure and view functions so because of that their color in deploy part are blue 
//but if inside of other functions we call them it will cost gas

    //for storing others favnum we can use array or list 
    //uint256 [] listoffav; //[0,7,12]
    //we can use struct to create our own type of variable
    struct person{
        uint256 favnum;
        string nmae;
    }
    person public pat=person(7,"pat"); //person({favnum:7,name:"pat"})


    //the following arry is a static array and it's up to index 3
    //person[3] public listofpersons; 

    //the following arry is a dynamic array
    person[] public listofpeople; //we are creating a list of our variable

    //lets create a function to update the dynamic array

    function addperson(string memory _name, uint256 _favnum) public {
        // person memory newperson =person(_favnum,_name);
        // listofpeople.push(newperson);

        //second way is:
        listofpeople.push(person(_favnum,_name));
    }

}


// for deploying our contract, we use a fake environment named Remix VM (Merge).this is a fake local blockahain 
// if we wnat to see the favoriteNumber we can use uint256 public favoriteNumber
// we have 4 visibility specifiers in solidity:
// 1: public which is visible externally and internally and other contracts can call this variable and see its value
// 2: private which is only visible in the current contract 
// 3: external which is only visible externaly(only foerr functions)
// 4: internal which is only visible internally
// note that everythings on evm chain is public data and setting a variable to privete isn't a good way to hide 
