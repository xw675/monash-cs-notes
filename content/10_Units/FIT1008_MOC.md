---
unit: FIT1008
type: MOC
tags: [Monash/CS_DS, 2026/S1]
---
# 📘 FIT1008: Introduction to Computer Science


> [!INFO] Map of Content
> Index for the **Algorithms & Algorithmic Complexity** lecture (FIT1008/2085). Each link below is a standalone atomic note. Start with [[Algorithm]] and follow the links.

## 📅 Knowledge Index

### Foundations
- [[Algorithm]]
- [[Computational Problem]]
- [[Algorithmic Complexity]] — backbone (incl. **Input Size** + **Running Time** + **Time Complexity** + **Cost of Elementary Operations** + **Best/Worst-Case** subsections)

### Asymptotic Analysis
- [[Big-O Notation]] — backbone (incl. **Asymptotic Analysis** + **Big-Omega/Theta** + **Properties** + **Complexity Classes** subsections)
- [[Arithmetic Series]]

### Worked Algorithms
- [[Linear Search]]
- [[Binary Search]]

### Sorting
- [[Sorting Problem]] — backbone (incl. **Bubble** + **Selection** + **Insertion** sorts + **Stability** + **Incrementality** subsections)

### Algorithm Properties
- [[Invariant]]

### ADTs & Stacks
- [[Abstract Data Type (ADT)]]
- [[Data Type]]
- [[Data Structure]]
- [[Array (Data Structure)]]
- [[Abstract Base Class]]
- [[Stack (ADT)]] — backbone (incl. **ArrayStack** + **LinkStack** subsections)

### Sets
- [[Set (ADT)]] — backbone (incl. **ArraySet** + **BVSet** subsections)
- [[Bit Vector]]

### Queues
- [[Queue (ADT)]] — backbone (incl. **LinearQueue** + **CircularQueue** + **LinkQueue** subsections)

### Lists
- [[List (ADT)]] — backbone (incl. **ArrayList** + **LinkList** + **LinkListIterator** subsections)
- [[Dynamic Array Resizing]]
- [[List Slicing]]
- [[List Comprehension]]

### Sorted Lists
- [[Sorted List (ADT)]] — backbone (incl. **SortedArrayList** subsection)
- [[Binary Search]]

### Linked Lists
- [[Node]]
- [[Linked Node Data Structure]]
- [[List (ADT)]] → **LinkList** subsection

### Iterators & Higher-Order Functions
- [[Iterable]]
- [[Iterator]]
- [[List (ADT)]] → **LinkListIterator** subsection
- [[Generator Expression]]
- [[Higher-Order Function]]

### Linked Stacks & Queues
- [[Stack (ADT)]] → **LinkStack** subsection
- [[Queue (ADT)]] → **LinkQueue** subsection

### Hash Tables
- [[Dictionary (ADT)]]
- [[Hash Table]] — backbone (incl. **Hash Function** + **Collision Resolution** + **Open Addressing** + **Linear Probing** + **Load Factor** subsections)

### Recursion
- [[Recursion]] — backbone (incl. **Notation** + **Accumulator** + **Auxiliary Function** + **vs Iteration** + **→Iteration via Stack** subsections)
- [[Tower of Hanoi]]

### Recursive Sorts (Divide & Conquer)
- [[Divide and Conquer]]
- [[Merge Sort]]
- [[Quick Sort]]

### Priority Queues & Heaps
- [[Priority Queue (ADT)]]
- [[Heap]] — backbone (incl. **Bottom-Up Construction** subsection)
- [[Heapsort]]

### Trees
- [[Tree]]
- [[Binary Tree]] — backbone (incl. **Tree Traversal** + **Expression Tree** subsections)
- [[Binary Search Tree (BST)]]

## 🧭 Suggested Reading Order

