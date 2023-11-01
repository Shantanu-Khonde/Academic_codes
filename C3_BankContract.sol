// SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract Bank
{
    struct Customer
    {
        uint id;
        uint balance;
    }
    Customer[5] c;
    constructor()
    {
        for(uint i = 0; i < 5; i++)
        {
            c[i].id = i+1;
            c[i].balance = 1000;
        }
    }
    function showBalance(uint cid) public view returns(uint)
    {
        if(cid > 5)
            revert('Invalid Customer ID');
        else
        {
            for(uint i =0;i<5;i++)
            {
                if(c[i].id == cid)
                {
                    return c[i].balance;
                }
            }
            revert('Customer ID not found');
        }
    }
    function withdraw(uint cid, uint amt) public
    {
        if(cid > 5)
            revert('Invalid Customer ID');
        else
        {
            for(uint i =0;i<5;i++)
            {
                if(c[i].id == cid)
                {
                    if(amt < c[i].balance)
                    {
                        c[i].balance = c[i].balance - amt;
                    }
                    else
                        revert('Insufficient Balance');
                }
            }
        }
    }
    function deposit(uint cid,uint amt) public
    {
        if(cid > 5)
            revert('Invalid Customer ID');
        else
        {
            for(uint i =0;i<5;i++)
            {
                if(c[i].id == cid)
                {
                    c[i].balance = c[i].balance + amt;
                }
            }
        }
    }

}