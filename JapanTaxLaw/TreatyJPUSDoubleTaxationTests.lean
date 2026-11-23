import JapanTaxLaw.TreatyJPUSDoubleTaxation
import JapanTaxLaw.TreatyJPUSDoubleTaxationSpec

/-!
# TreatyJPUSDoubleTaxationTests — 第二十三条（二重課税の除去）
-/
namespace JapanTaxLaw.TreatyJPUSDoubleTaxationTests
open JapanTaxLaw.TreatyJPUSDoubleTaxation

theorem credit_spec (f d : Nat) : foreignTaxCredit f d = JapanTaxLaw.TreatyJPUSDoubleTaxationSpec.foreignTaxCreditSpec f d := by rfl
theorem dividend_spec (p : Nat) : dividendExcluded p = JapanTaxLaw.TreatyJPUSDoubleTaxationSpec.dividendExcludedSpec p := by
  unfold dividendExcluded JapanTaxLaw.TreatyJPUSDoubleTaxationSpec.dividendExcludedSpec
  by_cases h : 10 <= p <;> simp [h]
example (f d : Nat) (h : d <= f) : foreignTaxCredit f d = d := credit_capped_at_domestic f d h
example (f d : Nat) (h : f <= d) : foreignTaxCredit f d = f := credit_when_foreign_less f d h
example (f d : Nat) : foreignTaxCredit f d <= d := credit_never_exceeds_domestic f d
example : dividendExcluded 10 = true := dividend_at_10pct_excluded
example : dividendExcluded 9 = false := dividend_below_10pct_included
example : doubleTaxationDeclared = true := double_taxation_is_declaration

end JapanTaxLaw.TreatyJPUSDoubleTaxationTests
