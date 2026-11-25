import JapanTaxLaw.CustomsFineTrigger10M10x

/-! Independent spec for CustomsFineTrigger10M10x: `¬ 10 * x <= 10000000` (no division). -/

namespace JapanTaxLaw.CustomsFineTrigger10M10xSpec

def specTriggered (x : Nat) : Bool := decide (¬ 10 * x <= 10000000)
def agree (x : Nat) : Prop := specTriggered x = JapanTaxLaw.CustomsFineTrigger10M10x.triggered x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specTriggered JapanTaxLaw.CustomsFineTrigger10M10x.triggered
  unfold JapanTaxLaw.CustomsFineTrigger10M10x.multiplier JapanTaxLaw.CustomsFineTrigger10M10x.threshold
  simp

end JapanTaxLaw.CustomsFineTrigger10M10xSpec
