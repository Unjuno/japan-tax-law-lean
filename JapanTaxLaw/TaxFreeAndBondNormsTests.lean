import JapanTaxLaw.TaxFreeAndBondNorms
import JapanTaxLaw.TaxFreeAndBondNormsSpec

/-!
# TaxFreeAndBondNormsTests — 非課税・公債所在
-/
namespace JapanTaxLaw.TaxFreeAndBondNormsTests

open JapanTaxLaw.TaxFreeAndBondNorms

theorem tax_free_spec (a : Nat) :
    taxFree a = JapanTaxLaw.TaxFreeAndBondNormsSpec.taxFreeSpec a := by rfl

theorem share_spec (l p t : Nat) :
    nontaxLimitShare l p t = JapanTaxLaw.TaxFreeAndBondNormsSpec.shareSpec l p t := by rfl

example (a : Nat) : taxFree a = 0 := tax_free_zero a
example : nontaxLimitShare 100 1 0 = none := share_none
example : nontaxLimitShare 100 10 10 = some 100 := share_full
example : bondLocation true = .domestic := bond_domestic
example : bondLocation false = .foreign := bond_foreign
example : taxFreeDeclared = true := tax_free_is_declaration

end JapanTaxLaw.TaxFreeAndBondNormsTests
