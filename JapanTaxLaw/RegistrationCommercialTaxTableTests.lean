import JapanTaxLaw.RegistrationCommercialTaxTable

/-!
# RegistrationCommercialTaxTable tests — 別表第一（二）第二十四号（一）イ〜チ smoke checks

Decidable smoke tests for the registration fiscal-item models, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each example covers an item's floor/3万/6万 boundary or a merged portion edge.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- ロ: 申請件数一件につき六万円（固定額）
example : gmporGeneralFormationTax = 60_000 := by decide

-- ハ: 資本金の額千分の七、六万円以下なら六万円
example : goudoushaFormationTax 0 = 60_000 := by decide
example : goudoushaFormationTax 8_000_000_000 = 56_000_000 := by decide
example : goudoushaFormationTax 9_000_000_000 = 63_000_000 := by decide
example : goudoushaFormationTax 10_000_000_000 = 70_000_000 := by decide

-- ニ: 増加した資本金の額千分の七、三万円以下なら三万円
example : capitalIncreaseTax 0 = 30_000 := by decide
example : capitalIncreaseTax 4_000_000_000 = 28_000_000 := by decide
example : capitalIncreaseTax 5_000_000_000 = 35_000_000 := by decide
example : capitalIncreaseTax 10_000_000_000 = 70_000_000 := by decide

-- ト: 資本金の額千分の七、三万円以下なら三万円
example : newDivisionalFormationTax 0 = 30_000 := by decide
example : newDivisionalFormationTax 5_000_000_000 = 35_000_000 := by decide
example : newDivisionalFormationTax 10_000_000_000 = 70_000_000 := by decide

-- チ: 増加した資本金の額千分の七、三万円以下なら三万円
example : absorptionDivisionIncreaseTax 0 = 30_000 := by decide
example : absorptionDivisionIncreaseTax 5_000_000_000 = 35_000_000 := by decide
example : absorptionDivisionIncreaseTax 10_000_000_000 = 70_000_000 := by decide

-- ホ: 資本金の額千分の一・五（直前額を超える部分は千分の七）、三万円以下なら三万円
example : newMergerFormationTax 0 0 = 30_000 := by decide
example : newMergerFormationTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide
example : newMergerFormationTax 5_000_000_000 5_000_000_000 = 7_500_000 := by decide
example : newMergerFormationTax 7_000_000_000 5_000_000_000 = 7_500_000 + 14_000_000 := by decide
-- 直前資本金ゼロ（直前における資本金の額として財務省令で定めるものを超えるすべて）は千分の七
example : newMergerFormationTax 1_000_000_000 0 = 7_000_000 := by decide

-- ヘ: 増加した資本金の額千分の一・五（直前額を超える部分は千分の七）、三万円以下なら三万円
example : absorptionMergerIncreaseTax 0 0 = 30_000 := by decide
example : absorptionMergerIncreaseTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide
example : absorptionMergerIncreaseTax 7_000_000_000 5_000_000_000 = 7_500_000 + 14_000_000 := by decide

-- リ: 相互会社の設立の登記は固定 ¥300,000
example : mutualCompanyFormationFee = 300_000 := by decide
-- ヌ: 新株予約権の発行による変更の登記は固定 ¥90,000
example : shareSubscriptionModificationFee = 90_000 := by decide
-- ル: 支店又は従たる事務所の設置の登記は、各 ¥60,000
example : branchInstallationFee 0 = 0 := by decide
example : branchInstallationFee 1 = 60_000 := by decide
example : branchInstallationFee 2 = 120_000 := by decide
-- ヲ: 本店若しくは主たる事務所又は支店若しくは従たる事務所の移転の登記は、各 ¥30,000
example : relocationFee 0 = 0 := by decide
example : relocationFee 1 = 30_000 := by decide
example : relocationFee 3 = 90_000 := by decide
-- ワ: 役員会等事項の変更の登記は固定 ¥30,000
example : boardMattersModificationFee = 30_000 := by decide
-- カ: 役員等の事項の変更の登記は ¥30,000（資本金が一億円以下の場合は ¥10,000）
example : directorMattersModificationFee 0 = 10_000 := by decide
example : directorMattersModificationFee 50_000_000 = 10_000 := by decide
example : directorMattersModificationFee 100_000_000 = 10_000 := by decide
example : directorMattersModificationFee 100_000_001 = 30_000 := by decide
example : directorMattersModificationFee 1_000_000_000 = 30_000 := by decide
-- ヨ: 支配人の選任の登記又はその代理権の消滅の登記は固定 ¥30,000
example : representativeAttachmentFee = 30_000 := by decide

