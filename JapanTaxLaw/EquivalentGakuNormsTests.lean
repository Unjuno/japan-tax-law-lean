import JapanTaxLaw.EquivalentGakuNorms
import JapanTaxLaw.EquivalentGakuNormsSpec

/-!
# EquivalentGakuNormsTests — 相当する額
-/
namespace JapanTaxLaw.EquivalentGakuNormsTests

open JapanTaxLaw.EquivalentGakuNorms

theorem gaku_spec (b : Nat) :
    equivalentGaku b = JapanTaxLaw.EquivalentGakuNormsSpec.equivalentGakuSpec b := by rfl
example (b : Nat) : equivalentGaku b = b := gaku_self b
example {a b : Nat} (h : a = b) : equivalentGaku a = equivalentGaku b := gaku_congr h
example (b : Nat) : 0 <= equivalentGaku b := gaku_nonneg b
example : equivalentGaku 0 = 0 := gaku_zero
example : gakuDeclared = true := gaku_is_declaration

end JapanTaxLaw.EquivalentGakuNormsTests
