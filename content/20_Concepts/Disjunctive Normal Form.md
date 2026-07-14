---
unit: FIT1058
parent: "[[Boolean Algebra Laws]]"
tags: [Math/Logic, Math/Discrete, Monash/CS_DS]
---
# [[Disjunctive Normal Form]]

**Context:** [[FIT1058_MOC]] · an OR-of-ANDs standard form · read directly from a truth table · dual to [[Conjunctive Normal Form]]

> [!abstract] Quick Revision
> - **🎯 Objective:** a disjunction (OR) of parts, each a conjunction (AND) of literals ➔ readable row-by-row from a truth table.
> - **📦 Core Components:** literal (plain $X$ / negated $\neg X$) ➔ one implicant per True row ➔ OR them.
> - **⚡ Critical Bottleneck:** up to $2^k$ parts (exponential blow-up); but satisfiability is trivial.

## 📝 Core
### 1. The Form (OR-of-ANDs)
- **Literal** ➔ a variable plain ($X$) or negated once ($\neg X$); $\neg\neg X$ is not a literal (equals $X$).
- **DNF** ➔ disjunction of parts, each part a conjunction of literals.
- **Standard form** ➔ built for **any** truth table ⟹ every expression has a DNF.

### 2. Reading It Off a Truth Table
- **Per True row** ➔ write a conjunction: variable **plain if True**, **negated if False**, AND them.
- **OR the rows** ➔ each part is True in exactly its own row ⟹ the OR is True on exactly $P$'s rows.
- **Meaning** ➔ the parts are an encoded list of all satisfying assignments.

**Key identities:**

$$P=(\neg X\wedge\neg Y)\vee(\neg X\wedge Y)\vee(X\wedge Y)$$

---
## ⚖️ Core Decision Matrix
| Property | DNF | Why |
| :--- | :--- | :--- |
| built from | True rows | one implicant each |
| satisfiability | **easy** | any internally-consistent part is a witness |
| size | up to $2^k$ parts | exponential blow-up |
| natural for | listing solutions | not for stating rules ([[Conjunctive Normal Form|CNF]] better) |

> [!NOTE] **Crossover Invariant:** DNF makes satisfiability trivial (inspect the parts — a part with no $X\wedge\neg X$ names a satisfying assignment), but real specifications list conditions that hold *together* (a conjunction), which suits CNF.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
$P$ with output T,T,F,T:

| Step / State | $X$ | $Y$ | Output | Row term (True row) |
| :--- | :--- | :--- | :--- | :--- |
| **0 (Init)** | — | — | — | — |
| 1 | F | F | T | $\neg X\wedge\neg Y$ |
| 2 | F | T | T | $\neg X\wedge Y$ |
| 3 | T | F | F | — |
| 4 | T | T | T | $X\wedge Y$ |

## ⚠️ Pitfalls
- 💡 **DNF keeps row-true literals plain** ➔ opposite of CNF's False-row negation; reduce $\neg\neg X$ to $X$ before calling it a literal.

---
## 🧠 Active Recall
> [!FAQ]- Construct the DNF of an expression from its truth table.
> - **Core Insight Requirement:** True rows → implicants.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** For each True row, AND the literals (plain if True, negated if False); OR the rows.
> > - **Technical Justification:** **Row-exact** ➔ each conjunction is true only in its own row, so the disjunction matches $P$ exactly.

> [!FAQ]- Why can DNF be impractical, yet make satisfiability easy?
> - **Core Insight Requirement:** $2^k$ rows vs part inspection.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Many True rows ⟹ exponentially many parts (impractical); but any internally-consistent part is a satisfying assignment.
> > - **Technical Justification:** **No search** ➔ satisfiability is a scan of the parts for one without $X$ and $\neg X$.
