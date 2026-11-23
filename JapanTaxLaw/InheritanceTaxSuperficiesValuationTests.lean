import JapanTaxLaw.InheritanceTaxSuperficiesValuation
import JapanTaxLaw.InheritanceTaxSuperficiesValuationSpec

/-!
# InheritanceTaxSuperficiesValuationTests — 相続税法 第二十三条（実質的証明）
-/
namespace JapanTaxLaw.InheritanceTaxSuperficiesValuationTests
open JapanTaxLaw.InheritanceTaxSuperficiesValuation

theorem rate_spec (y : Nat) (b : Bool) : rateForPeriod y b = JapanTaxLaw.InheritanceTaxSuperficiesValuationSpec.rateForPeriodSpec y b := by rfl
example (y : Nat) (h : y <= 10) : rateForPeriod y false = 5 := band_le10 y h
example (y : Nat) (h1 : 10 < y) (h2 : y <= 15) : rateForPeriod y false = 10 := band_11_15 y h1 h2
example (y : Nat) (h1 : 25 < y) (h2 : y <= 30) : rateForPeriod y false = 40 := band_25_30_object y h1 h2
example : rateForPeriod 0 true = 40 := band_indefinite
example (y : Nat) (h : 50 < y) : rateForPeriod y false = 90 := band_over50_object y h
example : superficiesValuationDeclared = true := superficies_valuation_is_declaration

end JapanTaxLaw.InheritanceTaxSuperficiesValuationTests
