// https://leetcode.com/problems/course-schedule
// author: rodolfo_carboni
// run with: ./run.sh course-schedule.cpp

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    bool canFinish(int numCourses, vector<vector<int>>& prerequisites) {
        // build adjacency list
        vector<vector<int>> adj(numCourses);
        for(vector<int> a : prerequisites){
            adj[a[0]].push_back(a[1]);
        }

        // track courses that you visited and courses that you already validated
        vector<bool> visited(numCourses, false);
        vector<bool> done(numCourses, false);
        // check each course
        for(int i = 0; i < numCourses; i++){
            cout << "Starting Course: " << i << endl;
            // stop as soon as you find a loop
            if(found_loop(i, adj, visited, done)) return false;
        }
        // if didn't find any loops
        return true;
    }

private:
    bool found_loop(int course, vector<vector<int>> &adj, vector<bool> &visited, vector<bool> &done){
        // skip if you already validated this course
        if(done[course]) return false;
        // if you already saw it in the current validation (found a loop)
        if(visited[course]) return true;
        visited[course] = true;
        // check that you can take all the dependency courses
        for(int dependency : adj[course]){
            cout << "    Course: " << course << " Dependency: " << dependency << endl;
            if(found_loop(dependency, adj, visited, done)) return true;
        }
        // no loops found (mark this course as validated so you can skip it later)
        done[course] = true;
        return false;
    }
};

int main(){
    vector< vector<int> > input_prerequisites = {{0,2}, {1,0}, {1,2}, {2,3}};
    int input_numCourses = 4;
    
    Solution mySolution;
    if(mySolution.canFinish(input_numCourses, input_prerequisites)){
        cout << "Can Finish" << endl;
    } else {
        cout << "Can't Finish" << endl;
    }
    return 0;
}

// scenarios
// 0: 2
// 0 - 2

// 1: 0, 2
// 1 - 0 - 2
// 1 - 2
