import JapanTaxLaw.LocalTruckTonnage40500Rate6300

/-! Independent spec for LocalTruckTonnage40500Rate6300: base + rate × saturating excess over threshold. -/

namespace JapanTaxLaw.LocalTruckTonnage40500Rate6300Spec

def specAmount (tons : Nat) : Nat :=
  40500 + 6300 * (if tons <= 8 then 0 else tons - 8)

def agree (tons : Nat) : Prop :=
  specAmount tons = JapanTaxLaw.LocalTruckTonnage40500Rate6300.amount tons

theorem agree_thm (tons : Nat) : agree tons := by
  unfold agree specAmount JapanTaxLaw.LocalTruckTonnage40500Rate6300.amount
  unfold JapanTaxLaw.LocalTruckTonnage40500Rate6300.baseAmount JapanTaxLaw.LocalTruckTonnage40500Rate6300.perUnit JapanTaxLaw.LocalTruckTonnage40500Rate6300.threshold
  by_cases h : tons <= 8
  · simp [h]
  · simp [h]

end JapanTaxLaw.LocalTruckTonnage40500Rate6300Spec
