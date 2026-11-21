import JapanTaxLaw.LocalTaxArt144_33FineTier1Spec

/-!
# LocalTaxArt144_33FineTier1Tests — kernel-checked checks for 地方税法 第百四十四条の三十三(6)1
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier1

open JapanTaxLaw.TaxFinance

example : maxFineYen = 300_000_000 := rfl
example : withinFineLimit 300_000_000 := at_ceiling
example : ¬ withinFineLimit 300_000_001 := above_ceiling
example (f : Money) : withinFineLimit f ↔ specWithinFineLimit f := agree_fine_limit f

end JapanTaxLaw.LocalTaxArt144_33FineTier1
