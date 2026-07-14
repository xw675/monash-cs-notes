---
unit: FIT1058
parent: "[[Selection (Counting Framework)]]"
tags: [Math/Combinatorics, Math/Discrete, Monash/CS_DS]
---
# [[Stars and Bars]]

**Context:** [[FIT1058_MOC]] · counts unordered selection **with replacement** · $r$ items into $n$ bins via barriers · the hardest cell of the [[Selection (Counting Framework)|selection framework]]

> [!abstract] Quick Revision
> - **🎯 Objective:** unordered selection with replacement ➔ nonnegative solutions of $x_1+\dots+x_n=r$.
> - **📦 Core Components:** $r$ stars + $n-1$ bars ➔ $+1$ bijection ➔ $\binom{r+n-1}{r}$.
> - **⚡ Critical Bottleneck:** reduce with-replacement to without-replacement via an explicit bijection.

## 📝 Core
### 1. The Problem
- **Definition** ➔ choose $r$ from $n$ types, repeats allowed, order ignored.
- **Equivalent** ➔ nonnegative integer solutions of $x_1+\dots+x_n=r$ ($x_i\ge0$).
- **Count** ➔ $\binom{r+n-1}{n-1}=\binom{r+n-1}{r}$.

### 2. The Barrier Model
- **Stars + bars** ➔ $r$ stars, $n-1$ bars; bars split stars into $n$ groups $x_i$.
- **Difficulty** ➔ several bars may sit between the same two stars (when $x_i=0$).

### 3. The $+1$ Bijection
- **Substitute** ➔ $y_i=x_i+1\ge1$ ⟹ $y_1+\dots+y_n=r+n$.
- **Effect** ➔ at most one bar per gap ⟹ choose $n-1$ of $r+n-1$ gaps without replacement.
- **Result** ➔ $\binom{r+n-1}{n-1}=\binom{r+n-1}{r}$ (symmetry).

> [!NOTE] **Crossover Invariant:** the key CS move is **reducing a new problem to a solved one** — with-replacement → without-replacement — by an explicit bijection $x_i\mapsto x_i+1$.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
$n=5$, $r=3$; solution $(2,0,0,1,0)$:

| Step / State | Quantity | Value |
| :--- | :--- | :--- |
| **0 (Init)** | — | — |
| 1 | stars $r$ | 3 |
| 2 | bars $n-1$ | 4 |
| 3 | string | $1\,1\mid\mid\mid1\mid$ |

## ⚠️ Pitfalls
- 💡 **With ≠ without replacement** ➔ without replacement ($x_i\in\{0,1\}$) gives $\binom{n}{r}$; allowing $x_i\ge0$ changes it to $\binom{r+n-1}{r}$.

---
## 🧠 Active Recall
> [!FAQ]- What does $\binom{r+n-1}{r}$ count, and what is the stars-and-bars model?
> - **Core Insight Requirement:** Solutions of $x_1+\dots+x_n=r$.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Unordered selections with replacement of $r$ from $n$ types; $r$ stars, $n-1$ bars splitting into groups.
> > - **Technical Justification:** **Each arrangement** ➔ one selection $= (x_1,\dots,x_n)$.

> [!FAQ]- Why introduce $y_i=x_i+1$, and how does it yield $\binom{r+n-1}{n-1}$?
> - **Core Insight Requirement:** Reduce to without-replacement.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** $y_i\ge1$ makes the sum $r+n$ with every group nonempty ⟹ at most one bar per gap.
> > - **Technical Justification:** **Bijection** ➔ choosing $n-1$ of $r+n-1$ gaps without replacement gives $\binom{r+n-1}{n-1}$.
