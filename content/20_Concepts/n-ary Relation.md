---
unit: FIT1058
parent: "[[Binary Relation]]"
tags: [Math/Relations, CS/Databases, Monash/CS_DS]
---
# [[n-ary Relation]]

**Context:** [[FIT1058_MOC]] · generalises the [[Binary Relation]] to $n$ columns · the formal model of a relational database table · counted via the [[Power Set]]

> [!abstract] Quick Revision
> - **🎯 Objective:** a subset of an $n$-fold Cartesian product — a set of $n$-tuples ➔ the model of a relational table.
> - **📦 Core Components:** $n$ domains ➔ tuples (rows) ➔ counted by the [[Power Set]].
> - **⚡ Critical Bottleneck:** relations ($2^{mn}$) vastly outnumber functions ($n^m$).

## 📝 Core
### 1. The Relation ($n$ Columns)
- **Definition** ➔ $R\subseteq A_1\times\cdots\times A_n$ — a set of ordered $n$-tuples, $i$-th from $A_i$.
- **$i$-th domain** ➔ $A_i$; common cases $n=2$ (binary), $n=3$ (ternary).

### 2. Databases
- **Table = relation** ➔ each **column** is a domain $A_i$, each **row** is a tuple.
- **Why "relational"** ➔ data is literally a set of tuples from a product.
- **Projection** ➔ extracting two columns yields a [[Binary Relation]].

### 3. Counting via the Power Set
- **All relations** ➔ subsets of the product ⟹ its [[Power Set]].
- **Formulas** ➔ $2^{mn}$ ($A\to B$), $2^{m^2}$ (on $A$), $2^{m_1\cdots m_n}$ ($n$-ary).

**Key identities:**

$$\#\{\text{relations }A\to B\}=2^{mn},\qquad \#\{\text{relations on }A\}=2^{m^2},\qquad \#\{n\text{-ary}\}=2^{m_1\cdots m_n}$$

---
## ⚖️ Core Decision Matrix
| Object | Count ($m\times n$) | Constraint |
| :--- | :--- | :--- |
| binary relation $A\to B$ | $2^{mn}$ | none |
| relation on $A$ | $2^{m^2}$ | none |
| function $A\to B$ | $n^m$ | single-valued + total |
| $n$-ary relation | $2^{m_1\cdots m_n}$ | none |

> [!NOTE] **Crossover Invariant:** $n=2$ recovers the [[Binary Relation]]; restricting to single-valued total tuples recovers multi-argument [[Function (Mathematics)|functions]] $X_1\times\cdots\times X_{n-1}\to X_n$. Dropping single-valuedness explodes $n^m$ to $2^{mn}$.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
$\lvert A\rvert=2$, $\lvert B\rvert=3$:

| Step / State | Object | Formula | Value |
| :--- | :--- | :--- | :--- |
| **0 (Init)** | — | — | — |
| 1 | relations $A\to B$ | $2^{2\cdot3}$ | 64 |
| 2 | relations on $A$ | $2^{2^2}$ | 16 |
| 3 | functions $A\to B$ | $3^2$ | 9 |

## ⚠️ Pitfalls
- 💡 **Tuples are ordered** ➔ column order is part of the schema; relations vastly outnumber functions because each of the $mn$ pairs is independently in or out.

---
## 🧠 Active Recall
> [!FAQ]- Why is a relational database table an $n$-ary relation, and what plays the role of domains and tuples?
> - **Core Insight Requirement:** Columns = domains, rows = tuples.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** A table is a subset of $A_1\times\cdots\times A_n$; columns are domains, rows are $n$-tuples.
> > - **Technical Justification:** **Relational** ➔ the data is a set of tuples from a [[Cartesian Product]].

> [!FAQ]- How many binary relations $A\to B$ are there, and why far more than functions?
> - **Core Insight Requirement:** Power set of the product.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** $2^{mn}$ relations (any subset of $A\times B$); only $n^m$ functions.
> > - **Technical Justification:** **No single-valued constraint** ➔ each of the $mn$ pairs is independently included.
