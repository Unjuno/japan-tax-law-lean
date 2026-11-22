import JapanTaxLaw.TaxCreditNorms
import JapanTaxLaw.TaxCreditNormsSpec

/-!
# TaxCreditNormsTests — 税額控除
-/
namespace JapanTaxLaw.TaxCreditNormsTests

open JapanTaxLaw.TaxCreditNorms

theorem credit_spec (t c : Nat) :
    applyCredit t c = JapanTaxLaw.TaxCreditNormsSpec.creditSpec t c := by rfl

theorem unused_spec (t c : Nat) :
    unusedCredit t c = JapanTaxLaw.TaxCreditNormsSpec.unusedSpec t c := by rfl

theorem dividend_spec (d r : Nat) :
    dividendCredit d r = JapanTaxLaw.TaxCreditNormsSpec.dividendSpec d r := by rfl

example (t c : Nat) (h : c <= t) : applyCredit t c = c := credit_under t c h
example (t c : Nat) (h : t < c) : applyCredit t c = t := credit_over t c h
example (t c : Nat) (h : c <= t) : unusedCredit t c = 0 := unused_when_covered t c h
example (r : Nat) : dividendCredit 0 r = 0 := dividend_zero r
example : creditDeclared = true := credit_is_declaration

end JapanTaxLaw.TaxCreditNormsTests
