import JapanTaxLaw.MunicipalTaxQuasiApply
import JapanTaxLaw.MunicipalTaxQuasiApplySpec

/-!
# MunicipalTaxQuasiApplyTests — kernel-decided examples
-/
namespace JapanTaxLaw.MunicipalTaxQuasiApplyTests

open JapanTaxLaw.MunicipalTaxQuasiApply
open JapanTaxLaw.MunicipalTaxQuasiApplySpec

theorem agrees_with_implementation (t : Nat) :
    quasiApplies t = true ↔ quasiScope t := by
  simp [quasiApplies, quasiScope, individualMunicipalTaxCode]

example : individualMunicipalTaxCode = 1 := by decide
example : quasiApplies 1 = true := by decide
example : quasiApplies 2 = false := by decide
example : quasiApplies 0 = false := by decide
example : quasiScope 1 := by unfold quasiScope; decide
example : ¬ quasiScope 2 := by unfold quasiScope; decide

end JapanTaxLaw.MunicipalTaxQuasiApplyTests
