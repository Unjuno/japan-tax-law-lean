import JapanTaxLaw.TreatyJPIndiaScopeTaxes
import JapanTaxLaw.TreatyJPIndiaScopeTaxesSpec

/-!
# TreatyJPIndiaScopeTaxesTests
-/
namespace JapanTaxLaw.TreatyJPIndiaScopeTaxesTests
open JapanTaxLaw.TreatyJPIndiaScopeTaxes

theorem scope_spec (a b : Bool) : inScope a b = JapanTaxLaw.TreatyJPIndiaScopeTaxesSpec.inScopeSpec a b := by rfl
theorem covered_spec (l s : Bool) : coveredTax l s = JapanTaxLaw.TreatyJPIndiaScopeTaxesSpec.coveredTaxSpec l s := by rfl
example : inScope true false = true := jp_resident_in_scope
example : inScope false true = true := other_resident_in_scope
example : inScope false false = false := neither_not_in_scope
example : coveredTax true false = true := listed_tax_covered
example : coveredTax false true = true := successor_tax_covered
example : coveredTax false false = false := unrelated_tax_not_covered
example : scopeTaxesDeclared = true := scope_taxes_is_declaration

end JapanTaxLaw.TreatyJPIndiaScopeTaxesTests
