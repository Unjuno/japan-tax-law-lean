import JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtExceptionSpec

/-!
# InheritanceTaxArt13ResidualAssetDebtExceptionTests — kernel-checked checks

Verifies EXCEPTION 「前二号に掲げる債務を除くほか、その財産の取得、維持又は管理のために生じた債務」: residual asset debt selected; items 1/2 excluded.
-/

namespace JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException

example : isResidualAssetDebt DebtCategory.residualAssetDebt = true := residual_selected
example : isResidualAssetDebt DebtCategory.item1Debt = false := item1_excluded
example : isResidualAssetDebt DebtCategory.item2Debt = false := item2_excluded
example : isResidualAssetDebt DebtCategory.other = false := other_not_selected
example : SpecResidualAssetDebt DebtCategory.residualAssetDebt := implementation_satisfies_spec
example : ¬ SpecResidualAssetDebt DebtCategory.item1Debt := item1_not_satisfying

end JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException
