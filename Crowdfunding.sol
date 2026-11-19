// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {

    address public owner;
    uint public goal;
    uint public deadline;
    uint public totalFunds;

    mapping(address => uint) public contributions;

    event Contributed(address indexed contributor, uint amount);
    event Withdrawn(uint amount);
    event Refunded(address indexed contributor, uint amount);

    constructor(uint _goalInEther, uint _durationInDays) {
        owner = msg.sender;
        goal = _goalInEther * 1 ether;
        deadline = block.timestamp + (_durationInDays * 1 days);
    }

    function contribute() external payable {
        require(block.timestamp < deadline, "Campaign ended");
        require(msg.value > 0, "Send some Ether");

        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;

        emit Contributed(msg.sender, msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        require(totalFunds >= goal, "Goal not reached");

        uint amount = address(this).balance;
        totalFunds = 0;

        payable(owner).transfer(amount);

        emit Withdrawn(amount);
    }

    function refund() external {
        require(block.timestamp >= deadline, "Campaign active");
        require(totalFunds < goal, "Goal reached");

        uint amount = contributions[msg.sender];
        require(amount > 0, "No contribution");

        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit Refunded(msg.sender, amount);
    }
}