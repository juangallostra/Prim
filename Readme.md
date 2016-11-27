
The code presented here shows three different implementations of Prim's algorithm:

1. Iterative
2. Recursive
3. With a min heap

For the code to work all the files should be located in the same folder, although here they are in different folders for clarification.

Furthermore, the implementations presented here assume that:
- The graph is presented in matricial form M, where M(i,j) = M(j,i) is the cost of the edge that goes from i to j or viceversa.
- The graph is undirected.

There are plenty of graphs presented as matrices at the UF Sparse Matrix Collection (http://www.cise.ufl.edu/research/sparse/matrices/groups.html)
that can be used to test the three different implementations.

Last but not least, the heap implementation consists of an array of structs where each element or struct contains 3 fields:

1. The node 'v' of the graph it represents
2. The minimum edge cost 'c' from node 'v' to a node that is already in the minimum spanning tree.
3. The edge 'e' that contains the two connected nodes (one of them is 'v') by the minimum edge cost.
