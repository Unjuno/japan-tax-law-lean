# Quot.sound audit (2026-11-20)

Kernel axiom probe (`#print axioms`) over all named theorems found three
declarations depending on `Quot.sound`:

| declaration | status |
|---|---|
| `JapanTaxLaw.TaxFinance.Priority.beats_transitive` | **RESOLVED** — replaced `omega` by `Nat.lt_trans`; probe now prints "does not depend on any axioms" |
| `JapanTaxLaw.spn_le_gpn` | OPEN |
| `JapanTaxLaw.specialGiftPortionTax_le_giftPortionTax` | OPEN (delegates to `spn_le_gpn`) |

## H/T/D/C/U

- **H**: `omega` on goals containing `Nat` division adds the kernel axiom
  `Quot.sound`; reproduced by `theorem t (x : Nat) : x / 100 ≤ x := by omega`
  followed by `#print axioms t`, which prints `[propext, Quot.sound]`.
- **T**: minimal probe above; `Nat.div_le_self x 100` prints only `[propext]`.
- **D**: `beats_transitive` PASS after the rewrite. The two domination
  theorems remain OPEN.
- **C**: `Quot.sound` is a standard Lean kernel axiom for quotient types, not
  an arbitrary user axiom, so its presence is not by itself a false proof.
- **U**: rewriting the 9 interval branches of `spn_le_gpn` requires replacing
  final `omega` calls with explicit `Nat.div_le_iff_le_mul_add_pred` bounds.
  This is deferred, not hidden.

## Decisive experiment (2026-11-20, follow-up)

A minimal probe isolated the source. In Lean 4, `Nat.div` is defined through a
quotient, so **any** theorem whose proof unfolds a `Nat` division depends on
`Quot.sound`, regardless of the tactic:

```
theorem a (A : Nat) : A / 100 * 100 = A - A % 100 := by omega
-- [propext, Quot.sound]

theorem b (A : Nat) : 100 * (A / 100) = A - A % 100 :=
  Nat.eq_sub_of_add_eq (Nat.div_add_mod A 100)
-- [propext, Quot.sound]   (no omega, no tactic-generated proof at all)
```

`spn`/`gpn` are themselves defined with `/ 100`. Therefore eliminating
`Quot.sound` from `spn_le_gpn` and `specialGiftPortionTax_le_giftPortionTax`
would require redefining those tables without `Nat.div` (e.g. an exact-rational
type), which changes the model and is out of scope of this fix.

**Decision**: `Quot.sound` here is the standard, justified kernel axiom of the
quotient used to define `Nat.div`. It is not a fabricated axiom, not `sorry`,
and not `Classical.choice`. The two declarations are reported as OPEN with
this justification rather than silently accepted or falsely marked resolved.

## Completion claim

None. Two declarations remain with a justified-but-uneliminated standard
kernel axiom; they are reported, not silently accepted.
