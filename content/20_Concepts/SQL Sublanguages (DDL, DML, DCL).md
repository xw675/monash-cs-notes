---
unit: FIT2094
parent: "[[Relational Model]]"
tags: [CS/Databases, SQL/Oracle, Monash/CS_DS]
aliases: [DDL, DML, DCL]
---
# [[SQL Sublanguages (DDL, DML, DCL)]]

**Context:** [[FIT2094_MOC]] · SQL split by *what it acts on* · structure (DDL) vs data (DML) vs access (DCL) · the physical-design language on [[Database Design Life Cycle|Oracle]]

> [!abstract] Quick Revision
> - **🎯 Objective:** classify every SQL statement as DDL / DML / DCL ➔ predict its keywords **and** its commit behaviour.
> - **⚡ Critical Bottleneck:** DDL **auto-commits** (permanent on execution); DML is transactional (`COMMIT`/`ROLLBACK`) — never write `COMMIT` for DDL.

## 📝 Core
- **DDL — define structure** ➔ `CREATE`, `ALTER`, `DROP` on tables/constraints; **auto-committed immediately**, no `COMMIT`/`ROLLBACK`.
- **DML — change/read data** ➔ `INSERT`, `UPDATE`, `DELETE` (writes) + `SELECT` (read); writes are **not saved** until `COMMIT`, reversible by `ROLLBACK`.
- **DCL — manage access** ➔ `GRANT`, `REVOKE` object privileges to users, e.g. `GRANT SELECT ON customer TO abc001;`.
- **SELECT is inert** ➔ `SELECT * FROM unit;` changes neither structure nor data.

## ⚠️ Pitfalls
- 💡 **Never `COMMIT`/`ROLLBACK` a DDL statement** ➔ DDL is already permanent on execution; adding a transaction control command is wrong for this unit.
- 💡 **`DELETE` (DML) ≠ `DROP` (DDL)** ➔ `DELETE` removes rows (reversible pre-commit); `DROP` removes the table structure (auto-committed).

## 🧠 Active Recall
> [!FAQ]- Why can you `ROLLBACK` an `INSERT` but not a `CREATE TABLE`?
> > [!SUCCESS]- Answer
> > - **Direct Criterion:** `INSERT` is DML — pending until `COMMIT`, so reversible; `CREATE TABLE` is DDL — auto-committed on execution.
> > - **Technical Justification:** **Transaction boundary** ➔ DDL implicitly commits the current transaction, discarding any rollback point.
