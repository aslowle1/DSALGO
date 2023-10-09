A set of values related in a pair-like relationship
Each Item is a node(vertex)
Connected by edges(links)
Use to represent real world relationships(like Facebook)

Linklist and trees are a type go graph

Directed vs Undirected Graph 
Undirected - you can go back and forth

Weighted and Unweighted Graph
Where the connections(edges have weight) i.e. traffic flow between two cities

Acyclic vs Cyclic 

To Build Graphs(Study this more)
Edge List - Shows Connections 
Adjacent List
Adjacent Matrix

*******************

A cyclic graph is a directed graph with at least one cycle. A cycle is a path along the directed edges from a vertex to itself. The vertex labeled graph above as several cycles

A weighted graph is an edge labeled graph where the labels can be operated on by the usual arithmetic operators, including comparisons like using less than and greater than. In Haskell we'd say the edge labels are i the Num class. Usually they are integers or floats. The idea is that some edges may be more (or less) expensive, and this cost is represented by the edge labels or weight.

Vertices in a graph do not need to be connected to other vertices. It is legal for a graph to have disconnected components, and even lone vertices without a single connection.


Graphs as adjacency information.
Most programs need to compute all the vertices adjacent to a given vertex. This corresponds to finding a 1-step path in the graph. In fact, for many programs this is the only operation needed, so data structures that support this operation quickly and efficiently are often used. Possible choices include arrays, balanced trees, hash tables,

One useful abstraction is to think of the adjecency information as a function. Under this abstraction a graph is nothing more than a function.
  type Graph vertex = vertex -> [vertex]


When dealing with garbage collection schemes, it is often helpful to think of the reference graph, which is a directed graph where the vertices are objects and there is an edge from an object A to an object B if A holds a reference to B. We also have a special vertex or vertices representing the local variables and references held by the runtime system, and no edges ever go to these nodes, although edges can go from them to other nodes.
In this context, the simple reference count of an object is the in-degree of its vertex. Deleting a vertex is like collecting an object. It can only be done when the vertex has no incoming edges, so it does not affect the out-degree of any other vertices, but it can affect the in-degree of other vertices, causing their corresponding objects to be collected as well if their in-degree also becomes 0 as a result.
The connected component containing the special vertex contains the objects that can't be collected, while other connected components of the graph only contain garbage. If a reference-counting garbage collection algorithm is implemented, then each of these garbage components must contain at least one cycle; otherwise, they would have been collected as soon as their reference count (i.e., the number of incoming edges) dropped to zero.

Perhaps the most obvious way to handle reference cycles is to design the system to avoid creating them. A system may explicitly forbid reference cycles; file systems with hard links often do this. Judicious use of "weak" (non-counted) references may also help avoid retain cycles; the Cocoa framework, for instance, recommends using "strong" references for parent-to-child relationships and "weak" references for child-to-parent relationships.[9]
Systems may also be designed to tolerate or correct the cycles they create in some way. Developers may design code to explicitly "tear down" the references in a data structure when it is no longer needed, though this has the cost of requiring them to manually track that data structure's lifetime. This technique can be automated by creating an "owner" object that does the tearing-down when it is destroyed; for instance, a Graph object's destructor could delete the edges of its GraphNodes, breaking the reference cycles in the graph. Cycles may even be ignored in systems with short lives and a small amount of cyclic garbage, particularly when the system was developed using a methodology of avoiding cyclic data structures wherever possible, typically at the expense of efficiency.

Social networks are a great example of undirected graphs. Once a request is accepted, both parties (e.g. the sender and recipient) share a mutual connection.
A service like Google Maps is a great example of a directed graph. Unlike an undirected graph, directed graphs only support a one-way connection between source vertices and their destinations. 

You should make your own Graph and index objects

Graph problems that can be solved using the BFS algorithm:
• Finding a path from a vertex to another
• Finding the minimum path from a vertex to another
• Finding all the paths from a vertex to another
Finding a minimum spanning tree of an unweighted graph

Graph problems that can be solved using the DFS algorithm:
• Proving that a graph is connected
• Finding if there are existing paths within the graph
Checking if a graph is bipartite (A graph is bipartite when the vertices can be divided into 2 independent sets and all the edges from one of the set connect to the other. Or we can also say a bipartite graph will not contain any odd length cycles.)

Two main data structures for the representation of graphs are used in practice. The first is called an adjacency list, and is implemented as an array with one linked list for each source node, containing the destination nodes of the edges that leave each node. The second is a two-dimensional boolean adjacency matrix, in which the rows and columns are the source and destination vertices, and entries in the array indicate whether an edge exists between the vertices. Adjacency lists are preferred for sparse graphs; otherwise, an adjacency matrix is a good choice.

For instance, social networks like LinkedIN show our connections or search results sorted by degree of separation, and trip planning sites show how many flights you have to take to reach your destination, usually listing direct connections first.

