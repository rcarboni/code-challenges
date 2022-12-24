// https://leetcode.com/longest-word-in-dictionary
// author: rodolfo_carboni
// run with: ./run.sh longest-word-in-dictionary.cpp

#include <iostream>
#include <vector>
#include <string>
#include <algorithm> // sort()

using namespace std;

class Solution {
public:
    string longestWord(vector<string>& words) {
        // sort alphabetically
        sort(words.begin(), words.end());
        string answer = "";
    
        for(size_t i = 0, num_w = words.size(); i < num_w; i++){
            // only one-character words
            if(words[i].length() != 1) continue;
            cout << "For " << words[i] << endl;
            // iterate downstream words
            for(size_t d = i; d < num_w - 1; d++){
                //cout << "d is " << d << endl;
                cout << "    Trying: " << words[d+1] << endl;
                // stop if next word is not one character longer or doesn't include current word
                if(words[d].length() + 1 != words[d+1].length() || words[d] != words[d+1].substr(0, words[d].length())){
                    cout << "  last word: " << words[d] << endl;
                    if(words[d].length() > answer.length()) answer = words[d];
                    break;
                }
            }
        }
        return answer;
    }
};

int main(){
    vector<string> words = {"w","wo", "wor","worl","world"};
    Solution mySolution;
    cout << mySolution.longestWord(words) << " is the Longest word possible" << endl; 
    return 0;
}