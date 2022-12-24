// https://leetcode.com/problems/course-schedule
// author: rodolfo_carboni
// run with: ./run.sh course-schedule.cpp

#include <iostream>
#include <vector>
#include <algorithm>
#include <functional> 

using namespace std;

class Solution {
public:
    int numRescueBoats(vector<int>& people, int limit) {
        int numboats = 0, numpeople = people.size();
        vector<bool> saved(numpeople, false);
        
        // Greedy: sort descending
        sort(people.begin(), people.end(), greater<int>());
        for(size_t i = 0; i < numpeople; i++){
            if(saved[i]) continue;
            cout << "Looking for " << people[i] << endl;
            if(people[i] == limit || i == numpeople - 1){
                cout << "Save: " << people[i] << endl;
                numboats++;
                continue;
            }
            for(size_t partner = i + 1; partner < numpeople; partner++){
                cout << "    Partner " << people[partner] << endl;
                if(people[i] + people[partner] <= limit && !saved[partner]){
                    cout << "Save: " << people[i] << " and " << people[partner] << endl;
                    saved[partner] = true;
                    numboats++;
                    break;
                }
                if(partner == numpeople - 1){
                    cout << "No partners found, saving " << people[i] << endl;
                    numboats++;
                }
            }
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