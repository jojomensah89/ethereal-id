// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract EtherealId {
   struct User{
    string firstName;
    string lastName;
    string email;
    string homeAddress;
    string dateOfBirth;
    string education;
    string workHistory;
    string phoneNumber;
    string jobTitle;
    string x;
    string instagram;
    string youtube;
    string linkedin;
    string info;
    string[] skills;
    string imageURL;
    bool exist;
    uint256[]  appliedJobs;
    Visibility visibility
   }

   struct Visibility {
    bool education;
    bool workHistory;
    bool dateOfBirth;
    bool phoneNumber;
    bool homeAddress;
    bool dateOfBirthDate
}
 struct BasicInfo{
    string firstName;
    string dateOfBirth;
    string lastName;
    string username;
    string email;
    string phoneNumber;
    string homeAddress;
 }

 struct SocialInfo{
    string x;
    string instagram;
    string youtube;
    string linkedin;
 }
 struct ProfessinalInfo{
 string education;
    string workHistory;
    string jobTitle;
    string info
     string[] skills;
    string imageURL;
 }

mapping (string => User) private usernameToUser;
mapping (address => string) private addressToUsername
mapping(string => bool) private usernames;


modifier onlyUniqueUsername (string memory _username){
    require(!usernames[_username] "Username already exists");
    _;
}
modifier usernameExists (string memory _username){
    require(usernameToUser[_username].exist "Username does not exist");
    _;
}

function createUser(string memory _username,BasicInfo memory _basicInfo,ProfessinalInfo memory _professinalInfo,SocialInfo memory _socialInfo, Visibility memory _visibility) public onlyUniqueUsername(_username){

 User storage user = usernameToUser[_username];
 user.firstName = _basicInfo.firstName;
 user.lastName = _basicInfo.lastName;
 user.username = _username;
 user.email = _basicInfo.email;
 user.phoneNumber = _basicInfo.phoneNumber;
 user.homeAddress = _basicInfo.homeAddress;
 user.dateOfBirth = _basicInfo.dateOfBirth;
 user.education = _professinalInfo.education;
 user.workHistory = _professinalInfo.workHistory;
 user.jobTitle = _professinalInfo.jobTitle;
 user.info = _professinalInfo.info;
 user.skills = _professinalInfo.skills;
 user.imageURL = _professinalInfo.imageURL;
 user.exist = true;
 user.visibility = _visibility;
 usernames[_username] = true;
 addressToUsername[msg.sender] = _username;
 usernameToUser[_username] = user;

}

function editUser(string memory _username,BasicInfo memory _basicInfo,ProfessinalInfo memory _professinalInfo,SocialInfo memory _socialInfo, Visibility memory _visibility) public usernameExists(_username){
    
 User storage user = usernameToUser[_username];
 user.firstName = _basicInfo.firstName;
 user.lastName = _basicInfo.lastName;
 user.username = _username;
 user.email = _basicInfo.email;
 user.phoneNumber = _basicInfo.phoneNumber;
 user.homeAddress = _basicInfo.homeAddress;
 user.dateOfBirth = _basicInfo.dateOfBirth;
 user.education = _professinalInfo.education;
 user.workHistory = _professinalInfo.workHistory;
 user.jobTitle = _professinalInfo.jobTitle;
 user.info = _professinalInfo.info;
 user.skills = _professinalInfo.skills;
 user.imageURL = _professinalInfo.imageURL;
 user.exist = true;
 user.visibility = _visibility;
 usernames[_username] = true;
 addressToUsername[msg.sender] = _username;
 usernameToUser[_username] = user;
}

function getUserByUsername(string memory _username) public view usernameExists(_username) returns(BasicInfo memory basicInfo,ProfessinalInfo memory professinalInfo,SocialInfo memory socialInfo, Visibility memory visibility){

 User storage user = usernameToUser[_username];

 basicInfo = BasicInfo(user.firstName,user.lastName,user.email,user.phoneNumber,user.homeAddress,user.dateOfBirth);
 professinalInfo = ProgramminalInfo(user.education,user.workHistory,user.jobTitle,user.info,user.skills,user.imageURL);
 socialInfo = SocialInfo(user.x,user.instagram,user.youtube,user.linkedin);
 visibility = user.visibility;
return (basicInfo, professionalInfo, socialInfo, visibility);


}

function  getUserByAddress(address  _userAdress) public view  returns(BasicInfo memory basicInfo,ProfessinalInfo memory professinalInfo,SocialInfo memory socialInfo, Visibility memory visibility){
    string memory username = addressToUsername[_userAdress];
    return getUserByUsername(username);
}

function getUsernameByAddress(address _userAdress) public view returns(string memory){
    return addressToUsername[_userAdress];

}

  function setVisibility(
        string memory _username, 
        bool _education,
        bool _workHistory,
        bool _phoneNumber,
        bool _homeAddress,
        bool _dateOfBirth
    ) public  usernameExists(_username){
        User storage user = usernameToUser[username];
        user.visibility.education = education;
        user.visibility.workHistory = workHistory;
        user.visibility.phoneNumber = phoneNumber;
        user.visibility.homeAddress = homeAddress;
        user.visibility.dateOfBirth = dateOfBirth;
    }

    function getVisibility(string memory _username) public view usernameExists(_username) returns (Visibility memory) {
      
        return usernameToUser[_username].visibility;
    }
























}