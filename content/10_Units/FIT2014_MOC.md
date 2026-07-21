---
unit: FIT2014
type: MOC
tags: [Monash/CS_DS, Math/Theory, CS/Computation]
---
# 📘 FIT2014: Theory of Computation

> [!INFO] Map of Content
> Index for **FIT2014 Theory of Computation** (Farr slides, updated by KokSheik Wong for MUM). A **Domain D** unit: **strictly zero code** — everything is formal logic, set theory and proof, rendered in LaTeX. The unit builds from *languages as sets of strings* and *logic as a modelling language* up through automata, grammars, Turing machines and NP-completeness. House conventions: $\Sigma$ for alphabets, $\varepsilon$ for the empty word, and **CNF is the working normal form** (DNF is a stepping stone). Much of the Week 1–2 logic overlaps [[FIT1058_MOC]] — those notes are **shared, dual-unit** rather than duplicated.

## 📊 Assessment Map
- **Practical Preparation (5%)** ➔ ongoing weekly prac work — part of the in-semester threshold hurdle.
- **Assignment 1 (10%)** ➔ Regular Expressions + Finite Automata — the W2 logic/CNF + coming automata material.
- **Mid-semester Test (15%)** ➔ everything to ~W6 ⟹ languages, logic, encoding, regex↔automata must be solid EARLY.
- **Assignment 2 (20%)** ➔ Lexical Analysis, Parsing, Computability.
- **Final exam (3h10, 50%)** ➔ whole unit; **the exam is a hurdle AND the in-semester tasks form a threshold hurdle** — no coasting on either half. *(2026 handbook)*
- **Reference text** ➔ Sipser (pp. 13–14 strings/languages; §0.3 pp. 17–20 definitions/theorems/proofs; pp. 14–15 and p. 302 for normal forms).
- **LO thread so far** ➔ define and manipulate formal languages; read/write propositional and predicate logic; **encode real problems in CNF** (the recurring assessable skill).

## 📅 Knowledge Index

