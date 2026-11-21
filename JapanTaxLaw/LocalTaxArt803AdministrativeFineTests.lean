import JapanTaxLaw.LocalTaxArt803AdministrativeFineSpec

/-!
# LocalTaxArt803AdministrativeFineTests — kernel-checked checks for 地方税法 第八百三条
-/

namespace JapanTaxLaw.LocalTaxArt803AdministrativeFine

open JapanTaxLaw.TaxFinance

example : maxAdministrativeFineYen = 100_000 := rfl
example : withinFineLimit 100_000 := at_ceiling
example : ¬ withinFineLimit 100_001 := above_ceiling
example (f : Money) : withinFineLimit f ↔ specWithinFineLimit f := agree_fine_limit f

end JapanTaxLaw.LocalTaxArt803AdministrativeFine
