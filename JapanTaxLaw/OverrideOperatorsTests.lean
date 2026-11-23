import JapanTaxLaw.OverrideOperators
import JapanTaxLaw.OverrideOperatorsSpec

/-!
# OverrideOperatorsTests — 優先適用演算子
-/
namespace JapanTaxLaw.OverrideOperatorsTests

open JapanTaxLaw.OverrideOperators

theorem spec_agreement (c : Bool) (e : Nat) :
    notwithstanding c e = JapanTaxLaw.OverrideOperatorsSpec.overrideSpec c e := by
  cases c <;> rfl
example (e : Nat) : notwithstanding true e = e := override_when_conflict e
example (e : Nat) : notwithstanding false e = e := override_when_no_conflict e
example (c1 c2 : Bool) (e : Nat) : notwithstanding c1 e = notwithstanding c2 e := override_independent c1 c2 e
example (c : Bool) : notwithstanding c 0 = 0 := override_zero c
example : overrideDeclared = true := override_is_declaration

end JapanTaxLaw.OverrideOperatorsTests
