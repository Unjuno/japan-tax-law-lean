import JapanTaxLaw.EquivalentAmountNorms
import JapanTaxLaw.EquivalentAmountNormsSpec

/-!
# EquivalentAmountNormsTests — 相当する金額
-/
namespace JapanTaxLaw.EquivalentAmountNormsTests

open JapanTaxLaw.EquivalentAmountNorms

theorem equivalent_spec (b : Nat) :
    equivalentAmount b = JapanTaxLaw.EquivalentAmountNormsSpec.equivalentSpec b := by rfl

example (b : Nat) : equivalentAmount b = b := equivalent_self b
example (b : Nat) : equivalentAmount b = equivalentAmount b := equivalent_refl b
example {a b : Nat} (h : a = b) : equivalentAmount a = equivalentAmount b := equivalent_congr h
example (b : Nat) : 0 <= equivalentAmount b := equivalent_nonneg b
example : equivalentDeclared = true := equivalent_is_declaration

end JapanTaxLaw.EquivalentAmountNormsTests
