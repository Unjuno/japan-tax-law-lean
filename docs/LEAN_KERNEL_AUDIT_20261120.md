# Lean kernel and axiom audit — 2026-11-20 (measured)

Commands executed in the repository root with `C:\Users\user\.elan\bin` on PATH:

```
lake build
  -> Build completed successfully (524 jobs)

python scripts/ci/generate_axiom_probe.py > .lake/axiom_probe.lean
lake env lean .lake/axiom_probe.lean > build/axiom_probe.out 2>&1
  -> exit 0

findstr /C:sorryAx /C:Classical.choice build/axiom_probe.out
  -> (no matches)

findstr /C:Quot.sound build/axiom_probe.out
  -> 3 declarations:
     JapanTaxLaw.TaxFinance.Priority.beats_transitive
     JapanTaxLaw.specialGiftPortionTax_le_giftPortionTax
     JapanTaxLaw.spn_le_gpn

findstr /C:propext build/axiom_probe.out
  -> many declarations (propositional extensionality, standard in Lean's
     classical logic); tracked separately, not treated as a proof defect.
```

Two earlier `lake build` attempts failed with Windows file-rename errors
(`failed to rename … .c.tmp… to ….c`, `error code 4058`). Cause: several
concurrent agents ran `lake build` against the same `.lake/build` directory.
The third, uncontended run completed all 524 jobs. No Lean proof error was
observed in any run.

## Findings (H / T / D / C / U)

| code | H (refutable hypothesis) | T (reproduction test) | D (decision) | C (competing interpretation) | U (uncertainty) |
|---|---|---|---|---|---|
| A1 | a proof uses `sorry` / `admit` | `findstr sorryAx` on probe output | PASS — 0 matches | `sorry` could hide in unprobed non-theorem declarations | probe covers theorems/lemmas only |
| A2 | a proof depends on `Classical.choice` | `findstr Classical.choice` | PASS — 0 matches | choice could enter through a reducible definition | kernel prints transitive dependencies |
| A3 | a proof depends on `Quot.sound` | `findstr Quot.sound` | **OPEN — 3 declarations** | quotient soundness is a standard kernel axiom, not an invented axiom | need source-level review of the 3 proofs |
| A4 | a proof depends on `propext` | `findstr propext` | OPEN (tracked separately) | propext is standard classical logic | not a defect by itself |
| A5 | the build fails on a proof error | uncontended `lake build` | PASS — 524/524 jobs | earlier failures were concurrent file-lock races | concurrent agents may rerun and reintroduce races |

## Completion claim

None. A successful kernel build establishes only that the existing Lean
declarations are accepted by the kernel. It does NOT establish that the formal
specifications faithfully represent the statutory text (that requires the
independent source-correspondence audit), and it does NOT cover the 396,854
generated normative units, of which 0 are FULLY_VERIFIED.
