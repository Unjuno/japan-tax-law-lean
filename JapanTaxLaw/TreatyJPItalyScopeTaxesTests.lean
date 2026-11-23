import JapanTaxLaw.TreatyJPItalyScopeTaxes
import JapanTaxLaw.TreatyJPItalyScopeTaxesSpec

/-!
# TreatyJPItalyScopeTaxesTests — 日伊 第一条・第二条
-/
namespace JapanTaxLaw.TreatyJPItalyScopeTaxesTests
open JapanTaxLaw.TreatyJPItalyScopeTaxes

theorem scope_spec (a b : Bool) : inScope a b = JapanTaxLaw.TreatyJPItalyScopeTaxesSpec.inScopeSpec a b := by rfl
theorem covered_spec (l s : Bool) : coveredTax l s = JapanTaxLaw.TreatyJPItalyScopeTaxesSpec.coveredTaxSpec l s := by rfl
example : inScope true false = true := jp_resident_in_scope
example : inScope false true = true := it_resident_in_scope
example : inScope false false = false := neither_not_in_scope
example : coveredTax true false = true := listed_tax_covered
example : coveredTax false true = true := successor_tax_covered
example : coveredTax false false = false := unrelated_tax_not_covered
example : italyScopeTaxesDeclared = true := italy_scope_taxes_is_declaration

end JapanTaxLaw.TreatyJPItalyScopeTaxesTests
