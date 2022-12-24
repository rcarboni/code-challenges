// https://leetcode.com/coin-change
// author: rodolfo_carboni
// run with: ./run.sh coin-change.cpp

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    int coinChange(vector<int>& coins, int amount) {
        
    }
};

int main(){
    vector<int> coins = {1,2,5};
    int amount = 11;
    Solution mySolution;
    cout << mySolution.coinChange(coins, amount) << " coins" << endl;
    return 0;
}
// amount 15
// 7 5 3 2
// Greedy 7 + 7 - ?
// 7 5 3

add one of this coins?
if amount % coins[i] == 0