### Week 1 — Languages, Propositional & Predicate Logic *(Lectures 1–3)*
- [[Formal Languages (Alphabets, Words, Languages)]] -> Parent Framework: [[FIT2014_MOC]]
- [[Theorem and Proof]] -> Parent Framework: [[FIT1058_MOC]] *(shared with FIT1058 — existential vs universal claims, "proof by example is not a proof")*
- [[Proposition and Truth Value]] -> Parent Framework: [[FIT1058_MOC]] *(shared)*
- [[Logical Connectives]] -> Parent Framework: [[Proposition and Truth Value]] *(shared — $\neg,\wedge,\vee,\Rightarrow,\Leftrightarrow$, truth tables, De Morgan)*
- [[Boolean Algebra Laws]] -> Parent Framework: [[Logical Connectives]] *(shared — tautology, logical equivalence, distributive laws)*
- [[Disjunctive Normal Form]] -> Parent Framework: [[Boolean Algebra Laws]] *(Smart Merged: dual-unit + the True-row/False-row two-table routine)*
- [[Conjunctive Normal Form]] -> Parent Framework: [[Boolean Algebra Laws]] *(Smart Merged: dual-unit + FIT2014's CNF-dominance framing)*
- [[Encoding Problems in Propositional Logic]] -> Parent Framework: [[Conjunctive Normal Form]]
- [[CNF Encoding Patterns (At Least, At Most, Exactly)]] -> Parent Framework: [[Conjunctive Normal Form]]
- [[Predicate]] -> Parent Framework: [[FIT1058_MOC]] *(Smart Merged: dual-unit + free/bound variables, predicates vs functions)*
- [[Quantifiers (Existential and Universal)]] -> Parent Framework: [[Theorem and Proof]] *(Smart Merged: dual-unit + multiple quantifiers, order sensitivity, distribution laws)*

### Week 2 — Proof Craft & Regular Expressions *(Lectures 4–6)*
- [[Proof Techniques]] -> Parent Framework: [[Theorem and Proof]] *(Smart Merged: dual-unit + set/numerical equality strategies, $\sqrt{2}$ canonical)*
- [[Mathematical Induction]] -> Parent Framework: [[Proof Techniques]] *(Smart Merged: dual-unit + correct hypothesis phrasing, extended De Morgan)*
- [[Proof Critique (Good, Bad and Ugly Proofs)]] -> Parent Framework: [[Proof Techniques]]
- [[Countability and Cantor Diagonalisation]] -> Parent Framework: [[Formal Languages (Alphabets, Words, Languages)]]
- [[Regular Expressions]] -> Parent Framework: [[Formal Languages (Alphabets, Words, Languages)]] *(**A1 material**)*
- [[Finding Regular Expressions]] -> Parent Framework: [[Regular Expressions]] *(**A1 hand skill**)*

### 🔭 Coming later in the unit *(from the Lecture 1 roadmap — no notes yet)*
- Finite automata (DFA/NFA) & regex↔automata equivalence · pumping lemma · grammars, context-free languages & pushdown automata · lexical analysis · parsing · Turing machines · computability & decidability · computational complexity · classes **P** and **NP** · **NP-completeness** · Linux tooling.

## 🧭 Suggested Reading Order
*(read left→right within each week · **bold** = assessment-critical hand skill)*

- **W1 — languages & logic:** [[Formal Languages (Alphabets, Words, Languages)]] → [[Theorem and Proof]] → [[Proposition and Truth Value]] → [[Logical Connectives]] → [[Boolean Algebra Laws]] → [[Disjunctive Normal Form]] → [[Conjunctive Normal Form]] → **[[Encoding Problems in Propositional Logic]]** *(assessable skill)* → **[[CNF Encoding Patterns (At Least, At Most, Exactly)]]** *(fastest marks)* → [[Predicate]] → **[[Quantifiers (Existential and Universal)]]** *(order sensitivity)*
- **W2 — proof craft → regex:** **[[Proof Techniques]]** *(subset-proof blueprint)* → **[[Mathematical Induction]]** *(hypothesis phrasing)* → [[Proof Critique (Good, Bad and Ugly Proofs)]] *(spot-the-flaw)* → [[Countability and Cantor Diagonalisation]] → [[Regular Expressions]] → **[[Finding Regular Expressions]]** *(A1 hand skill)*

## 🎯 Learning Outcomes (key skills per week)

- **W1** ➔ define $\Sigma$/word/language, $\emptyset \neq \{\varepsilon\}$ · use $\Sigma^k$, $\Sigma^*$, $x^0 = \varepsilon$ · decide EVEN-EVEN / DOUBLEWORD / PALINDROMES membership ($0$ is even) · one example proves $\exists$, never $\forall$ · truth-table the five connectives + "only if" / "necessary and sufficient" readings · prove equivalence/tautology via the Boolean laws (BOTH distributives) · DNF from True rows, CNF from False rows via De Morgan · encode a real problem in CNF (propositions → English constraints → formalise → clauses; physics imports nothing) · apply the cardinality templates (at least $x$ ⟹ $m = n - x + 1$ literals, $\binom{n}{m}$ clauses; at most = negated literals; exactly = both) · free vs bound variables · restrict with $\exists{+}\wedge$ / $\forall{+}\Rightarrow$ · distinguish $\exists\forall$ from $\forall\exists$ · apply $\neg\forall = \exists\neg$ + valid distributions ($\forall/\wedge$, $\exists/\vee$)
- **W2** ➔ pick the technique from the claim shape (construction / cases / contradiction / induction) · prove $A = B$ via $A \subseteq B$ **and** $A \supseteq B$ (numerically via $\le$ and $\ge$) · state the inductive hypothesis correctly ("**Let $k \ge 1$. Assume $S(k)$**") and test the step at its smallest $k$ · diagnose faulty inductions (missing base case; overlap failing at $n=1$) and *ex falso* reasoning · prove sets countable by exhibiting a listing ($\mathbb{N}, \mathbb{Z}, \Sigma^*$) and run **Cantor diagonalisation** to show $\{$languages$\}$ is uncountable ⟹ most languages have no finite description · read/write **regular expressions** (inductive definition; $\mathtt{ab}^* \neq (\mathtt{ab})^*$; $R^*$ includes $\varepsilon$) · convert a language description into a regex, **checking the smallest strings** (the start-and-end-with-$\mathtt{a}$ trap)
