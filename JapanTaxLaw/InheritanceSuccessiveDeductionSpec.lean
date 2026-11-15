import JapanTaxLaw.InheritanceSuccessiveDeduction

/-!
# InheritanceSuccessiveDeduction spec — independent statement of art. 20

Source (pinned):
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7

Independent restatement of the art. 20 （相次相続控除） three-factor
discount formula:

  一 r1 = min(1, secondTotalInherited / firstNetEstate)   (cap 100%)
  二 r2 = thisHeir / secondTotalInherited                  (already unbounded here)
  三 r3 = max(0, (10 - gapYears) / 10); gap >= 10 => 0

  deduction = firstTaxPaid × r1 × r2 × r3
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: r1 — cap of 1 (百分の百）, years-1 coarse floor-like. -/
def specSuccessiveRate1 (secondTotalInherited firstNetEstate : Money) : Money :=
  if firstNetEstate = 0 then 1_000_000
  else if secondTotalInherited * 100 ≥ firstNetEstate * 100 then 100_000
  else (secondTotalInherited * 100_000) / firstNetEstate

/-- Spec: r2 — thisHeir / secondTotal (per-100,000). -/
def specSuccessiveRate2 (thisHeir secondTotalInherited : Money) : Money :=
  if secondTotalInherited = 0 then 0
  else (thisHeir * 100_000) / secondTotalInherited

/-- Spec: r3 — max(0, (10 - yearsElapsed)/10) in per-100,000. -/
def specSuccessiveRate3 (yearsElapsed : Nat) : Money :=
  if yearsElapsed >= 10 then 0
  else ((10 - yearsElapsed) * 100_000) / 10

example : specSuccessiveRate1 0 0 = 1_000_000 := by decide
example : specSuccessiveRate1 100 100 = 100_000 := by decide
example : specSuccessiveRate1 200 100 = 100_000 := by decide
example : specSuccessiveRate1 50 100 = 50_000 := by decide

example : specSuccessiveRate2 40 100 = 40_000 := by decide
example : specSuccessiveRate3 2 = 80_000 := by decide
example : specSuccessiveRate3 5 = 50_000 := by decide
example : specSuccessiveRate3 7 = 30_000 := by decide
example : specSuccessiveRate3 10 = 0 := by decide
example : specSuccessiveRate3 11 = 0 := by decide

end JapanTaxLaw