A similar but slightly different requirement is to find those nodes that are most strongly related, but not directly connected yet. In other words, it's interesting to find out which and how many connected nodes are shared between any two nodes, i.e. how many 'friends' are shared between two individuals. Or better yet, to find those nodes sharing a certain (minimum) number of nodes with the current one.
This could be useful to suggest a new possible friend, or in the case of recommendation systems, to suggest a new item/genre that matches the user's interests.

The main difference is the way relationships between entities are stored. In a graph database, relationships are stored at the individual record level, while a relational database uses predefined structures, a.k.a. table definitions.
Relational databases are faster when handling huge numbers of records because the structure of the data is known ahead of time. This also leads to a smaller memory footprint. Graph databases don’t have a predefined structure for the data which is why each record has to be examined individually during a query to determine the structure of the data.


**********

Nodes - the main entities in a graph. You can think of them as rows in a relational database.
Relationships - the connections between those entities. These would be foreign keys in a relational database.
Labels - attributes that group similar nodes together.
Properties - key/value pairs stored within nodes or relationships.
In a typical social network graph, the nodes represent people in different social groups and their connections with one another. Every person is represented with a node that’s labeled as Person. These nodes contain the properties name, gender, location and email. The relationships between people in this network are of the type FRIENDS_WITH and contain a yearsOfFriendship property to specify the duration of the friendship connection. Each person is assigned a location through :LIVES_IN relationships with nodes labeled Location.


****************

While this is a very simple example, it concisely demonstrates the power and benefits of using a graph database. For example, if you wanted to add different properties to some of the nodes, you would be able to. Unlike a table, where you need to add a column for each additional attribute, here you can be much more flexible with the data structure and types. A property that was meant to be a string can be used as an integer without any constraints. To be fair, this can cause problems for you in the long run, but you can do it if need be.

A good rule of thumb is, if you don’t intend to use JOIN operations in your queries, then a graph is not a must-have.

If your data model is inconsistent and demands frequent changes, then using a graph database might be the way to go. Because graph databases are more about the data itself than the schema structure, they allow a degree of flexibility.
On the other hand, there are often benefits in having a predefined and consistent table that’s easy to understand. Developers are comfortable and used to relational databases and that fact cannot be downplayed.
For example, if the sole purpose of your database is storing a user’s personal information and retrieving it by name or ID, then refrain from using a graph. But if there were other entities involved (visited locations for example), and a large number of connections is required to map them to users, then a graph database could bring performance benefits.

Graph solutions are focused on highly-connected data that comes with an intrinsic need for relationship analysis. If the connections within the data are not the primary focus and the data is of a transactional nature, then a graph database is probably not the best fit. Sometimes it’s just important to store the data and complex analysis isn’t needed.
Graph databases are purpose-built to store and navigate relationships. Relationships are first-class citizens in graph databases, and most of the value of graph databases is derived from these relationships. Graph databases use nodes to store data entities, and edges to store relationships between entities. An edge always has a start node, end node, type, and direction, and an edge can describe parent-child relationships, actions, ownership, and the like. There is no limit to the number and kind of relationships a node can have. 
A graph in a graph database can be traversed along specific edge types or across the entire graph. In graph databases, traversing the joins or relationships is very fast because the relationships between nodes are not calculated at query times but are persisted in the database. Graph databases have advantages for use cases such as social networking, recommendation engines, and fraud detection, when you need to create relationships between data and quickly query these relationships.
Data lookup performance is dependent on the access speed from one particular node to another. Because index-free adjacency enforces the nodes to have direct physical RAM addresses and physically point to other adjacent nodes, it results in a fast retrieval. A native graph system with index-free adjacency does not have to move through any other type of data structures to find links between the nodes. Directly related nodes in a graph are stored in the cache once one of the nodes are retrieved, making the data lookup even faster than the first time a user fetches a node.
Relational databases do not inherently contain the idea of fixed relationships between records. Instead, related data is linked to each other by storing one record's unique key in another record's data. For example, a table containing email addresses for users might hold a data item called userpk, which contains the primary key of the user record it is associated with. In order to link users and their email addresses, the system first looks up the selected user records primary keys, looks for those keys in the userpk column in the email table (or, more likely, an index of them), extracts the email data, and then links the user and email records to make composite records containing all the selected data. This operation, termed a join, can be computationally expensive. Depending on the complexity of the query, the number of joins, and indexing various keys, the system may have to search through multiple tables and indexes and then sort it all to match it together.[19]



For example, if the sole purpose of your database is storing a user’s personal information and retrieving it by name or ID, then refrain from using a graph. But if there were other entities involved (visited locations for example), and a large number of connections is required to map them to users, then a graph database could bring performance benefits.

<img width="831" alt="image" src="https://user-images.githubusercontent.com/22100946/227804435-bd14656a-7eba-41b1-81fe-08635fd5a658.png">


