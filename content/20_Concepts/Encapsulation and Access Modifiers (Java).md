---
unit: FIT2099
parent: "[[OOP Building Blocks (Class, Object, Field, Method)]]"
tags: [SWE/Java, SWE/Design, SWE/OOP, Monash/CS_DS]
aliases: [encapsulation, information hiding, access modifiers, public, private, protected, package-private, getter, setter]
---
# [[Encapsulation and Access Modifiers (Java)]]

**Context:** [[FIT2099_MOC]] · control **who can see** a [[OOP Building Blocks (Class, Object, Field, Method)|field/method]] · the mechanism behind information hiding and loose [[Client-Supplier Relationship (Java)|coupling]]
**Parent Framework:** [[OOP Building Blocks (Class, Object, Field, Method)]]

> [!abstract] Quick Revision
> - **🎯 Objective:** hide internal state behind **private** fields and expose only a deliberate public interface ➔ encapsulation / information hiding.
> - **📦 Core Components:** `public` (world) | `protected` (package + subclasses) | *default* (package) | `private` (this class only).
> - **⚡ Critical Bottleneck:** encapsulation ≠ "getter + setter for everything" — expose **only** the accessors a client genuinely needs; a write-only or read-only field is often correct.

## 📝 Dashboard Blueprint
### 1. Encapsulation
- **Private fields** ➔ mark data `private` so no outside class can read/write it directly.
- **Selective accessors** ➔ add a getter and/or setter **only where needed** — not always both (a field may be read-only).
- **Why** ➔ the class controls its own invariants (a setter can validate); internals can change without breaking [[Client-Supplier Relationship (Java)|clients]].

### 2. Encapsulation Boundaries & ReD
- **Boundary** ➔ anything visibility can be restricted across — the **class**, the **package**, the **module** ([[Java Packages and Imports|Java 9+]]), even a `{}` block scope.
- **Crossing = coupling** ➔ any access to a member outside its own class/package **crosses a boundary**; each crossing is a dependency.
- **ReD (Reducing Dependency)** ➔ expose (make `public`) only what client code truly needs and hide everything else, so there are **fewer** boundary crossings to break later.
- **Abstraction layer = the public interface** ➔ the publicly-accessible face of a class/package/subsystem; size it so **API complexity doesn't exceed the benefit to clients** (a car's start/stop button, not an Airbus cockpit).
- **Connascence** ➔ hidden coupling where changing one element forces a change in another; a well-encapsulated class validates its **own** state rather than relying on client code, **reducing connascence**. Leaking a mutable field breaks this — see [[Defensive Copying (Java)]].

### 3. The Four Access Levels (widest → narrowest)
| Modifier | Class | Package | Subclasses | World |
| :--- | :---: | :---: | :---: | :---: |
| **`public`** | ✔ | ✔ | ✔ | ✔ |
| **`protected`** | ✔ | ✔ | ✔ | ✘ |
| *default* (none) | ✔ | ✔ | ✘ | ✘ |
| **`private`** | ✔ | ✘ | ✘ | ✘ |

- **`public`** ➔ callable from anywhere; use for the intended interface.
- **`protected`** ➔ visible in the same [[Java Packages and Imports|package]] **and** to [[Inheritance (Java)|subclasses]] — "pretty much package public".
- **default (package-private)** ➔ no keyword ➔ visible only within the same package.
- **`private`** ➔ visible only inside the **declaring class**; the default for fields.

## ⚠️ Pitfalls
- 💡 **`protected` on attributes** ➔ discouraged (esp. fields) — it leaks state to every subclass and the whole package, weakening encapsulation; prefer `private` + a `protected`/`public` accessor.
- 💡 **Reflex getters+setters** ➔ auto-generating both for every field re-exposes the state you just hid; add an accessor only when a client needs it.
- 💡 **default ≠ public** ➔ omitting a modifier is **package-private**, not public — a subtle source of "why can't another package see it?".

## 🧠 Active Recall
> [!FAQ]- Why is making a field `private` with a getter better than just making the field `public`?
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** a `private` field + accessor lets the class **mediate** every read/write (validate in a setter, compute in a getter) and change its internal representation later without breaking clients; a `public` field hard-wires the representation into every caller.
> > - **Technical Justification:** **Information hiding ➔ loose coupling** ➔ clients depend on the method signature, not the storage, so internals stay free to change.
