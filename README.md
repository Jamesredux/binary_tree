Project 1: Searching Binary Trees
You learned about binary search trees -- where you take a group of data items and turn them into a tree full of nodes where each left node is "lower" than each right node. The tree starts with the "root node" and any node with no children is called a "leaf node".

You also learned about tree search algorithms like breadth-first-search and depth-first-search. You learned that BFS is best used to find the optimum solution but can take a very long time (impractically long for broad and deep data sets) while DFS is often much faster but will give you the FIRST solution, not necessarily the best. Here you'll get a chance to implement both.

Your Task
You'll build a simple binary tree data structure from some arbitrary input and also the "crawler" function that will locate data inside of it.

1. Build a class Node. It should have a value that it stores and also links to its parent and children (if they exist). Build getters and setters for it (e.g. parent node, child node(s)).
2. Write a method build_tree which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of Node objects appropriately placed. Start by assuming the array you get is sorted.
3. Now refactor your build_tree to handle data that isn't presorted and cannot be easily sorted prior to building the tree. You'll need to figure out how to add a node for each of the possible cases (e.g. if it's a leaf versus in the middle somewhere).
4. Write a simple script that runs build_tree so you can test it out.
5. Build a method breadth_first_search which takes a target value and returns the node at which it is located using the breadth first search technique. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to search and to add new ones to the list (as you saw in the video). If the target node value is not located, return nil.
6. Build a method depth_first_search which returns the node at which the target value is located using the depth first search technique. Use an array acting as a stack to do this.
7. Next, build a new method dfs_rec which runs a depth first search as before but this time, instead of using a stack, make this method recursive.