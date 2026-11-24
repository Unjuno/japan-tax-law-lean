import JapanTaxLaw.UrbanPlanningTaxCap

/-!
# UrbanPlanningTaxCapSpec — 独立仕様と全称の上限対応証明

The spec restates 「…を超えることができない」 as a negated proposition
(`¬ perMille > 3`) rather than calling the implementation's Bool comparison.
The theorem proves equivalence for ALL Nat. Boundary examples show 3 is
admissible and 4 is not.
-/

namespace JapanTaxLaw.UrbanPlanningTaxCap

/-- 独立仕様: 「上限を超えることができない」を否定命題として定式化。 -/
def specWithinCap (perMille : Nat) : Prop :=
  ¬ perMille > maxPerMille

/-- 実装 ≡ 独立仕様（全称）。 -/
theorem agreeWithinCap (perMille : Nat) :
    (withinCap perMille = true) ↔ specWithinCap perMille := by
  unfold withinCap specWithinCap maxPerMille
  simp

/-- 上限値そのものは許容（境界）。 -/
theorem boundaryAtCap : specWithinCap 3 := by
  unfold specWithinCap maxPerMille
  omega

/-- 上限を一つ超える値は不可（境界）。 -/
theorem boundaryAboveCap : ¬ specWithinCap 4 := by
  unfold specWithinCap maxPerMille
  omega

/-- 実装の具体的境界判定。 -/
example : withinCap 0 = true := by decide
example : withinCap 3 = true := by decide
example : withinCap 4 = false := by decide

end JapanTaxLaw.UrbanPlanningTaxCap
