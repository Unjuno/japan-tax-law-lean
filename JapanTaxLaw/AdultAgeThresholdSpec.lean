import JapanTaxLaw.AdultAgeThreshold

/-
Independent spec for AdultAgeThreshold (沖縄の復帰に伴う地方税法等の適用の特別措置等に関する省令 第七条).
Defines its own statutory constant 20 (二十歳) and inclusive >= test; no implementation identifiers.
-/

open JapanTaxLaw.AdultAgeThreshold

namespace JapanTaxLaw.AdultAgeThresholdSpec

def specAge : Nat := 20

def specAdult (age : Nat) : Bool :=
  decide (specAge <= age)

theorem agreeAge : adultAge = specAge := by unfold adultAge specAge; rfl

theorem agreeAdult (age : Nat) : isAdult age = specAdult age := by
  unfold isAdult specAdult adultAge specAge
  rfl

end JapanTaxLaw.AdultAgeThresholdSpec