1. [[Algorithm]] → [[Computational Problem]] — what we are solving and with what.
2. [[Algorithmic Complexity]] → [[Algorithmic Complexity|Input Size]] → [[Algorithmic Complexity|Running Time]] → [[Algorithmic Complexity|Time Complexity]] — how we measure cost (and why we count steps, not seconds).
3. [[Big-O Notation|Asymptotic Analysis]] → [[Big-O Notation]] → [[Big-O Notation|Properties of Big-O]] → [[Big-O Notation|Complexity Classes]] — the maths of "how it scales".
4. [[Linear Search]] vs [[Binary Search]] — the same problem solved at $O(k)$ vs $O(\log k)$.
5. [[Sorting Problem]] → [[Sorting Problem|Bubble Sort]] → [[Sorting Problem|Selection Sort]] → [[Sorting Problem|Insertion Sort]], reasoning about each via [[Invariant]], [[Sorting Problem|Stability (Sorting)]], and [[Sorting Problem|Incrementality (Sorting)]].
6. [[Algorithmic Complexity|Best-Case and Worst-Case Complexity]] + [[Arithmetic Series]] + [[Algorithmic Complexity|Cost of Elementary Operations]] → formally analyse all three sorts (all $O(n^2)$ worst case; insertion/bubble-II reach $O(n)$ best case).
7. [[Abstract Data Type (ADT)]] vs [[Data Type]] vs [[Data Structure]] → [[Array (Data Structure)]] → [[Abstract Base Class]] → [[Stack (ADT)]] → [[Stack (ADT)|ArrayStack]] — abstraction, then a concrete array-backed stack with $O(1)$ push/pop/peek.
8. [[Set (ADT)]] → [[Set (ADT)|ArraySet]] ($O(N)$, any type) vs [[Bit Vector]] → [[Set (ADT)|BVSet]] ($O(1)$ ops, integers only) — same interface, opposite performance profiles; the lesson is choosing the implementation to fit the data.
9. [[Queue (ADT)]] (FIFO, vs [[Stack (ADT)]]'s LIFO) → [[Queue (ADT)|LinearQueue]] (simple but wastes space) → [[Queue (ADT)|CircularQueue]] (wrap-around with modulo, same $O(1)$ but no wasted space).
10. [[List (ADT)]] (ordered, any-position access — the general case) → [[List (ADT)|ArrayList]] ($O(1)$ get/set, $O(N)$ shift for insert/delete) → [[Dynamic Array Resizing]] (grow-by-factor, amortised $O(1)$ append). Python asides: [[List Slicing]], [[List Comprehension]].
11. [[Sorted List (ADT)]] (sort invariant → `add` replaces append/insert) → [[Sorted List (ADT)|SortedArrayList]] → [[Binary Search]] ($O(\log n)$ search, always beating [[Linear Search]]; needs sorted data + array random access).
12. [[Node]] → [[Linked Node Data Structure]] (the array-vs-linked trade-off) → [[List (ADT)|LinkList]] — a [[List (ADT)]] of chained nodes: $O(1)$ insert/delete at the head, but $O(n)$ access and no [[Binary Search]] (mirror image of [[List (ADT)|ArrayList]]).
13. [[Iterable]] (a class with `__iter__`) vs [[Iterator]] (`__iter__` + `__next__`, `StopIteration`) → [[List (ADT)|LinkListIterator]] (read-only, then a modifying version with `delete`/`peek`/`has_next`) — lets you `for`-loop a [[List (ADT)|LinkList]] without touching internals. Then [[Generator Expression]] (lazy [[List Comprehension]]) and [[Higher-Order Function]] (functions as first-class values).
14. [[Stack (ADT)|LinkStack]] ([[Stack (ADT)]] via a `top` pointer) and [[Queue (ADT)|LinkQueue]] ([[Queue (ADT)]] via `front`+`rear`) — both $O(1)$ at their ends, never full, no circular trick needed; the trade-off vs [[Stack (ADT)|ArrayStack]]/[[Queue (ADT)|CircularQueue]] is space-per-link vs wasted capacity. Swapping array↔linked is a one-line constructor change — the payoff of ADTs.
15. [[Dictionary (ADT)]] (key→value container) → [[Hash Table]] (array + hash, **expected $O(1)$** search/add/delete, beating sorted-list $O(\log N)$) → [[Hash Table|Hash Function]] (uniform, fast, Horner's method; prime base + prime TABLESIZE to avoid common factors) → [[Hash Table|Collision Resolution]] (collisions are inevitable; separate chaining with a [[List (ADT)|LinkList]] per cell, $O(n)$ in chain length; open addressing next).
16. [[Hash Table|Open Addressing]] (store collided keys *in the table itself* by probing, vs chaining's external lists) → [[Hash Table|Linear Probing]] (`+1` probing, the invariant that a key sits between its hash slot and the first empty slot, correct deletion by reinsertion or sentinels) → [[Hash Table|Load Factor]] ($N/\text{TABLESIZE}$; keep it under $1/2$–$2/3$ to fight clustering and hold the expected $O(1)$).
17. [[Recursion]] (solve a problem via simpler same-kind subproblems; base case + recursive call + convergence + combination; `factorial`) → [[Recursion|Recursion vs Iteration]] (interchangeable; recursion uses the run-time stack, iteration may need accumulators/an explicit [[Stack (ADT)]]) → [[Recursion|Auxiliary Function (Recursion)]] (helper threading a [[Node]] pointer to recurse over a [[List (ADT)|LinkList]], e.g. `len_aux`/`contains_aux`).
18. [[Divide and Conquer]] (split → solve subproblems independently → combine; balanced halves give $O(n \log n)$) → [[Merge Sort]] (trivial split, complex merge; stable; $O(n)$ extra space; guaranteed $O(n \log n)$) vs [[Quick Sort]] (complex partition around a pivot, trivial combine; in-place; best $O(n \log n)$, worst $O(n^2)$ on bad pivots; [[Sorting Problem|Insertion Sort]] for tiny arrays) — the split/combine work trade-off, both beating the $O(n^2)$ [[Sorting Problem|Bubble Sort]]/[[Sorting Problem|Selection Sort]]/[[Sorting Problem|Insertion Sort]] family.
19. [[Recursion|Recursion Notation]] (unary/binary/n-ary, direct vs indirect, tail recursion) → [[Recursion|Accumulator (Recursion)]] (carry the partial result forward to make recursion tail-recursive; turns naive $O(2^n)$ Fibonacci into $O(n)$) → [[Recursion|Recursion to Iteration via Stack]] (simulate the run-time [[Stack (ADT)]] explicitly when an accumulator won't do; `power`, print-reverse) → [[Tower of Hanoi]] (classic binary recursion, $2^n-1$ moves).
20. [[Priority Queue (ADT)]] (serve highest-priority first; `add` + `get_max`; every linear impl — unsorted/sorted [[List (ADT)|ArrayList]]/[[List (ADT)|LinkList]] — is stuck with one $O(N)$ operation) → [[Heap]] (a **complete**, **heap-ordered** binary tree; `add` rises and `get_max` swaps-with-last then sinks, both $O(\log n)$ thanks to the balance completeness guarantees) — the non-linear structure that finally makes both priority-queue operations fast.
21. [[Tree]] (root/leaf/parent/child/subtree/path/level/depth/height/width; formally an acyclic connected graph; ops cost $O(\text{height})$) → [[Binary Tree]] ($\le 2$ children; **balanced** → height $O(\log N)$ via the perfect-tree count $N=2^{k+1}-1$, **unbalanced** → $O(N)$ like a [[List (ADT)|LinkList]]) → [[Binary Tree|Tree Traversal]] (preorder/inorder/postorder — all left-before-right, differing in *when the root is processed*; general $O(N)$ recursion taking a [[Higher-Order Function]] `f`).
22. [[Heap]] (array-backed: root at 1, children $2k/2k{+}1$, parent $k/2$; `add` rises, `get_max` swaps-with-last then sinks, both $O(\log N)$) → [[Heap|Bottom-Up Heap Construction]] (heapify a whole array in $\Theta(N)$ by sinking internal nodes from $\lfloor N/2\rfloor$ down — the sum-of-heights $2^h{-}1{-}h$ proof — vs $O(N\log N)$ for $N$ inserts) → [[Heapsort]] (build then extract-max $N$ times: in-place, **guaranteed** $O(N\log N)$, unstable — [[Sorting Problem|Selection Sort]] with an $O(\log N)$ `find_max`, and [[Quick Sort]]'s worst-case fallback). Heap-vs-BST: the same keys give very different shapes — a heap only locates the max, a BST keeps full key order.
23. [[Binary Tree|Expression Tree]] (a [[Binary Tree]] with operators as inner nodes and operands as leaves; **preorder→prefix**, **inorder→infix**, **postorder→postfix/RPN** — the three [[Binary Tree|traversals]] *are* the three notations) → [[Binary Search Tree (BST)]] (a binary tree with the ordering invariant left-key < node < right-key; `search`/`insert`/`delete` are $O(\text{depth})$ — $O(\log N)$ balanced, $O(N)$ unbalanced; recursive `insert` must **return and re-link** the node, delete uses the **in-order successor**, and an explicit-[[Stack (ADT)|stack]] iterator makes it iterable in preorder) — good for search *and* insert/delete, unlike a [[Sorted List (ADT)|sorted array]] or sorted [[List (ADT)|LinkList]], and ordered unlike a [[Hash Table]].

## 🎯 Lecture Learning Outcomes

After this lecture you should be able to: explain what an algorithm is and how its **time complexity** is analysed; define **Big-O** and apply its properties; combine Big-O terms; and recognise common **complexity classes** ($O(1)$, $O(\log n)$, $O(n)$, $O(n \log n)$, $O(n^2)$, $O(2^n)$).
