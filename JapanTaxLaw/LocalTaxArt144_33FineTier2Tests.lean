import JapanTaxLaw.LocalTaxArt144_33FineTier2Spec

/-!
# LocalTaxArt144_33FineTier2Tests — kernel-checked checks for 地方税法 第百四十四条の三十三(6)2
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier2

open JapanTaxLaw.TaxFinance

example : maxFineYen = 200_000_000 := rfl
example : withinFineLimit 200_000_000 := at_ceiling
example : ¬ withinFineLimit 200_000_001 := above_ceiling
example (f : Money) : withinFineLimit f ↔ specWithinFineLimit f := agree_fine_limit f

end JapanTaxLaw.LocalTaxArt144_33FineTier2
