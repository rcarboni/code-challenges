    // https://leetcode.com/problems/path-sum/
    /**
     * Definition for a binary tree node.
     * struct TreeNode {
     *     int val;
     *     TreeNode *left;
     *     TreeNode *right;
     *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
     *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
     *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
     * };
     */
    class Solution {
    public:
        bool hasPathSum(TreeNode* root, int targetSum) {
            // if called on a le
            if(nullptr == root){
                return false;
            }
            // subtract the value of the current root
            // (this is the new target for the remaining path to a leaf)
            targetSum -= root->val;
            if(nullptr == root->left && nullptr == root->right && targetSum == 0){
                // you are at a leaf and the traversed path sums to the target value
                return true;
            } else {
                // try to hit the new targetSum either on the left OR the right
                return hasPathSum(root->left, targetSum) || hasPathSum(root->right, targetSum);
            }
        }
    };