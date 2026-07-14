---
unit: [FIT1058, FIT1047]
parent: "[[Logical Connectives]]"
tags: [Math/Logic, Math/Discrete, CS/Systems, Monash/CS_DS]
aliases: [Boolean Laws, De Morgan's Laws (Logic)]
---
# [[Boolean Algebra Laws]]

**Context:** [[FIT1058_MOC]] · [[FIT1047_MOC]] · the equivalences that govern [[Logical Connectives|connectives]] · proved by truth tables · the logical mirror of [[Set Operations (Mathematics)|set algebra]] · used to simplify and to build normal forms — and, in FIT1047, to shrink [[Transistors and Logic Gates|circuits]] before [[Karnaugh Maps]] make it systematic

> [!abstract] Quick Revision
> - **🎯 Objective:** equivalences transforming one Boolean expression into another ➔ simplify, or decide equivalence without a full truth table.
> - **📦 Core Components:** commutative / associative / idempotent / complement / identity / null / absorption / distributive / De Morgan.
> - **⚡ Critical Bottleneck:** **two** distributive laws (unlike numbers); same laws as [[Set Operations (Mathematics)|set algebra]]; simpler expression ⟹ simpler circuit.

## 📝 Core
### 1. Tautology & Equivalence
- **Tautology** ➔ always true (truth-table column all T).
- **Logically equivalent** ($P=Q$) ➔ identical truth tables ⟺ $P\Leftrightarrow Q$ a tautology.
- **Laws** ➔ standard equivalences to rewrite Boolean expressions; each is universally true ("law of nature" for logic).

### 2. The Dual Laws
- **Paired forms** ➔ each $\wedge$-law has a $\vee$-dual (commutative, associative, idempotent, complement/inverse, identity, null/annihilator, absorption, double complement).
- **Distributive (both ways)** ➔ $P\wedge(Q\vee R)=(P\wedge Q)\vee(P\wedge R)$ **and** $P\vee(Q\wedge R)=(P\vee Q)\wedge(P\vee R)$.
- **De Morgan** ➔ $\neg(P\vee Q)=\neg P\wedge\neg Q$, $\neg(P\wedge Q)=\neg P\vee\neg Q$.

### 3. Reducing Other Connectives
- **Implication** ➔ $P\Rightarrow Q=\neg P\vee Q$.
- **Biconditional** ➔ $P\Leftrightarrow Q=(\neg P\vee Q)\wedge(P\vee\neg Q)$.
- **Xor** ➔ $P\oplus Q=\neg(P\Leftrightarrow Q)$ ➔ shows $\{\neg,\wedge,\vee\}$ suffices ([[Universal Sets of Operations]]).

### 4. Circuit Notation & Why Simplify (FIT1047)
- **Engineering notation** ➔ AND: $XY$ (or $X\wedge Y$) · OR: $X+Y$ (or $X\vee Y$) · NOT: $\overline{X}$ (or $\neg X$) · constants $1/0$ for T/F.
- **Precedence** ➔ NOT binds tightest, then AND, then OR: $\overline{X}Y+Z$ reads $((\overline{X})Y)+Z$.
- **Law names in circuit dress** ➔ Identity $X{\cdot}1=X$, $X{+}0=X$ · Null $X{\cdot}0=0$, $X{+}1=1$ · Idempotent $XX=X$ · Inverse $X\overline{X}=0$, $X{+}\overline{X}=1$ · Absorption $X{+}XY=X$, $X(X{+}Y)=X$ · De Morgan $\overline{XY}=\overline{X}{+}\overline{Y}$.
- **Why simplify** ➔ simpler expression ⟹ simpler [[Transistors and Logic Gates|circuit]] ⟹ **cheaper, smaller, more power-efficient, faster** — the whole point of the algebra in hardware.
- **Limit of hand algebra** ➔ law-chasing is unsystematic; [[Karnaugh Maps]] give a guaranteed-minimal method for ≤6 variables.

---
## ⚖️ Core Decision Matrix
| Use | Goal | Tool |
| :--- | :--- | :--- |
| simplify | smaller equivalent | apply laws left-to-right |
| decide equivalence | avoid full truth table | reduce both to a normal form |
| set analogue | transfer results | $\wedge\leftrightarrow\cap$, $\vee\leftrightarrow\cup$, $\neg\leftrightarrow$ complement |
| minimise a circuit | guaranteed simplest SOP | [[Karnaugh Maps]] (systematic) over ad-hoc laws |

> [!NOTE] **Crossover Invariant:** every law mirrors a [[Set Operations (Mathematics)|set law]] under $\wedge\leftrightarrow\cap$, $\vee\leftrightarrow\cup$, $\neg\leftrightarrow$ complement, $\text{T}\leftrightarrow U$, $\text{F}\leftrightarrow\emptyset$ — so set and logical De Morgan are the *same* statements.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
Simplify $(P\vee Q)\wedge(P\vee\neg Q)$:

| Step / State | Expression | Law used |
| :--- | :--- | :--- |
| **0 (Init)** | $(P\vee Q)\wedge(P\vee\neg Q)$ | — |
| 1 | $P\vee(Q\wedge\neg Q)$ | distributive |
| 2 | $P\vee\text{F}$ | complement |
| 3 | $P$ | identity |

## ⚠️ Pitfalls
- 💡 **Logic has TWO distributive laws** ➔ both $\wedge/\vee$ directions hold; number algebra only has $\times$ over $+$ ($p+qr\neq(p+q)(p+r)$).
- 💡 **Precedence slips in circuit notation** ➔ $\overline{X}Y \neq \overline{XY}$ — the bar's extent matters; De Morgan converts between them at the cost of swapping the operator.

---
## 🧠 Active Recall
> [!FAQ]- Define tautology and logical equivalence, and how they relate.
> - **Core Insight Requirement:** All-true vs identical tables.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Tautology = truth table all T; $P=Q$ = identical truth tables.
> > - **Technical Justification:** **Link** ➔ $P=Q$ iff $P\Leftrightarrow Q$ is a tautology.

> [!FAQ]- Why does propositional logic have two distributive laws while number algebra has one?
> - **Core Insight Requirement:** $\wedge/\vee$ self-duality.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Both $\wedge$ over $\vee$ and $\vee$ over $\wedge$ hold; arithmetic only has $\times$ over $+$.
> > - **Technical Justification:** **Structural duality** ➔ Boolean algebra's paired-column symmetry (also De Morgan) is absent from numbers.

> [!FAQ]- Rewrite $P\Rightarrow Q$ and $P\Leftrightarrow Q$ using only $\neg,\wedge,\vee$.
> - **Core Insight Requirement:** Reduce to a functionally complete set.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** $P\Rightarrow Q=\neg P\vee Q$; $P\Leftrightarrow Q=(\neg P\vee Q)\wedge(P\vee\neg Q)$.
> > - **Technical Justification:** **Sugar over $\{\neg,\wedge,\vee\}$** ➔ with $P\oplus Q=\neg(P\Leftrightarrow Q)$, all connectives reduce to this set ([[Universal Sets of Operations]]).

> [!FAQ]- (FIT1047) Why does a hardware engineer care about these laws at all?
> - **Core Insight Requirement:** Expression size ⟹ circuit cost.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Each operator becomes a gate; a smaller equivalent expression means fewer gates ⟹ cheaper, smaller, cooler, faster silicon.
> > - **Technical Justification:** **Equivalence-preserving rewriting** ➔ the simplified circuit computes the identical truth table, verified row-by-row or by the laws used.
