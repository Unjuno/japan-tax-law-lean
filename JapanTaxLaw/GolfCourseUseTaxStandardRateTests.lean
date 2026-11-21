import JapanTaxLaw.GolfCourseUseTaxStandardRateSpec

/-!
# GolfCourseUseTaxStandardRateTests — kernel-checked checks for 地方税法 第七十六条(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.GolfCourseUseTaxStandardRate

open JapanTaxLaw.TaxFinance

example : standardRateYenPerPersonPerDay = 800 := rfl
example : standardTaxYen 1 1 = 800 := rfl
example : standardTaxYen 2 3 = 4800 := by decide
example (p d : Money) : standardTaxYen p d = specTaxYen p d := agree_standard_tax p d
example (k : Money) : standardRateYenPerPersonPerDay * k =
    Nat.rec 0 (fun _ acc => acc + standardRateYenPerPersonPerDay) k := mul_eq_accumulate k

end JapanTaxLaw.GolfCourseUseTaxStandardRate
