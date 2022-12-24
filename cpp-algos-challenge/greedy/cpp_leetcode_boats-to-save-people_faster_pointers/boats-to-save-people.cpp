// https://leetcode.com/problems/boats-to-save-people
// author: rodolfo_carboni
// run with: ./run.sh boats-to-save-people.cpp  

#include <iostream>
#include <vector>
#include <algorithm> // sort()

using namespace std;

class Solution {
public:
    int numRescueBoats(vector<int>& people, int limit) {
        int numboats = 0;
        sort(people.begin(), people.end());
        vector<int>::iterator min = people.begin();
        vector<int>::iterator max = people.end() - 1;
        
        // GTE in case there's one unpaired left in the end
        while(min <= max){
            if(*min + *max <= limit){
                // both people fit
                cout << *max << " and " << *min << endl;
                min++;
                max--;
            } else {
                // only take heavier one
                cout << *max << endl;
                max--;
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