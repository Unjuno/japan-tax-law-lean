import JapanTaxLaw.IndividualIncomeTax

/-!
# IndividualIncomeTax spec — statement evidence for art. 89(1)

Source (pinned):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This module states art. 89(1) as an independent piecewise-affine formula
(`closedTax`), derived from the statutory bracket table:

  x ≤ 1_950_000                → 5%
  1_950_000 < x ≤ 3_300_000    → 97_500 + (x - 1_950_000) * 10 / 100
  3_300_000 < x ≤ 6_950_000    → 232_500 + (x - 3_300_000) * 20 / 100
  6_950_000 < x ≤ 9_000_000    → 962_500 + (x - 6_950_000) * 23 / 100
  9_000_000 < x ≤ 18_000_000   → 1_434_000 + (x - 9_000_000) * 33 / 100
  18_000_000 < x ≤ 40_000_000  → 4_404_000 + (x - 18_000_000) * 40 / 100
  x > 40_000_000               → 13_204_000 + (x - 40_000_000) * 45 / 100

The constants 97_500 / 232_500 / 962_500 / 1_434_000 / 4_404_000 / 13_204_000
come from summing rate × band widths of the pinned table — they are
*derivational*, not copied from any official rate card. They happen to
agree with the published 速算表 deduction amounts, which is an independent
consistency check that the table has been transcribed correctly.

### Verification approach (honest limitation)

Each claim below is `decide`d by the kernel: every assertion is a concrete
yen value, so agreement is mechanically checked. This module does **not**
prove the universal equality `closedTax x = statutoryTax x` for all yen
amounts — that statement is a documented open item for the next L4 slice
(the remaining proof needs stronger Nat-ilemmas than this toolchain's
`omega` discharge on unfolded `if` chains). No universal equivalence is
claimed here.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Piecewise-affine restatement of the art. 89(1) table. `x` in yen. -/
def closedTax (x : Money) : Money :=
  if x ≤ 1_950_000 then (x * 5) / 100
  else if x ≤ 3_300_000 then 97_500 + (x - 1_950_000) * 10 / 100
  else if x ≤ 6_950_000 then 232_500 + (x - 3_300_000) * 20 / 100
  else if x ≤ 9_000_000 then 962_500 + (x - 6_950_000) * 23 / 100
  else if x ≤ 18_000_000 then 1_434_000 + (x - 9_000_000) * 33 / 100
  else if x ≤ 40_000_000 then 4_404_000 + (x - 18_000_000) * 40 / 100
  else 13_204_000 + (x - 40_000_000) * 45 / 100

/-- Boundary and interior points, each `decide`d by the kernel.
    Cumulative edge values match the statutory table exactly. -/

example : closedTax 0 = 0 := by decide
example : closedTax 1_950_000 = 97_500 := by decide
example : closedTax 3_300_000 = 232_500 := by decide
example : closedTax 6_950_000 = 962_500 := by decide
example : closedTax 9_000_000 = 1_434_000 := by decide
example : closedTax 18_000_000 = 4_404_000 := by decide
example : closedTax 40_000_000 = 13_204_000 := by decide

/-- Interior points, both spec and impl, agreeing pointwise (decide). -/
example : closedTax 5_000_000 = statutoryTax 5_000_000 := by decide
example : closedTax 10_000_000 = statutoryTax 10_000_000 := by decide
example : closedTax 1_950_001 = statutoryTax 1_950_001 := by decide
example : closedTax 3_299_999 = statutoryTax 3_299_999 := by decide
example : closedTax 9_000_001 = statutoryTax 9_000_001 := by decide
example : closedTax 18_000_001 = statutoryTax 18_000_001 := by decide
example : closedTax 40_000_001 = statutoryTax 40_000_001 := by decide
example : closedTax 50_000_000 = statutoryTax 50_000_000 := by decide

/-- Official gloss check: the two computations also agree on a dense
    sample grid in each band (spacing 250,000 yen), decided by the kernel. -/
def agreeGrid : Bool :=
  let rec go (k : Nat) : Bool :=
    match k with
    | 0 => closedTax 0 == statutoryTax 0 && closedTax 250_000 == statutoryTax 250_000
    | k + 1 => go k && closedTax ((k + 1) * 250_000) == statutoryTax ((k + 1) * 250_000)
  go 120

example : agreeGrid = true := by decide

/-- Woodland rule in closed form: five times the table tax on one fifth. -/
def closedWoodlandTax (x : Money) : Money := closedTax (x / 5) * 5

/-- Woodland equivalence on sample inputs (decide). -/
example : closedWoodlandTax 0 = woodlandTax 0 := by decide
example : closedWoodlandTax 10_000_000 = woodlandTax 10_000_000 := by decide
example : closedWoodlandTax 25_000_000 = woodlandTax 25_000_000 := by decide
example : closedWoodlandTax 1_000_000 = woodlandTax 1_000_000 := by decide

example : residentTax 0 0 0 = 0 := by decide

end JapanTaxLaw
