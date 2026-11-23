import JapanTaxLaw.BondRevenueFiscalYear

/-
# BondRevenueFiscalYearSpec — independent restatement of 昭和51年度所属の歳入

Pinned source: law 352AC0000000035, revision 352AC0000000035_19770504_000000000000000.
Independent restatement: the attributed fiscal year is 51 (昭和五十一年度), and
the revenue belongs to exactly that year: `specFY = 51`,
`specBelongs fy = decide (fy == specFY)`.
This module owns its own `specFY` / `specBelongs`; no implementation identifier
(attributedFY / belongsToAttributedFY) occurs in any independent definition body.
The only bridges are the kernel-checked agree* below, each a pure unfold/rfl.
-/

namespace JapanTaxLaw.BondRevenueFiscalYear

/-- Independent 昭和五十一年度 = 51. -/
def specFY : Nat := 51

/-- Independent: revenue belongs to exactly fiscal year 51. -/
def specBelongs (fy : Nat) : Bool := decide (fy == specFY)

theorem agreeFY : attributedFY = specFY := by unfold attributedFY specFY; rfl

theorem agreeBelongs (fy : Nat) : belongsToAttributedFY fy = specBelongs fy := by
  unfold belongsToAttributedFY specBelongs attributedFY specFY
  rfl

end JapanTaxLaw.BondRevenueFiscalYear
