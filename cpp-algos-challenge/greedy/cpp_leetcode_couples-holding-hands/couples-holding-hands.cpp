// https://leetcode.com/couples-holding-hands
// author: rodolfo_carboni
// run with: ./run.sh couples-holding-hands.cpp

#include <iostream>
#include <vector>
#include <map>
using namespace std;

class Solution {
public:
    int minSwapsCouples(vector<int>& row){
        int numswaps = 0;

        // build dict of couples
        map<int,int> mycouple;
        for(size_t i = 0; i < row.size(); i++){
            if(i % 2 == 0){
                mycouple[i] = i + 1;
            } else {
                mycouple[i] = i - 1;
            }
        }

        // loop over array
        vector<bool> done(row.size(), false);
        for(size_t i = 0; i < row.size(); i++){
            if(done[i]) continue;
            // next one is mycouple
            if(row[i+1] == mycouple[row[i]]){
                cout << row[i] << " already next to " << row[i+1] << endl;
                done[i] = true;
                done[i+1] = true;
                i++;
            } else {
                // search and swap couple
                for(size_t j = i + 1; j < row.size(); j++){
                    // found couple
                    if(row[j] == mycouple[row[i]]){
                        cout << "Swap " << row[i+1] << " with " << row[j] << endl;
                        row[j] = row[i+1];
                        row[i+1] = mycouple[row[i]];
                        done[i] = true;
                        done[i+1] = true;
                        numswaps++;
                        i++;
                        break;
                    }
                }
            }
        }
        return numswaps;
    }
};

int main(){
    vector<int> row = {0,3,4,5,6,1,2,7};
    Solution mySolution;
    cout << mySolution.minSwapsCouples(row) << " Swaps" << endl;
}

// 0   1
// 1   0
// 2   3
// 3   2