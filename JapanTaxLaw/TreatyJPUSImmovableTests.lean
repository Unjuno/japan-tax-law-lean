import JapanTaxLaw.TreatyJPUSImmovable
import JapanTaxLaw.TreatyJPUSImmovableSpec

/-!
# TreatyJPUSImmovableTests — 条約第六条（L3 別層）
-/
namespace JapanTaxLaw.TreatyJPUSImmovableTests

open JapanTaxLaw.TreatyJPUSImmovable

example (p r : State) (h : p != r) : sourceMayTax p r = true := source_state_taxes p r h
example (s : State) : sourceMayTax s s = false := residence_state_no_source_tax s
example (k : Nat) (ks : List Nat) (h : k ∉ ks) : isImmovable k ks = false := ship_not_immovable k ks h
example : immovableDeclared = true := immovable_is_declaration

end JapanTaxLaw.TreatyJPUSImmovableTests
