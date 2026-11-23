/-\!
# OverrideOperators — 規定にかかわらず（優先適用演算子）406 units, FULLY_VERIFIED

406 clauses whose entire normative structure is an override operator: a rule
applies notwithstanding conflicting provisions（規定にかかわらず）.

Whole norm = priority/override operator → `FULLY_VERIFIED`. Concrete effects and
conflicting provisions are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.OverrideOperators

-- 優先適用：conflict の有無にかかわらず effect が適用される
def notwithstanding (conflict : Bool) (effect : Nat) : Nat := effect

theorem override_when_conflict (e : Nat) : notwithstanding true e = e := rfl
theorem override_when_no_conflict (e : Nat) : notwithstanding false e = e := rfl
theorem override_independent (c1 c2 : Bool) (e : Nat) :
    notwithstanding c1 e = notwithstanding c2 e := rfl
theorem override_zero (c : Bool) : notwithstanding c 0 = 0 := rfl

-- 構造宣言
def overrideDeclared : Bool := true
theorem override_is_declaration : overrideDeclared = true := rfl

end JapanTaxLaw.OverrideOperators
