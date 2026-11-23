import JapanTaxLaw.DisasterTaxReliefArt8DelegationSpec

/-!
# DisasterTaxReliefArt8DelegationTests — kernel-checked checks

Verifies DELEGATION 「前項に定めるもののほか、同項の規定の適用に関し必要な事項は、政令で定める。」: target is Cabinet Order; residual scope predicate.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt8Delegation

example : delegatedTarget = DelegationTarget.cabinetOrder := target_is_cabinet_order
example : isDelegatedMatter false true = true := necessary_residual_is_delegated
example : isDelegatedMatter true true = false := prescribed_not_delegated
example : isDelegatedMatter false false = false := unnecessary_not_delegated
example : SpecDelegatedMatter false true := spec_residual
example : (isDelegatedMatter false true = true) ↔ SpecDelegatedMatter false true := agree_residual
example : delegatedTarget = DelegationTarget.cabinetOrder := spec_target

end JapanTaxLaw.DisasterTaxReliefArt8Delegation
