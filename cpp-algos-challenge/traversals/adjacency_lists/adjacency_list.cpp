#include <iostream>
#include <vector>
#include <unordered_set>
using namespace std;


bool shared_neighbour(vector< vector<int> > &adj, int u, int v)
{
    unordered_set<int> u_adj;
    for (int w: adj[u])
        u_adj.insert(w);
    for (int w: adj[v])
        if (u_adj.count(w) > 0)
            return true;
    return false;
}

int main(){
    // vector< vector<int> > adj(3, vector<int>(3,9)) // Initialize with 9
    vector< vector<int> > adj(3); 

    adj[0].push_back(1);
    adj[1].push_back(0);
    adj[2].push_back(1);
    adj[1].push_back(2);

    cout << adj[0][0] << endl;
    cout << adj[1][0] << endl;
    cout << adj[2][0] << endl;
    cout << adj[1][1] << endl;
    
    
    if(shared_neighbour(adj, 0, 2)){
        cout << "Found" << endl;
    } else {
        cout << "Not Found" << endl;
    }
    return 0;
}