---
unit: FIT1058
parent: "[[Theorem and Proof]]"
tags: [Math/Proof, Math/Logic, Monash/CS_DS]
---
# [[Proof Techniques]]

**Context:** [[FIT1058_MOC]] · the named patterns a [[Theorem and Proof|proof]] follows · matched to the claim's [[Quantifiers (Existential and Universal)|quantifier]] · [[Mathematical Induction]] is the fifth

> [!abstract] Quick Revision
> - **🎯 Objective:** pick the argument pattern matching the claim's logical shape ➔ construction / cases / contradiction / symbolic manipulation (+ induction).
> - **📦 Core Components:** $\exists\to$ construction | $\forall\to$ cases | hard-direct $\to$ contradiction | identities $\to$ symbolic manipulation.
> - **⚡ Critical Bottleneck:** a single example proves $\exists$ but **never** $\forall$; exhaustion needs a finite (or finitely-partitioned) domain.

## 📝 Core
### 1. Symbolic Manipulation
- **Method** ➔ a chain of law-justified equalities transforming one expression into another.
- **Freedom** ➔ start from **either** side (often the more complex, simplifying toward the other).
- **Scope** ➔ algebra, set laws (De Morgan, distributive, idempotent).

### 2. Construction (Witness)
- **Proves** ➔ an **existential** $\exists x,\ P(x)$ by exhibiting one concrete object.
- **Pitfall** ➔ a single example **never** proves a **universal** $\forall$ — it only illustrates.

### 3. Cases (Exhaustion)
- **Method** ➔ split the domain into finitely many cases that **collectively cover everything**; prove each.
- **Rules** ➔ cases **may overlap** (redundant but valid); they must be **exhaustive**; infinite domains partition (e.g. $2k$ vs $2k+1$).

### 4. Contradiction (*Reductio*)
- **Method** ➔ assume the **negation**, derive an absurdity ($0=1$), conclude the assumption false.
- **Canonical** ➔ Euclid's infinitude of primes; interesting-number (Well-Ordering).

---
## ⚖️ Core Decision Matrix
| Claim shape | Technique | Key first move |
| :--- | :--- | :--- |
| $\exists x,\ P(x)$ | construction | exhibit one witness |
| $\forall x,\ P(x)$ (finite domain) | cases / exhaustion | partition, prove each |
| equality / identity | symbolic manipulation | transform one side |
| hard to attack directly | contradiction | assume the negation |
| $\forall n\in\mathbb N$ | [[Mathematical Induction]] | base + inductive step |

> [!NOTE] **Crossover Invariant:** method follows the goal — the quantifier picks the pattern. Exhaustion needs a *finite* (or finitely-partitioned) domain; contradiction needs a true axiom framework, so a derived absurdity convicts only the assumed negation. Real proofs often **combine** several.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
Matching claims to techniques:

| Step / State | Claim | Logical shape | Technique |
| :--- | :--- | :--- | :--- |
| **0 (Init)** | — | — | — |
| 1 | "$\exists$ even prime" | existential | construction (witness 2) |
| 2 | "$n^2-n$ even $\forall n$" | universal, finite cases | cases ($2k$, $2k+1$) |
| 3 | "$\sqrt2$ irrational" | hard-direct | contradiction |

## ⚠️ Pitfalls
- 💡 **Construction ≠ universal proof** ➔ exhibiting one witness settles $\exists$ only; a $\forall$ claim needs cases/arbitrary-element, and contradiction relies on a *true* framework so the lone false assumption is convicted.

---
## 🧠 Active Recall
> [!FAQ]- Match each proof method to the claim it suits, and give construction's pitfall.
> - **Core Insight Requirement:** Quantifier ↔ method.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Symbolic → identities; construction → $\exists$; cases → finite $\forall$; contradiction → hard-direct.
> > - **Technical Justification:** **One example ≠ $\forall$** ➔ a witness proves only existence; a universal needs every case or an arbitrary element.

> [!FAQ]- Outline Euclid's proof of infinitely many primes and why it is by contradiction.
> - **Core Insight Requirement:** Construct $q$, force a missing prime.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Assume finitely many $p_1,\dots,p_n$; $q=p_1\cdots p_n+1$ has remainder 1 under each $p_i$, so a prime outside the list exists.
> > - **Technical Justification:** **Contradiction** ➔ this refutes the completeness assumption (Fundamental Theorem of Arithmetic guarantees $q$ has a prime factor).

> [!FAQ]- In the "every natural is interesting" proof, which principle is used and why does it fail over $\mathbb Z$?
> - **Core Insight Requirement:** Well-Ordering.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Well-Ordering: every non-empty $\subseteq\mathbb N$ has a smallest element; the smallest "uninteresting" number is thereby interesting — contradiction.
> > - **Technical Justification:** **$\mathbb Z$ not well-ordered** ➔ it extends to $-\infty$, so a non-empty integer set need not have a least element; the construction breaks.
