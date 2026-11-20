import JapanTaxLaw.ProfitBusinessDelegation
import JapanTaxLaw.ProfitBusinessDelegationSpec

/-!
# ProfitBusinessDelegationTests — kernel-decided examples
-/
namespace JapanTaxLaw.ProfitBusinessDelegationTests

open JapanTaxLaw.ProfitBusinessDelegation
open JapanTaxLaw.ProfitBusinessDelegationSpec

theorem agrees_with_implementation :
    delegatedAuthorityCode = specCabinetOrder ∧
    (scopeFixedByThisAct = true ↔ specScopeFixedByAct) := by
  simp [delegatedAuthorityCode, cabinetOrderCode, specCabinetOrder,
        scopeFixedByThisAct, specScopeFixedByAct]

example : delegatedAuthorityCode = 1 := by rfl
example : delegatedAuthorityCode = cabinetOrderCode := by rfl
example : scopeFixedByThisAct = false := by rfl
example : cabinetOrderCode != ministryOrdinanceCode := by decide

end JapanTaxLaw.ProfitBusinessDelegationTests
