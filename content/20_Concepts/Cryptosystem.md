---
unit: FIT1058
parent: "[[Function Composition]]"
tags: [Math/Functions, CS/Cryptography, Monash/CS_DS]
---
# [[Cryptosystem]]

**Context:** [[FIT1058_MOC]] · the formal model of secure communication · decryption is the [[Inverse Function|inverse]] of encryption · layered via [[Function Composition]]

> [!abstract] Quick Revision
> - **🎯 Objective:** a key-indexed family of invertible functions ➔ encrypt with $e_k$, decrypt with $d_k=e_k^{-1}$.
> - **📦 Core Components:** five-tuple $(M,C,K,e,d)$ ➔ each $e_k$ a bijection ➔ cascade via composition.
> - **⚡ Critical Bottleneck:** every $e_k$ must be bijective (lossless), or decryption is ambiguous.

## 📝 Core
### 1. The Model
- **Definition** ➔ five-tuple $(M,C,K,e,d)$: message/ciphertext/key spaces, $e:M\times K\to C$, $d:C\times K\to M$.
- **Curried** ➔ fixing $k$ gives $e_k(m)$, $d_k(c)$.

### 2. The Axiom
- **Inverse** ➔ for every key $k$, $d_k=e_k^{-1}$, i.e. $d_k(e_k(m))=m$.
- **Bijection** ➔ each $e_k$ must be bijective so $e_k^{-1}$ exists ([[Injection, Surjection, Bijection]]).
- **Lossless** ➔ injective (distinct plaintexts → distinct ciphertexts), surjective onto $C$.

### 3. Cascading
- **Composition** ➔ $e_{(k,k')}=e'_{k'}\circ e_k$, $d_{(k,k')}=d_k\circ d'_{k'}$ (socks-and-shoes reverse).
- **Key space** ➔ $K\times K'$; composition of valid cryptosystems is valid.

**Key identities:**

$$d_k = e_k^{-1},\qquad d_k(e_k(m))=m\ \forall m$$
$$e_{(k,k')}=e'_{k'}\circ e_k,\qquad d_{(k,k')}=d_k\circ d'_{k'}$$

> [!NOTE] **Crossover Invariant:** security comes from hardness, not secrecy of method; cascading independently-hard layers is harder to break, but poorly chosen layers can **cancel** — more layers ≠ guaranteed stronger.

---
## 📊 Exam Execution Trace

### Manual Execution Trace
Caesar shift $k=3$ on $\mathbb Z_{26}$, "HAL" $=(7,0,11)$:

| Step / State | $m$ | $e_3(m)=(m+3)\bmod26$ | $d_3$ |
| :--- | :--- | :--- | :--- |
| **0 (Init)** | — | — | — |
| 1 | 7 (H) | 10 (K) | 7 |
| 2 | 0 (A) | 3 (D) | 0 |
| 3 | 11 (L) | 14 (O) | 11 |

## ⚠️ Pitfalls
- 💡 **Self-inverse cancels** ➔ a cipher with $e_k\circ e_k=i_M$ composed with the *same* key an even number of times returns the plaintext — repeating one key adds **no** security.

---
## 🧠 Active Recall
> [!FAQ]- State the cryptosystem axiom and why each $e_k$ must be a bijection.
> - **Core Insight Requirement:** Invertible = bijective.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** $d_k=e_k^{-1}$ (so $d_k(e_k(m))=m$); $e_k^{-1}$ exists iff $e_k$ is bijective.
> > - **Technical Justification:** **Lossless** ➔ injective avoids ambiguous decryption; surjective ensures every ciphertext decrypts.

> [!FAQ]- How are two cryptosystems composed, and why might composing add little security?
> - **Core Insight Requirement:** Reverse-order + cancellation.
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** $e_{(k,k')}=e'_{k'}\circ e_k$, $d_{(k,k')}=d_k\circ d'_{k'}$, key space $K\times K'$.
> > - **Technical Justification:** **Self-inverse cancels** ➔ same key even times returns plaintext; layers must be independently hard and non-cancelling.
