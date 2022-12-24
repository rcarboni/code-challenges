// https://leetcode.com/problems/number-of-islands/
// author: rodolfo_carboni
// run with: ./run.sh number-of-islands.cpp

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    int numIslands(vector<vector<char>>& grid) {
        int num_islands = 0;
        for(long unsigned int i = 0; i < grid.size(); i++){
            for(long unsigned int j = 0; j < grid[0].size(); j++){
                if(grid[i][j] == '1'){
                    // cout << i << " " << j << endl;
                    num_islands++;
                    mark_all_neighbors(i, j, grid);
                }
            }
        }
        return num_islands;
    }

private:
    void mark_all_neighbors(long unsigned int i, long unsigned int j, vector< vector<char> >& grid){
        if(i >= 0 && j >= 0 && i < grid.size() && j < grid[i].size() && grid[i][j] == '1'){
            grid[i][j] = '0';
            mark_all_neighbors(i - 1, j, grid);
            mark_all_neighbors(i + 1, j, grid);
            mark_all_neighbors(i, j - 1, grid);
            mark_all_neighbors(i, j + 1, grid);
        }
    }
};

int main(){
    vector< vector<char> > input_grid(4, vector<char>(5));
    input_grid =  
    {
        {'1','1','1','1','0'}, 
        {'1','1','0','1','0'}, 
        {'1','1','0','0','1'}, 
        {'0','0','0','1','0'} 
    };

    Solution mySolution;
    cout << "Num Islands " << mySolution.numIslands(input_grid) << endl;
    return 0;
}

