import JapanTaxLaw.TreatyJPUSCoveredTax
import JapanTaxLaw.TreatyJPUSCoveredTaxSpec

/-!
# TreatyJPUSCoveredTaxTests — 条約第二条（L3 別層）
-/
namespace JapanTaxLaw.TreatyJPUSCoveredTaxTests

open JapanTaxLaw.TreatyJPUSCoveredTax

example (x : Nat) (xs : List Nat) : inTaxList x (x :: xs) = true := in_list_hit x xs
example (x : Nat) : inTaxList x [] = false := in_list_empty x
example (l : Bool) : treatyApplies true l = true := applies_when_listed l
example (l : Bool) : treatyApplies l true = true := applies_when_successor l
example : treatyApplies false false = false := no_apply
example (a b : Bool) : treatyApplies a b = treatyApplies b a := applies_comm a b
example : coveredTaxDeclared = true := covered_tax_is_declaration

end JapanTaxLaw.TreatyJPUSCoveredTaxTests
