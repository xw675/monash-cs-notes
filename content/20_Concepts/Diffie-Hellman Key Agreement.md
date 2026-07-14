---
unit: FIT1058
parent: "[[One-Way Function]]"
tags: [Math/NumberTheory, CS/Cryptography, Monash/CS_DS]
---
# [[Diffie-Hellman Key Agreement]]

**Context:** [[FIT1058_MOC]] · two parties agree a shared secret over an insecure channel · built on the [[One-Way Function|modular-exponentiation one-way function]] · security rests on the Discrete Logarithm

> [!abstract] Quick Revision
> - **🎯 Objective:** two users agree a shared key over a public channel ➔ no pre-shared secret needed.
> - **📦 Core Components:** public $p,a$ ➔ private $x$, public $a^x$ ➔ shared $a^{x_Ax_B}$.
> - **⚡ Critical Bottleneck:** not itself a cryptosystem; security rests on the hard Discrete Log.

## 📝 Core
### 1. The Scheme
- **Goal** ➔ shared key without a pre-arranged secret channel.
- **Primitive** ➔ $x\mapsto a^x\bmod p$, $a$ a [[Primitive Root|primitive root]] of a large prime $p$ ([[One-Way Function]]).
- **Not a cryptosystem** ➔ only agrees a key, then used with a separate cipher.

### 2. The Protocol
- **Public** ➔ large prime $p$, primitive root $a$.
- **Each user** ➔ private random $x$; publishes $y=a^x\bmod p$.
- **Shared key** ➔ each raises the other's public value to its own private: $k_{AB}=y_B^{x_A}$, $k_{BA}=y_A^{x_B}$.

### 3. Security
- **DH problem** ➔ given $p,a,a^{x_A},a^{x_B}$, find $a^{x_Ax_B}$.
- **Reduces to** ➔ Discrete Log (recover $x$ from $a^x$), believed hard.

**Key identities:**

$$k_{AB}=y_B^{x_A}=(a^{x_B})^{x_A}=a^{x_Ax_B}=(a^{x_A})^{x_B}=y_A^{x_B}=k_{BA}\pmod p$$

---
## ⚖️ Core Decision Matrix
| Item | Public? | Role |
| :--- | :--- | :--- |
| $p,a$ | yes | system parameters |
| private $x$ | **no** | each user's secret |
| $y=a^x$ | yes | published |
| $a^{x_Ax_B}$ | never sent | shared key |

> [!NOTE] **Crossover Invariant:** DH solves key distribution — only public numbers are exchanged — but conveys no chosen message, so it must be paired with a secret-key [[Cryptosystem]]. Security needs a large prime and primitive-root base (max $\phi(p)=p-1$).

---
## 📊 Exam Execution Trace

### Applied Exercise
**Problem:** Compute both keys and confirm they match.
**Derivation Proof / Hand-Calculation Walkthrough:**
$$
\begin{aligned}
y_A = 5^6\bmod23 = 8,\quad y_B &= 5^{15}\bmod23 = 19 \\
k_{AB}=19^6\bmod23 = 2 &= 8^{15}\bmod23 = k_{BA} = 5^{6\cdot15}\bmod23
\end{aligned}
$$
**Final Extracted Output:** shared key $2$, never transmitted; eavesdropper sees only $p,a,8,19$.

## ⚠️ Pitfalls
- 💡 **Key never transmitted** ➔ the shared $a^{x_Ax_B}$ is computed independently; an eavesdropper sees only $p,a,a^{x_A},a^{x_B}$ and faces the DH/Discrete-Log problem.

---
## 🧠 Active Recall
> [!FAQ]- Walk through Diffie-Hellman and show why Alice and Bob compute the same key.
> - **Core Insight Requirement:** Commuting exponents.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Alice forms $y_B^{x_A}$, Bob $y_A^{x_B}$; both equal $a^{x_Ax_B}\pmod p$.
> > - **Technical Justification:** **Never sent** ➔ the key needs a private exponent; only $a^{x_A},a^{x_B}$ are public.

> [!FAQ]- What problem must an eavesdropper solve, and why is DH not a cryptosystem by itself?
> - **Core Insight Requirement:** DH problem = discrete log.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** Given $p,a,a^{x_A},a^{x_B}$, find $a^{x_Ax_B}$ — reduces to the hard Discrete Log.
> > - **Technical Justification:** **No message** ➔ DH only agrees a key; a separate [[Cryptosystem]] encrypts traffic.