-- タ: 職務執行の停止・職務代行者の選任等は ¥30,000
example : officerSuspensionFee = 30_000 := by decide
-- レ: 解散の登記は ¥30,000
example : dissolutionFee = 30_000 := by decide
-- ソ: 継続・回復・設立無効取消しの登記は ¥30,000
example : companyContinuationFee = 30_000 := by decide
-- ツ: 登記事項の変更、消滅又は廃止の登記（イ〜ソを除く）は ¥30,000
example : residualRegistrationModificationFee = 30_000 := by decide
-- ネ: 更正の登記は ¥20,000／ナ: 抹消の登記は ¥20,000
example : registrationCorrectionFee = 20_000 := by decide
example : registrationErasureFee = 20_000 := by decide
-- （二）外国会社: イ 営業所設置は 各 ¥90,000／ロ 初設置又は不設置の場合は ¥60,000／ハ その他は ¥9,000／ニ 更正・抹消は ¥6,000
example : foreignCompanyOfficeInstallationFee 0 = 0 := by decide
example : foreignCompanyOfficeInstallationFee 1 = 90_000 := by decide
example : foreignCompanyOfficeInstallationFee 2 = 180_000 := by decide
example : foreignCompanyFirstOfficeFee = 60_000 := by decide
example : foreignCompanyOtherRegistrationFee = 9_000 := by decide
example : foreignCompanyCorrectionErasureFee = 6_000 := by decide
-- （三）清算: イ 清算人登記 ¥9,000／ロ 停止・選解任 ¥6,000／ハ 清算結了 ¥2,000／ニ その他・更正・抹消 ¥6,000
example : liquidatorRegistrationFee = 9_000 := by decide
example : liquidatorModificationFee = 6_000 := by decide
example : liquidationCompletionFee = 2_000 := by decide
example : liquidationOtherModificationFee = 6_000 := by decide

-- 二十五（一）/（二）/（三）: 特定目的会社の登記
example : spcFormationFee = 30_000 := by decide
example : spcOtherRegistrationFee = 15_000 := by decide
example : spcErasureFee = 10_000 := by decide
-- 二十六（一）/（二）/（三）: 投資法人の登記
example : investmentCorporationFormationFee = 30_000 := by decide
example : investmentCorporationOtherRegistrationFee = 15_000 := by decide
example : investmentCorporationErasureFee = 10_000 := by decide
-- 二十七（一）イ〜チ: 有限責任事業組合契約の組合契約の登記
example : llpContractEffectivenessFee = 60_000 := by decide
example : llpBranchInstallationFee = 60_000 := by decide
example : llpMoveFee = 30_000 := by decide
example : llpPartnerModificationFee = 10_000 := by decide
example : llpPartnerSuspensionFee = 30_000 := by decide
example : llpOtherRegistrationFee = 30_000 := by decide
example : llpCorrectionFee = 20_000 := by decide
example : llpErasureFee = 20_000 := by decide
-- 二十七（二）イ〜ニ: 組合契約の清算に係る登記
example : llpLiquidatorRegistrationFee = 6_000 := by decide
example : llpLiquidatorOtherFee = 6_000 := by decide
example : llpLiquidationCompletionFee = 2_000 := by decide
example : llpLiquidatorCorrectionErasureFee = 6_000 := by decide

-- 二十八（一）イ〜ニ / （二）イ〜ニ: 投資事業有限責任組合契約の登記
example : viclpContractEffectivenessFee = 30_000 := by decide
example : viclpOtherRegistrationFee = 15_000 := by decide
example : viclpCorrectionFee = 10_000 := by decide
example : viclpErasureFee = 10_000 := by decide
example : viclpLiquidatorRegistrationFee = 6_000 := by decide
example : viclpLiquidatorOtherFee = 6_000 := by decide
example : viclpLiquidationCompletionFee = 2_000 := by decide
example : viclpLiquidatorCorrectionErasureFee = 6_000 := by decide
-- 二十八の二（一）〜（六）: 限定責任信託の登記
example : limitLiabilityTrustProvisionFee = 30_000 := by decide
example : limitLiabilityTrustNewDomicileFee = 15_000 := by decide
example : limitLiabilityTrustOtherRegistrationFee = 15_000 := by decide
example : limitLiabilityTrustCorrectionFee = 10_000 := by decide
example : limitLiabilityTrustErasureFee = 10_000 := by decide
example : limitLiabilityTrustLiquidatorRegistrationFee = 6_000 := by decide
example : limitLiabilityTrustLiquidatorOtherFee = 6_000 := by decide
example : limitLiabilityTrustLiquidationCompletionFee = 2_000 := by decide
example : limitLiabilityTrustLiquidatorCorrectionErasureFee = 6_000 := by decide

-- 千分の一・五と千分の七の単位比較
example : commercial24LowMilleRate.applyFloor 1_000_000_000 = 1_500_000 := by decide
example : commercial24DefaultMilleRate.applyFloor 1_000_000_000 = 7_000_000 := by decide
example : commercial24LowMilleRate.num * commercial24DefaultMilleRate.den <
    commercial24DefaultMilleRate.num * commercial24LowMilleRate.den := by decide

end JapanTaxLaw
