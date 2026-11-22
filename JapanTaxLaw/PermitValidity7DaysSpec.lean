import JapanTaxLaw.PermitValidity7Days

/-
Independent spec for PermitValidity7Days (酒税法施行規則 第五十条, 七日超).
Defines its own statutory constant 7 (七日) and its own strict-excess test.
No implementation identifier occurs inside the spec* definitions. The two
agreement theorems below are the only place implementation names appear; each
is a pure kernel-checked `unfold ... ; rfl` bridge.
-/

namespace JapanTaxLaw.PermitValidity7Days

/-- Spec-local statutory value: 七日 = 7 days. Independent of impl. -/
def specFloor : Nat := 7

/-- Independent formula: 七日を超える = days > 7, strict. -/
def specNeeds (days : Nat) : Bool :=
  decide (specFloor < days)

/-- Universal, kernel-checked floor bridge. Pure `unfold ... ; rfl`. -/
theorem agreeFloor : validityFloorDays = specFloor := by unfold validityFloorDays specFloor; rfl

/-- Universal, kernel-checked needs bridge. Pure `unfold ... ; rfl`. -/
theorem agreeNeeds (days : Nat) : needsSpecialPermit days = specNeeds days := by
  unfold needsSpecialPermit specNeeds validityFloorDays specFloor
  rfl

end JapanTaxLaw.PermitValidity7Days
