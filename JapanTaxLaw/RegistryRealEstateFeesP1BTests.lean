import JapanTaxLaw.RegistryRealEstateFeesP1B

/-!
# RegistryRealEstateFeesP1B tests — kernel-decide smoke（別表第一（一）（六）〜（十））

Decidable smoke tests for the 別表第一（一）（六）〜（十）fee model, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is checked by the kernel (`by decide`). No new theorem names are
introduced here. The taxable base and the case counts are caller-established
inputs; these checks only confirm the integer arithmetic of the model.
-/


namespace JapanTaxLaw.RegistryRealEstateFeesP1B

open JapanTaxLaw.TaxFinance

-- ==== 税率定数・定額の逐語値 ====

example : milleTransferInheritanceOrMerger = 1 := by decide
example : milleTransferOther = 2 := by decide
example : milleRootMortgagePartialTransfer = 2 := by decide
example : milleTrustOwnership = 4 := by decide
example : milleTrustSecurity = 2 := by decide
example : milleTrustOtherRights = 2 := by decide
example : flatFeePerCase = 1_000 := by decide

-- ==== （六）イ/ロ: 千分の一 / 千分の二 ====

example : transferInheritanceOrMergerFee 0 = 0 := by decide
example : transferInheritanceOrMergerFee 999 = 0 := by decide
example : transferInheritanceOrMergerFee 1_000 = 1 := by decide
example : transferInheritanceOrMergerFee 1_001 = 1 := by decide
example : transferInheritanceOrMergerFee 5_000_000_000 = 5_000_000 := by decide
example : transferOtherFee 0 = 0 := by decide
example : transferOtherFee 1_000 = 2 := by decide
example : transferOtherFee 5_000_000_000 = 10_000_000 := by decide

-- ==== （七）: 除した後の金額 × 千分の二 ====

example : rootMortgagePartialTransferFee 0 = 0 := by decide
example : rootMortgagePartialTransferFee 1_000 = 2 := by decide
example : rootMortgagePartialTransferFee 1_001 = 2 := by decide
example : rootMortgagePartialTransferFee 30_000_000 = 60_000 := by decide

-- ==== （八）（九）: 一件につき千円（base を無視） ====

example : mortgageRankChangeFee 0 = 0 := by decide
example : mortgageRankChangeFee 1 = 1_000 := by decide
example : mortgageRankChangeFee 2 = 2_000 := by decide
example : leaseholdPriorityConsentFee 0 = 0 := by decide
example : leaseholdPriorityConsentFee 1 = 1_000 := by decide
example : leaseholdPriorityConsentFee 4 = 4_000 := by decide

-- ==== （十）イ/ロ/ハ: 千分の四 / 千分の二 / 千分の二 ====

example : trustOwnershipFee 0 = 0 := by decide
example : trustOwnershipFee 1_000 = 4 := by decide
example : trustOwnershipFee 100_000_000 = 400_000 := by decide
example : trustSecurityFee 0 = 0 := by decide
example : trustSecurityFee 1_000 = 2 := by decide
example : trustSecurityFee 100_000_000 = 200_000 := by decide
example : trustOtherRightsFee 0 = 0 := by decide
example : trustOtherRightsFee 1_000 = 2 := by decide
example : trustOtherRightsFee 100_000_000 = 200_000 := by decide

-- ==== 统一的な registryFee: 全 8 区分 × base/cases の使い分け ====

example : registryFee .transferInheritanceOrMerger 1_000_000 99 = 1_000 := by decide
example : registryFee .transferOther 1_000_000 99 = 2_000 := by decide
example : registryFee .rootMortgagePartialTransfer 1_000_000 99 = 2_000 := by decide
example : registryFee .mortgageRankChange 999_999 3 = 3_000 := by decide
example : registryFee .leaseholdPriorityConsent 999_999 3 = 3_000 := by decide
example : registryFee .trustOwnership 1_000_000 99 = 4_000 := by decide
example : registryFee .trustSecurity 1_000_000 99 = 2_000 := by decide
example : registryFee .trustOtherRights 1_000_000 99 = 2_000 := by decide

-- flat 型は base に依存しない / 割合型は cases に依存しない
example : registryFee .mortgageRankChange 0 5 = registryFee .mortgageRankChange 10_000_000 5 := by decide
example : registryFee .leaseholdPriorityConsent 0 5 = registryFee .leaseholdPriorityConsent 10_000_000 5 := by decide
example : registryFee .trustOwnership 1_000_000 0 = registryFee .trustOwnership 1_000_000 7 := by decide
example : registryFee .rootMortgagePartialTransfer 1_000_000 0 =
    registryFee .rootMortgagePartialTransfer 1_000_000 7 := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1B
