---
unit: FIT1008
parent: "[[Iterable]]"
tags: [CS/DataStructures, OOP/Python]
---
# [[Iterator]]

**Context:** [[FIT1008_MOC]] · the stateful "bookmark" that walks an [[Iterable]] · realised by [[List (ADT)|LinkListIterator]] · built on [[Node]] traversal

> [!abstract] Quick Revision
> - **🎯 Objective:** a bookmark object remembering where you are ➔ yields the next element on request.
> - **📦 Core Components:** `__next__` (next or `StopIteration`) + `__iter__` (returns self) ➔ external (pull) vs internal (push).
> - **⚡ Critical Bottleneck:** $O(1)$ per `next`, $O(1)$ space (stores only the cursor); **single-use** and invalid if the collection mutates (fail-fast).

## 📝 Core
### 1. The Iterator (Cursor Object)
- **Separate object** ➔ remembers the **position**, yields the **next** element ➔ advancing changes its own state, not the data.
- **Coexistence** ➔ several iterators can walk one [[Iterable]] at once.
- **Protocol** ➔ `__next__` + `__iter__` (returns self); driven by `next(it)`.
- **Single-use** ➔ once exhausted stays exhausted; $O(1)$ space ⟹ mutating the collection **invalidates** it.

### 2. External vs Internal Iteration
- **External (pull)** ➔ *client* calls `next` and controls the loop ➔ early stop, `zip` two iterators, pause/resume.
- **Internal (push)** ➔ collection pushes each element to a callback ([[Binary Tree|Tree Traversal]]'s `f`, `map`, `forEach`).
- **Fail-fast** ➔ detects structural modification during iteration and raises (Java `ConcurrentModificationException`, Python `RuntimeError`).

---
## ⚙️ Core Implementation
### 🔹 `LinkListIterator`
> [!code]- `__next__` advances the bookmark
> ```python
> class LinkListIterator(Generic[T]):
>     def __init__(self, node): self.current = node
>     def __iter__(self): return self                  # an iterator is its own iterator
>     def __next__(self):
>         if self.current is not None:                 # 'is not None', not '!= None'
>             item = self.current.item
>             self.current = self.current.link          # advance the bookmark
>             return item
>         raise StopIteration                          # exhausted -> stop the for-loop
> ```
> 💡 **Exam Pitfall:** **Use `is not None`, not `!= None`** ➔ `!=` calls the item type's (possibly redefined/slow) `__eq__`; identity `is` is safe and $O(1)$.

> [!NOTE] **Crossover Invariant:** external (pull) is flexible — `for x in it`, early break, interleave with `zip`; internal (push) encapsulates order — `map(f, xs)`, tree callback. For deliberate mutation during traversal use a **modifying iterator** ([[List (ADT)|LinkListIterator]]), not a fail-fast read-only one.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
Driving an iterator over `1 -> 2 -> 3`:

| Step / State | Call | `current` | Returns |
| :--- | :--- | :--- | :--- |
| **0 (Init)** | — | node 1 | — |
| 1 | `next` | node 1 → node 2 | `1` |
| 2 | `next` | node 2 → node 3 | `2` |
| 3 | `next` | node 3 → `None` | `3` |
| 4 | `next` | `None` | `StopIteration` |

### Applied Exercise
**Problem:** Contrast who owns the loop in external vs internal iteration.
**Derivation Proof / Hand-Calculation Walkthrough:**
$$
\begin{aligned}
\text{external (pull)} &: \text{client} \xrightarrow{\texttt{next}} \text{iterator} \quad(\text{client owns the loop}) \\
\text{internal (push)} &: \text{collection} \xrightarrow{f(x)} \text{client callback} \quad(\text{collection owns the loop})
\end{aligned}
$$
**Final Extracted Output:** external wins on control; internal on encapsulating traversal order.

---
## 🧠 Active Recall
> [!FAQ]- Contrast external (pull) and internal (push) iteration and give a Python example of each.
> - **Core Insight Requirement:** Who drives the loop.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** External: client calls `next(it)` (`for x in it`); internal: collection pushes to a callback (`map(f, xs)`, tree traversal `f`).
> > - **Technical Justification:** **Control vs encapsulation** ➔ external allows early break / interleaving; internal hides traversal order.

> [!FAQ]- What is a fail-fast iterator and what problem does it prevent?
> - **Core Insight Requirement:** Detect concurrent modification.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** It detects structural modification during iteration (via a mod counter) and raises immediately.
> > - **Technical Justification:** **Prevents silent corruption** ➔ skipping/double-visiting or stale links; deliberate mutation needs a modifying iterator.

> [!FAQ]- Why is an iterator a separate object from its collection, and what two properties follow?
> - **Core Insight Requirement:** Holds position without mutating data.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** (1) Multiple independent iterators can traverse one iterable; (2) it's single-use and $O(1)$ space.
> > - **Technical Justification:** **Cursor, not copy** ➔ re-iterating needs a fresh one; mutating the collection invalidates it.
