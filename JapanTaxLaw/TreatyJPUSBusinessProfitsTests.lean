import JapanTaxLaw.TreatyJPUSBusinessProfits
import JapanTaxLaw.TreatyJPUSBusinessProfitsSpec

/-!
# TreatyJPUSBusinessProfitsTests — 第七条（営業利益）
-/
namespace JapanTaxLaw.TreatyJPUSBusinessProfitsTests
open JapanTaxLaw.TreatyJPUSBusinessProfits

theorem taxable_spec (pe : Bool) (p : Nat) :
    taxableInOther pe p = JapanTaxLaw.TreatyJPUSBusinessProfitsSpec.taxableInOtherSpec pe p := by rfl
theorem attributed_spec (h : Nat) :
    attributedProfit h = JapanTaxLaw.TreatyJPUSBusinessProfitsSpec.attributedProfitSpec h := rfl
example (p : Nat) : taxableInOther false p = false := no_pe_no_other_tax p
example : taxableInOther true 0 = false := pe_zero_no_other_tax
example (p : Nat) (h : p > 0) : taxableInOther true p = true := pe_positive_other_tax p h
example (h : Nat) : attributedProfit h = h := attributed_is_hypothetical h
example : merePurchaseAttribution = 0 := mere_purchase_no_profit
example (f : Bool) : deductible f = f := deduction_independent_of_location f
example : businessProfitsDeclared = true := business_profits_is_declaration

end JapanTaxLaw.TreatyJPUSBusinessProfitsTests
