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

## Completion claim

None. Two declarations remain with a justified-but-uneliminated standard
kernel axiom; they are reported, not silently accepted.
