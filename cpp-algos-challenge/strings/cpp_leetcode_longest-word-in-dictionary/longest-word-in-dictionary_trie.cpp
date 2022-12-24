// https://leetcode.com/longest-word-in-dictionary
// author: rodolfo_carboni
// run with: ./run.sh longest-word-in-dictionary.cpp

#include <iostream>
#include <vector>
#include <string>

using namespace std;

class Solution {
private:
    struct TrieNode {
        bool isWord;
        vector<TrieNode*> children;
        TrieNode() {
            isWord = false;
            children = vector<TrieNode*>(26, nullptr);
        }

        void insert(string& word){
            TrieNode* curNode = this;
            for(auto c : word){
                if(!curNode->children[c - 'a']){
                    curNode->children[c - 'a'] = new TrieNode();
                }
                curNode = curNode->children[c - 'a']
            }
        }
    }
    TrieNode* root = new TrieNode();
    
public:
    string longestWord(vector<string>& words) {
        return "alla";
    }
};

int main(){
    vector<string> words = {"w","wo","wor","worl","world"};
    Solution mySolution;
    cout << mySolution.longestWord(words) << " is the Longest word possible" << endl; 
    cout << "Aqui " << 'c' - 'a' << endl;
    
    string b = "hola";
    for(auto c : b){
        cout << c << endl;
    }
    return 0;
}