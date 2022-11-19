Jungle Beat
Learning Goals
Practice breaking a program into logical components
Distinguishing between classes and instances of those classes
Understanding how linked lists work to store and find data
Testing components in isolation and in combination
Use and implement iteration or recursion techniques
Basics
In this project we’re going to do some silly things with sound. Specifically, we’re going to make a very basic drum machine program.

However to add some additional depth, let’s also use this project as a chance to explore one of the fundamental data structures in computer science – the Linked List.

Drum Machine 101 – Making Sounds
Go into your Terminal and try this:

$ say -r 500 "ding, dah, oom, oom, ding, oom, oom, oom, ding, dah, oom, oom, ding, dah, oom, oom, ding, dah, oom, oom "
Yeah. That’s what we’re looking for. Now try it from Ruby:

$ pry
> `say -r 500 "ding, dah, oom, oom"`
Note that the backticks allow you to run terminal commands from within Ruby.

The exact command that you need to run may differ based on what version of OS X you have installed on your computer. The commands above will work on 10.13.

Linked Lists
Linked Lists are one of the most fundamental Computer Science data structures. A Linked List models a collection of data as a series of “nodes” which link to one another in a chain.

In a singly-linked list (the type we will be building) you have a head, which is a node representing the “start” of the list, and subsequent nodes which make up the remainder of the list.

The list itself can hold a reference to one thing – the head node.

Each node can hold a single element of data and a link to the next node in the list.

The last node of the list is often called its tail.

Using sweet ASCII art, it might look like this:

List -- (head) --> ["hello" | -]-- (link) --> ["world" | -]-- (link) --> ["!" | ]
The three nodes here hold the data “hello”, “world”, and “!”. The first two nodes have links which point to other nodes. The last node, holding the data “!”, has no reference in the link spot. This signifies that it is the end of the list.

In other lower level languages, something called a pointer is what is used to ensure that a single link knows about the next link. In Ruby, we don’t use pointers, so the link is literally its node. When we get to a node which is the last node, we call it the tail, and its link is nil.

A linked list should be able to do the following:

Insert elements
Pop an element from the end
Push an element onto the beginning
Remove the (first occurance	all occurances) of an element by data content
Remove an element by position
Add an element at an arbitrary position
Add an element after a known node
Find whether a data element is or is not in the list
Find the distance between two nodes
Iterative Development
As we work through this project, we’ll be following an iterative development process. This means we’ll aim to build the system out of small but complete chunks which could reasonably stand on their own to perform some required function. The iterations are outlined below. It may be worth reading through them all at first to get a sense of the scope of the entire project, but we encourage you to then forget about later iterations until you get to them.

The point of this process is to help us focus on small pieces at a time without getting overwhelmed by the scope of the entire project.

Iteration 0 - Node Basics
Our Linked List will ultimately be composed of individual nodes, so in this iteration we’ll start with building out these nodes. Note that they are quite simple – a Node simply needs to have a slot for some data and a slot for a “next node”. Eventually this next_node position will be what we use to link the multiple nodes together to form the list.

For this iteration, build a simple node class that can perform these functions:

> require "./lib/node"
> node = Node.new("plop")
> node.data
=> "plop"
> node.next_node
=> nil

Iteration 1 - Append, To String, and Count (Single Node / Element)
Great! We have nodes. In this iteration we’ll create the LinkedList class and start filling in the basic functionality needed to append our first node.

We’ll be adding the following methods:

append - adds a new piece of data (data can really be anything) to the list
count - tells us how many things are in the list
to_string - generates a string of all the elements in the list, separated by spaces
But for now, focus on building these functions so they work for just the first element of data appended to the list (we’ll handle multiple elements in the next iteration).

Expected behavior:

> require "./lib/linked_list"
> list = LinkedList.new
=> <LinkedList head=nil #45678904567>
> list.head
=> nil
> list.append("doop")
=> "doop"
> list
=> <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
> list.head.next_node
=> nil
> list.count
=> 1
> list.to_string
=> "doop"

Iteration 2 - Append, All/To String and Insert (Multiple Nodes)
Now that we can insert the first element of our list (i.e. the Head), let’s focus on supporting these operations for multiple elements in the list.

This iteration is really where we’ll build out the core structure that makes up our linked list – it will probably take you more time than the previous iterations.

Update your append, count, and to_s methods to support the following interaction pattern:

> require "./lib/linked_list"
> list = LinkedList.new
=> <LinkedList head=nil #45678904567>
> list.head
=> nil
> list.append("doop")
=> "doop"
> list
=> <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
> list.head
=> <Node data="doop" next_node=nil #5678904567890>
> list.head.next_node
=> nil
> list.append("deep")
=> "deep"
> list.head.next_node
=> <Node data="deep" next_node=nil #5678904567890>
> list.count
=> 2
> list.to_string
=> "doop deep"
Notice the key point here – the first piece of data we append becomes the Head, while the second becomes the Next Node of that (Head) node.

