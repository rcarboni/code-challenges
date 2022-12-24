// https://leetcode.com/problems/boats-to-save-people
// author: rodolfo_carboni
// run with: ./run.sh boats-to-save-people.cpp  

#include <iostream>
#include <vector>
#include <algorithm> // sort()
#include <functional> // greater<int>()

using namespace std;

class Solution {
public:
    int numRescueBoats(vector<int>& people, int limit) {
        int numboats = 0;
        int max = 0, min = people.size() - 1;

        // Greedy: sort descending
        sort(people.begin(), people.end(), greater<int>());
        // GTE in case there's one unpaired left in the end
        while(max <= min){
            if(people[max] + people[min] <= limit){
                // both people fit
                max++;
                min--;
            } else {
                // only take heavier one
                max++;
            }
            numboats++;
        }
        return numboats;
    }
};

int main(){
    vector<int> people = {5,1,7,4,2,4};
    short int limit = 7;
    
    Solution mySolution;
    cout << mySolution.numRescueBoats(people, limit) << " boats needed" << endl;
    return 1;
};

// 7,5,4,4,2,1