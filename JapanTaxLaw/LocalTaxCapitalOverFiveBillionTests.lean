import JapanTaxLaw.LocalTaxCapitalOverFiveBillionSpec

/-!
# LocalTaxCapitalOverFiveBillionTests — kernel-checked checks for 地方税法 第五十二条(1)五

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxCapitalOverFiveBillion

open JapanTaxLaw.TaxFinance

example : capitalThresholdYen = 5_000_000_000 := rfl
example : ¬ exceedsCapitalThreshold 5_000_000_000 := at_threshold
example : exceedsCapitalThreshold 5_000_000_001 := above_threshold
example (c : Money) : exceedsCapitalThreshold c ↔ specExceedsCapitalThreshold c := agree_exceeds_capital c

end JapanTaxLaw.LocalTaxCapitalOverFiveBillion