Iteration 3 - Additional Methods - insert and prepend
Now we have nodes and a LinkedList class that manages the list. Next step is to add the insert and prepend methods.

prepend will add nodes to the beginning of the list.

insert will insert one or more elements at a given position in the list. It takes two parameters, the first one is the position at which to insert nodes, the second parameter is the string of data to be inserted.

Expected behavior:

> require "./lib/linked_list"
> list = LinkedList.new
> list.append("plop")
=> "plop"
> list.to_string
=> "plop"
> list.append("suu")
=> "suu"
> list.prepend("dop")
=> "dop"
> list.to_string
=> "dop plop suu"
> list.count
=> 3
> list.insert(1, "woo")
=> "woo"
list.to_string
=> "dop woo plop suu"

Jungle Beat
Iteration 4 - Additional Methods - find, pop, includes?
Perfect, we are almost there! Next is to add find, pop and includes? methods.

find takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return.

includes? gives back true or false whether the supplied value is in the list.

pop removes elements the last element from the list.

Expected behavior:

....
> list.to_string
=> "deep woo shi shu blop"
> list.find(2, 1)
=> "shi"
> list.find(1, 3)
=> "woo shi shu"
> list.includes?("deep")
=> true
> list.includes?("dep")
=> false
> list.pop
=> "blop"
> list.pop
=> "shu"
> list.to_string
=> "deep woo shi"


Iteration 5 - Creating the JungleBeat Linked List “Wrapper”
Awesome! We have built most of our program and now it’s time to wrap the Linked List logic in a JungleBeat class.

When we create a new instance of the JungleBeat class, a LinkedList object is also instantiated and available as an attribute on the JungleBeat instance. Now, we can manage our linked list through the JungleBeat class.

Up until now, we have only been able to append and prepend a single node at a time. The LinkedList class hasn’t formatted the data it received, consequently, passing the string “deep bop dop” to append has resulted in one node created with data deep bop dop. With JungleBeat as an extra layer, it can take care of properly formatting the data (eg: splitting the string) before passing it down to the LinkedList. This implementation results in three nodes appended to the list if we pass the string “deep bop dop” to JungleBeat#append.

Expected behavior:

> require "./lib/jungle_beat"
> jb = JungleBeat.new
=> <JungleBeat list=<LinkedList head=nil #234567890890> #456789045678>
> jb.list
=> <LinkedList head=nil #234567890890>
> jb.list.head
=> nil
> jb.append("deep doo ditt")
=> "deep doo ditt"
> jb.list.head.data
=> "deep"
> jb.list.head.next_node.data
=> "doo"
> jb.append("woo hoo shu")
=> "woo hoo shu"
> jb.count6

Iteration 6 - Playing Beats
Now that we have our JungleBeat class put together using the internal Linked List to keep track of our beats, let’s use it to actually play the beats.

Remember that, at the command line, we can play sounds using the say command:

$ say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
It turns out we can also easily issue this command (or any other system command) from ruby by using backticks: ```.

For example:

$ pry
> `say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "`
Additionally, we can use standard string interpolation (#{}) to pass dynamic content into a system command:

$ pry
> beats = "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
> `say -r 500 -v Boing #{beats}`
For this final section, add a play method to your JungleBeat class that will generate the string content of the JungleBeat and use it as input to the say command.

> require "./lib/jungle_beat"
> jb = JungleBeat.new
=> <JungleBeat list=<LinkedList head=nil #234567890890> #456789045678>
> jb.append("deep doo ditt woo hoo shu")
=> "deep doo ditt woo hoo shu"
> jb.count
=> 6
> jb.list.count
=> 6
> jb.play
=> # plays the sounds deep doo ditt woo hoo shu

Extensions
1. Validating Beats
There are a lot of words which aren’t going to work for beats. Like Mississippi.

Add validation to your program such that the input beats must be members of your defined list. Insertion of a beat not in the list is rejected. Like this:

> jb = JungleBeat.new("deep")
> jb.append("Mississippi")
=> 0
> jb.all
=> "deep"
> jb.prepend("tee tee tee Mississippi")
=> 3 # number of beats successfully inserted
> jb.all
=> "tee tee tee deep"
Here’s a starter list of valid beats, but add more if you like:

tee dee deep bop boop la na
2. Speed & Voice
Let’s make it so the user can control the voice and speed of playback. Originally we showed you to use say -r 500 -v Boing where r is the rate and v is the voice. Let’s setup a usage like this:

> jb = JungleBeat.new("deep dop dop deep")
> jb.play
=> 4 # plays the four sounds normal speed with Boing voice
> jb.rate = 100
=> 100
> jb.play
=> 4 # plays the four sounds slower with Boing voice
> jb.voice = "Alice"
=> "Alice"
> jb.play
=> 4 # plays the four sounds slower with Alice voice
> jb.reset_rate
=> 500
> jb.reset_voice
=> "Boing"
> jb.play
=> 4 # plays the four sounds normal speed with Boing voice