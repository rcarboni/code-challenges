// https://leetcode.com/stream-of-characters
// author: rodolfo_carboni
// run with: ./run.sh stream-of-characters.cpp

#include <iostream>
#include <vector>
#include <map>
using namespace std;

class StreamChecker {
public:
    StreamChecker(vector<string>& words) {
        
    }
    
    bool query(char letter) {
        
    }
};

/**
 * Your StreamChecker object will be instantiated and called as such:
 * StreamChecker* obj = new StreamChecker(words);
 * bool param_1 = obj->query(letter);
 */

int main(){
    vector<int> row = {0,3,4,5,6,1,2,7};
    Solution mySolution;
    cout << mySolution.minSwapsCouples(row) << " Swaps" << endl;
}