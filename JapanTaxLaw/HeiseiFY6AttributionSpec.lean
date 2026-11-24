import JapanTaxLaw.HeiseiFY6Attribution

/-
# HeiseiFY6AttributionSpec — independent restatement of 平成6年度所属の歳入

Pinned source: law 406AC0000000108, revision 406AC0000000108_20070401_419AC0000000023.
Independent restatement: the attributed fiscal year is 6 (平成六年度), and
revenue belongs to exactly that year: `specFY = 6`,
`specBelongs fy = decide (fy == specFY)`.
This module owns its own `specFY` / `specBelongs`; no implementation identifier
(attributedFY / belongsToAttributedFY) occurs in any independent definition body.
The only bridges are the kernel-checked agree* below, each a pure unfold/rfl.
-/

namespace JapanTaxLaw.HeiseiFY6Attribution

/-- Independent 平成六年度 = 6. -/
def specFY : Nat := 6

/-- Independent: revenue belongs to exactly fiscal year 6. -/
def specBelongs (fy : Nat) : Bool := decide (fy == specFY)

theorem agreeFY : attributedFY = specFY := by unfold attributedFY specFY; rfl

theorem agreeBelongs (fy : Nat) : belongsToAttributedFY fy = specBelongs fy := by
  unfold belongsToAttributedFY specBelongs attributedFY specFY
  rfl

end JapanTaxLaw.HeiseiFY6Attribution
