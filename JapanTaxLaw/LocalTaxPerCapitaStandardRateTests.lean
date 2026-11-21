import JapanTaxLaw.LocalTaxPerCapitaStandardRateSpec

/-!
# LocalTaxPerCapitaStandardRateTests — kernel-checked checks for 地方税法 第三百十条
-/

namespace JapanTaxLaw.LocalTaxPerCapitaStandardRate

open JapanTaxLaw.TaxFinance

example : standardRateYen = 3_000 := rfl
example : standardTaxYen 1 = 3_000 := rfl
example : standardTaxYen 2 = 6_000 := by decide
example (p : Money) : standardTaxYen p = specTaxYen p := agree_tax p
example (k : Money) : standardRateYen * k =
    Nat.rec 0 (fun _ acc => acc + standardRateYen) k := mul_eq_accumulate k

end JapanTaxLaw.LocalTaxPerCapitaStandardRate
