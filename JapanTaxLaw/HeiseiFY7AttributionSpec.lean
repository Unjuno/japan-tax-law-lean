import JapanTaxLaw.HeiseiFY7Attribution

/-
# HeiseiFY7AttributionSpec — independent restatement of 平成7年度所属の歳入

Pinned source: law 408AC0000000002, revision 408AC0000000002_19960223_000000000000000.
Independent restatement: the attributed fiscal year is 7 (平成七年度), and
the revenue belongs to exactly that year: `specFY = 7`,
`specBelongs fy = decide (fy == specFY)`.
This module owns its own `specFY` / `specBelongs`; no implementation identifier
(attributedFY / belongsToAttributedFY) occurs in any independent definition body.
The only bridges are the kernel-checked agree* below, each a pure unfold/rfl.
-/

namespace JapanTaxLaw.HeiseiFY7Attribution

/-- Independent 平成七年度 = 7. -/
def specFY : Nat := 7

/-- Independent: revenue belongs to exactly fiscal year 7. -/
def specBelongs (fy : Nat) : Bool := decide (fy == specFY)

theorem agreeFY : attributedFY = specFY := by unfold attributedFY specFY; rfl

theorem agreeBelongs (fy : Nat) : belongsToAttributedFY fy = specBelongs fy := by
  unfold belongsToAttributedFY specBelongs attributedFY specFY
  rfl

end JapanTaxLaw.HeiseiFY7Attribution
