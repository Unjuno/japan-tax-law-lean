import JapanTaxLaw.LocalTruckTonnage29500Rate4700

/-! Independent spec for LocalTruckTonnage29500Rate4700: base + rate × saturating excess over threshold. -/

namespace JapanTaxLaw.LocalTruckTonnage29500Rate4700Spec

def specAmount (tons : Nat) : Nat :=
  29500 + 4700 * (if tons <= 8 then 0 else tons - 8)

def agree (tons : Nat) : Prop :=
  specAmount tons = JapanTaxLaw.LocalTruckTonnage29500Rate4700.amount tons

theorem agree_thm (tons : Nat) : agree tons := by
  unfold agree specAmount JapanTaxLaw.LocalTruckTonnage29500Rate4700.amount
  unfold JapanTaxLaw.LocalTruckTonnage29500Rate4700.baseAmount JapanTaxLaw.LocalTruckTonnage29500Rate4700.perUnit JapanTaxLaw.LocalTruckTonnage29500Rate4700.threshold
  by_cases h : tons <= 8
  · simp [h]
  · simp [h]

end JapanTaxLaw.LocalTruckTonnage29500Rate4700Spec
