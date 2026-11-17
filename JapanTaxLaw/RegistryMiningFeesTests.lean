import JapanTaxLaw.RegistryMiningFees
import JapanTaxLaw.RegistryMiningFeesSpec

/-!
# RegistryMiningFeesTests — 別表第一（二）十九〜二十二の二（鉱業権系）の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準 (`base`), the area, the case counts and the applicability are
caller-established; no Bool enters any fee formula. Rounding is floor (切り捨て)
via TaxRate.applyFloor. Rates are integer per-mille (denominator 1000 only).
This module re-checks every rate literal, every flat/area amount and several base
amounts (incl. floor boundaries), the independent integer formulas and agree flag.
Scope: 十九 鉱業権・租鉱権 / 二十 砂鉱権・租鉱権 / 二十一 予定損害賠償額 /
二十二 特定鉱業権 / 二十二の二 試掘権・貯留権 only (二十二の二（十三）は原文途切れで对象外)。
-/

namespace JapanTaxLaw.RegistryMiningFees

open JapanTaxLaw.TaxFinance

-- 率定数: 分子・分母・well-definedness（9 件、整数千分率 = X/1000）
example : miningMortgageEstablishment.num = 4 := by decide
example : miningMortgageEstablishment.den = 1000 := by decide
example : 0 < miningMortgageEstablishment.den := by decide
example : miningMortgageTrust.num = 2 := by decide
example : miningMortgageTrust.den = 1000 := by decide
example : 0 < miningMortgageTrust.den := by decide
example : placerMortgageEstablishment.num = 4 := by decide
example : placerMortgageEstablishment.den = 1000 := by decide
example : 0 < placerMortgageEstablishment.den := by decide
example : placerMortgageTrust.num = 2 := by decide
example : placerMortgageTrust.den = 1000 := by decide
example : 0 < placerMortgageTrust.den := by decide
example : damagesRegistration.num = 1 := by decide
example : damagesRegistration.den = 1000 := by decide
example : 0 < damagesRegistration.den := by decide
example : specialMiningMortgageEstablishment.num = 4 := by decide
example : specialMiningMortgageEstablishment.den = 1000 := by decide
example : 0 < specialMiningMortgageEstablishment.den := by decide
example : specialMiningMortgageTrust.num = 2 := by decide
example : specialMiningMortgageTrust.den = 1000 := by decide
example : 0 < specialMiningMortgageTrust.den := by decide
example : storageMortgageEstablishment.num = 4 := by decide
example : storageMortgageEstablishment.den = 1000 := by decide
example : 0 < storageMortgageEstablishment.den := by decide
example : storageMortgageTrust.num = 2 := by decide
example : storageMortgageTrust.den = 1000 := by decide
example : 0 < storageMortgageTrust.den := by decide

-- 面積型・定額型: 金額・正性（90 件）
example : placerRightEstablishmentPerArea = 4_500 := by decide
example : placerRightEstablishmentPerArea > 0 := by decide
example : placerIncreasedAreaChangePerArea = 3_000 := by decide
example : placerIncreasedAreaChangePerArea > 0 := by decide
example : placerRoyaltyEstablishmentPerArea = 450 := by decide
example : placerRoyaltyEstablishmentPerArea > 0 := by decide
example : placerIncreasedRoyaltyAreaChangePerArea = 300 := by decide
example : placerIncreasedRoyaltyAreaChangePerArea > 0 := by decide
example : specialExplorationEstablishmentPerArea = 300 := by decide
example : specialExplorationEstablishmentPerArea > 0 := by decide
example : specialExplorationTransferInheritanceOrMergerPerArea = 30 := by decide
example : specialExplorationTransferInheritanceOrMergerPerArea > 0 := by decide
example : specialExplorationTransferOtherPerArea = 150 := by decide
example : specialExplorationTransferOtherPerArea > 0 := by decide
example : specialMiningRightEstablishmentPerArea = 2_400 := by decide
example : specialMiningRightEstablishmentPerArea > 0 := by decide
example : specialMiningTermExtensionPerArea = 240 := by decide
example : specialMiningTermExtensionPerArea > 0 := by decide
example : specialMiningTransferInheritanceOrMergerPerArea = 240 := by decide
example : specialMiningTransferInheritanceOrMergerPerArea > 0 := by decide
example : specialMiningTransferOtherPerArea = 1_200 := by decide
example : specialMiningTransferOtherPerArea > 0 := by decide
example : specialMortgageTransferInheritanceOrMergerPerArea = 60 := by decide
example : specialMortgageTransferInheritanceOrMergerPerArea > 0 := by decide
example : specialMortgageTransferOtherPerArea = 120 := by decide
example : specialMortgageTransferOtherPerArea > 0 := by decide
example : specialNonMortgageRightTrustPerArea = 120 := by decide
example : specialNonMortgageRightTrustPerArea > 0 := by decide
example : miningTrialMiningRightEstablishment = 90_000 := by decide
example : miningTrialMiningRightEstablishment > 0 := by decide
example : miningTrialAreaIncreaseChange = 45_000 := by decide
example : miningTrialAreaIncreaseChange > 0 := by decide
example : miningTrialAreaDecreaseChange = 6_000 := by decide
example : miningTrialAreaDecreaseChange > 0 := by decide
example : miningTrialTransferInheritanceOrMerger = 9_000 := by decide
example : miningTrialTransferInheritanceOrMerger > 0 := by decide
example : miningTrialTransferOther = 45_000 := by decide
example : miningTrialTransferOther > 0 := by decide
example : miningTrialAbandonmentExtinction = 3_000 := by decide
example : miningTrialAbandonmentExtinction > 0 := by decide
example : miningMiningRightEstablishment = 180_000 := by decide
example : miningMiningRightEstablishment > 0 := by decide
example : miningMiningAreaIncreaseChange = 90_000 := by decide
example : miningMiningAreaIncreaseChange > 0 := by decide
example : miningMiningAreaDecreaseChange = 12_000 := by decide
example : miningMiningAreaDecreaseChange > 0 := by decide
example : miningMiningAreaMergerChange = 45_000 := by decide
example : miningMiningAreaMergerChange > 0 := by decide
example : miningMiningAreaDivisionChange = 45_000 := by decide
example : miningMiningAreaDivisionChange > 0 := by decide
example : miningMiningTransferInheritanceOrMerger = 18_000 := by decide
example : miningMiningTransferInheritanceOrMerger > 0 := by decide
example : miningMiningTransferOther = 90_000 := by decide
example : miningMiningTransferOther > 0 := by decide
example : miningMiningAbandonmentExtinction = 3_000 := by decide
example : miningMiningAbandonmentExtinction > 0 := by decide
example : miningRoyaltyRightEstablishment = 18_000 := by decide
example : miningRoyaltyRightEstablishment > 0 := by decide
example : miningRoyaltyAreaIncreaseChange = 6_000 := by decide
example : miningRoyaltyAreaIncreaseChange > 0 := by decide
example : miningRoyaltyAreaDecreaseChange = 1_200 := by decide
example : miningRoyaltyAreaDecreaseChange > 0 := by decide
example : miningRoyaltyTransferInheritanceOrMerger = 1_800 := by decide
example : miningRoyaltyTransferInheritanceOrMerger > 0 := by decide
example : miningRoyaltyTransferOther = 9_000 := by decide
example : miningRoyaltyTransferOther > 0 := by decide
example : miningRoyaltyExtinctionBeforeExpiry = 1_000 := by decide
example : miningRoyaltyExtinctionBeforeExpiry > 0 := by decide
example : miningMortgageChangeByMiningLaw51Consent = 3_000 := by decide
example : miningMortgageChangeByMiningLaw51Consent > 0 := by decide
example : miningMortgageRankChangeByOrderChange = 6_000 := by decide
example : miningMortgageRankChangeByOrderChange > 0 := by decide
example : miningMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : miningMortgageTransferInheritanceOrMerger > 0 := by decide
example : miningMortgageTransferOther = 9_000 := by decide
example : miningMortgageTransferOther > 0 := by decide
example : miningMortgageRankChange = 1_000 := by decide
example : miningMortgageRankChange > 0 := by decide
example : miningNonMortgageRightTrust = 9_000 := by decide
example : miningNonMortgageRightTrust > 0 := by decide
example : miningCoOwnerWithdrawal = 4_500 := by decide
example : miningCoOwnerWithdrawal > 0 := by decide
example : miningIncidentalOrRestorationOrCorrection = 1_000 := by decide
example : miningIncidentalOrRestorationOrCorrection > 0 := by decide
example : miningCancellation = 1_000 := by decide
example : miningCancellation > 0 := by decide
example : placerAreaDecreaseChange = 1_000 := by decide
example : placerAreaDecreaseChange > 0 := by decide
example : placerAreaMergerChange = 2_000 := by decide
example : placerAreaMergerChange > 0 := by decide
example : placerAreaDivisionChange = 2_000 := by decide
example : placerAreaDivisionChange > 0 := by decide
example : placerTransferInheritanceOrMerger = 4_500 := by decide
example : placerTransferInheritanceOrMerger > 0 := by decide
example : placerTransferOther = 13_500 := by decide
example : placerTransferOther > 0 := by decide
example : placerAbandonmentExtinction = 1_000 := by decide
example : placerAbandonmentExtinction > 0 := by decide
example : placerRoyaltyAreaDecreaseChange = 1_000 := by decide
example : placerRoyaltyAreaDecreaseChange > 0 := by decide
example : placerRoyaltyTransfer = 1_500 := by decide
example : placerRoyaltyTransfer > 0 := by decide
example : placerRoyaltyExtinctionBeforeExpiry = 1_000 := by decide
example : placerRoyaltyExtinctionBeforeExpiry > 0 := by decide
example : placerMortgageChangeByMiningLaw51Consent = 3_000 := by decide
example : placerMortgageChangeByMiningLaw51Consent > 0 := by decide
example : placerMortgageRankChangeByOrderChange = 6_000 := by decide
example : placerMortgageRankChangeByOrderChange > 0 := by decide
example : placerMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : placerMortgageTransferInheritanceOrMerger > 0 := by decide
example : placerMortgageTransferOther = 9_000 := by decide
example : placerMortgageTransferOther > 0 := by decide
example : placerMortgageRankChange = 1_000 := by decide
example : placerMortgageRankChange > 0 := by decide
example : placerNonMortgageRightTrust = 4_500 := by decide
example : placerNonMortgageRightTrust > 0 := by decide
example : placerCoOwnerWithdrawal = 4_500 := by decide
example : placerCoOwnerWithdrawal > 0 := by decide
example : placerIncidentalOrRestorationOrCorrection = 1_000 := by decide
example : placerIncidentalOrRestorationOrCorrection > 0 := by decide
example : placerCancellation = 1_000 := by decide
example : placerCancellation > 0 := by decide
example : damagesRestorationOrCorrection = 1_000 := by decide
example : damagesRestorationOrCorrection > 0 := by decide
example : damagesCancellation = 1_000 := by decide
example : damagesCancellation > 0 := by decide
example : specialExplorationAreaDecrease = 120_000 := by decide
example : specialExplorationAreaDecrease > 0 := by decide
example : specialExplorationAbandonmentExtinction = 60_000 := by decide
example : specialExplorationAbandonmentExtinction > 0 := by decide
example : specialMiningAreaDecrease = 240_000 := by decide
example : specialMiningAreaDecrease > 0 := by decide
example : specialMiningAbandonmentExtinction = 60_000 := by decide
example : specialMiningAbandonmentExtinction > 0 := by decide
example : specialMortgageRankChangeByOrderChange = 120_000 := by decide
example : specialMortgageRankChangeByOrderChange > 0 := by decide
example : specialMortgageRankChange = 20_000 := by decide
example : specialMortgageRankChange > 0 := by decide
example : specialCoOwnerWithdrawal = 90_000 := by decide
example : specialCoOwnerWithdrawal > 0 := by decide
example : specialIncidentalOrRestorationOrCorrection = 20_000 := by decide
example : specialIncidentalOrRestorationOrCorrection > 0 := by decide
example : specialCancellation = 20_000 := by decide
example : specialCancellation > 0 := by decide
example : storageExplorationRightEstablishment = 90_000 := by decide
example : storageExplorationRightEstablishment > 0 := by decide
example : storageExplorationAreaIncreaseChange = 45_000 := by decide
example : storageExplorationAreaIncreaseChange > 0 := by decide
example : storageExplorationAreaDecreaseChange = 6_000 := by decide
example : storageExplorationAreaDecreaseChange > 0 := by decide
example : storageExplorationTransferInheritanceOrMerger = 9_000 := by decide
example : storageExplorationTransferInheritanceOrMerger > 0 := by decide
example : storageExplorationTransferOther = 45_000 := by decide
example : storageExplorationTransferOther > 0 := by decide
example : storageRightEstablishment = 180_000 := by decide
example : storageRightEstablishment > 0 := by decide
example : storageAreaIncreaseChange = 90_000 := by decide
example : storageAreaIncreaseChange > 0 := by decide
example : storageAreaDecreaseChange = 12_000 := by decide
example : storageAreaDecreaseChange > 0 := by decide
example : storageAreaMergerChange = 45_000 := by decide
example : storageAreaMergerChange > 0 := by decide
example : storageAreaDivisionChange = 45_000 := by decide
example : storageAreaDivisionChange > 0 := by decide
example : storageTransferInheritanceOrMerger = 18_000 := by decide
example : storageTransferInheritanceOrMerger > 0 := by decide
example : storageTransferOther = 90_000 := by decide
example : storageTransferOther > 0 := by decide
example : storageMortgageChangeByCO2LawConsent = 3_000 := by decide
example : storageMortgageChangeByCO2LawConsent > 0 := by decide
example : storageMortgageRankChangeByOrderChange = 6_000 := by decide
example : storageMortgageRankChangeByOrderChange > 0 := by decide
example : storageMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : storageMortgageTransferInheritanceOrMerger > 0 := by decide
example : storageMortgageTransferOther = 9_000 := by decide
example : storageMortgageTransferOther > 0 := by decide
example : storageMortgageRankChange = 1_000 := by decide
example : storageMortgageRankChange > 0 := by decide
example : storageNonMortgageRightTrust = 9_000 := by decide
example : storageNonMortgageRightTrust > 0 := by decide

-- 税額関数の floor 境界 (0 → 0, den → num, 999 → floor)
example : miningMortgageEstablishmentFee 0 = 0 := by decide
example : miningMortgageEstablishmentFee 1_000 = 4 := by decide
example : miningMortgageEstablishmentFee 999 = 3 := by decide
example : miningMortgageTrustFee 0 = 0 := by decide
example : miningMortgageTrustFee 1_000 = 2 := by decide
example : miningMortgageTrustFee 999 = 1 := by decide
example : placerMortgageEstablishmentFee 0 = 0 := by decide
example : placerMortgageEstablishmentFee 1_000 = 4 := by decide
example : placerMortgageEstablishmentFee 999 = 3 := by decide
example : placerMortgageTrustFee 0 = 0 := by decide
example : placerMortgageTrustFee 1_000 = 2 := by decide
example : placerMortgageTrustFee 999 = 1 := by decide
example : damagesRegistrationFee 0 = 0 := by decide
example : damagesRegistrationFee 1_000 = 1 := by decide
example : damagesRegistrationFee 999 = 0 := by decide
example : specialMiningMortgageEstablishmentFee 0 = 0 := by decide
example : specialMiningMortgageEstablishmentFee 1_000 = 4 := by decide
example : specialMiningMortgageEstablishmentFee 999 = 3 := by decide
example : specialMiningMortgageTrustFee 0 = 0 := by decide
example : specialMiningMortgageTrustFee 1_000 = 2 := by decide
example : specialMiningMortgageTrustFee 999 = 1 := by decide
example : storageMortgageEstablishmentFee 0 = 0 := by decide
example : storageMortgageEstablishmentFee 1_000 = 4 := by decide
example : storageMortgageEstablishmentFee 999 = 3 := by decide
example : storageMortgageTrustFee 0 = 0 := by decide
example : storageMortgageTrustFee 1_000 = 2 := by decide
example : storageMortgageTrustFee 999 = 1 := by decide

-- 独立定式（Spec）の再確認と agree フラグ
example : specMiningMortgageEstablishmentFee 1000 = 4 := by decide
example : specMiningMortgageTrustFee 1000 = 2 := by decide
example : specPlacerMortgageEstablishmentFee 1000 = 4 := by decide
example : specPlacerMortgageTrustFee 1000 = 2 := by decide
example : specDamagesRegistrationFee 1000 = 1 := by decide
example : specSpecialMiningMortgageEstablishmentFee 1000 = 4 := by decide
example : specSpecialMiningMortgageTrustFee 1000 = 2 := by decide
example : specStorageMortgageEstablishmentFee 1000 = 4 := by decide
example : specStorageMortgageTrustFee 1000 = 2 := by decide
example : specPlacerRightEstablishmentPerArea = 4_500 := by decide
example : specPlacerIncreasedAreaChangePerArea = 3_000 := by decide
example : specPlacerRoyaltyEstablishmentPerArea = 450 := by decide
example : specPlacerIncreasedRoyaltyAreaChangePerArea = 300 := by decide
example : specSpecialExplorationEstablishmentPerArea = 300 := by decide
example : specSpecialExplorationTransferInheritanceOrMergerPerArea = 30 := by decide
example : specSpecialExplorationTransferOtherPerArea = 150 := by decide
example : specSpecialMiningRightEstablishmentPerArea = 2_400 := by decide
example : specSpecialMiningTermExtensionPerArea = 240 := by decide
example : specSpecialMiningTransferInheritanceOrMergerPerArea = 240 := by decide
example : specSpecialMiningTransferOtherPerArea = 1_200 := by decide
example : specSpecialMortgageTransferInheritanceOrMergerPerArea = 60 := by decide
example : specSpecialMortgageTransferOtherPerArea = 120 := by decide
example : specSpecialNonMortgageRightTrustPerArea = 120 := by decide
example : specMiningTrialMiningRightEstablishment = 90_000 := by decide
example : specMiningTrialAreaIncreaseChange = 45_000 := by decide
example : specMiningTrialAreaDecreaseChange = 6_000 := by decide
example : specMiningTrialTransferInheritanceOrMerger = 9_000 := by decide
example : specMiningTrialTransferOther = 45_000 := by decide
example : specMiningTrialAbandonmentExtinction = 3_000 := by decide
example : specMiningMiningRightEstablishment = 180_000 := by decide
example : specMiningMiningAreaIncreaseChange = 90_000 := by decide
example : specMiningMiningAreaDecreaseChange = 12_000 := by decide
example : specMiningMiningAreaMergerChange = 45_000 := by decide
example : specMiningMiningAreaDivisionChange = 45_000 := by decide
example : specMiningMiningTransferInheritanceOrMerger = 18_000 := by decide
example : specMiningMiningTransferOther = 90_000 := by decide
example : specMiningMiningAbandonmentExtinction = 3_000 := by decide
example : specMiningRoyaltyRightEstablishment = 18_000 := by decide
example : specMiningRoyaltyAreaIncreaseChange = 6_000 := by decide
example : specMiningRoyaltyAreaDecreaseChange = 1_200 := by decide
example : specMiningRoyaltyTransferInheritanceOrMerger = 1_800 := by decide
example : specMiningRoyaltyTransferOther = 9_000 := by decide
example : specMiningRoyaltyExtinctionBeforeExpiry = 1_000 := by decide
example : specMiningMortgageChangeByMiningLaw51Consent = 3_000 := by decide
example : specMiningMortgageRankChangeByOrderChange = 6_000 := by decide
example : specMiningMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : specMiningMortgageTransferOther = 9_000 := by decide
example : specMiningMortgageRankChange = 1_000 := by decide
example : specMiningNonMortgageRightTrust = 9_000 := by decide
example : specMiningCoOwnerWithdrawal = 4_500 := by decide
example : specMiningIncidentalOrRestorationOrCorrection = 1_000 := by decide
example : specMiningCancellation = 1_000 := by decide
example : specPlacerAreaDecreaseChange = 1_000 := by decide
example : specPlacerAreaMergerChange = 2_000 := by decide
example : specPlacerAreaDivisionChange = 2_000 := by decide
example : specPlacerTransferInheritanceOrMerger = 4_500 := by decide
example : specPlacerTransferOther = 13_500 := by decide
example : specPlacerAbandonmentExtinction = 1_000 := by decide
example : specPlacerRoyaltyAreaDecreaseChange = 1_000 := by decide
example : specPlacerRoyaltyTransfer = 1_500 := by decide
example : specPlacerRoyaltyExtinctionBeforeExpiry = 1_000 := by decide
example : specPlacerMortgageChangeByMiningLaw51Consent = 3_000 := by decide
example : specPlacerMortgageRankChangeByOrderChange = 6_000 := by decide
example : specPlacerMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : specPlacerMortgageTransferOther = 9_000 := by decide
example : specPlacerMortgageRankChange = 1_000 := by decide
example : specPlacerNonMortgageRightTrust = 4_500 := by decide
example : specPlacerCoOwnerWithdrawal = 4_500 := by decide
example : specPlacerIncidentalOrRestorationOrCorrection = 1_000 := by decide
example : specPlacerCancellation = 1_000 := by decide
example : specDamagesRestorationOrCorrection = 1_000 := by decide
example : specDamagesCancellation = 1_000 := by decide
example : specSpecialExplorationAreaDecrease = 120_000 := by decide
example : specSpecialExplorationAbandonmentExtinction = 60_000 := by decide
example : specSpecialMiningAreaDecrease = 240_000 := by decide
example : specSpecialMiningAbandonmentExtinction = 60_000 := by decide
example : specSpecialMortgageRankChangeByOrderChange = 120_000 := by decide
example : specSpecialMortgageRankChange = 20_000 := by decide
example : specSpecialCoOwnerWithdrawal = 90_000 := by decide
example : specSpecialIncidentalOrRestorationOrCorrection = 20_000 := by decide
example : specSpecialCancellation = 20_000 := by decide
example : specStorageExplorationRightEstablishment = 90_000 := by decide
example : specStorageExplorationAreaIncreaseChange = 45_000 := by decide
example : specStorageExplorationAreaDecreaseChange = 6_000 := by decide
example : specStorageExplorationTransferInheritanceOrMerger = 9_000 := by decide
example : specStorageExplorationTransferOther = 45_000 := by decide
example : specStorageRightEstablishment = 180_000 := by decide
example : specStorageAreaIncreaseChange = 90_000 := by decide
example : specStorageAreaDecreaseChange = 12_000 := by decide
example : specStorageAreaMergerChange = 45_000 := by decide
example : specStorageAreaDivisionChange = 45_000 := by decide
example : specStorageTransferInheritanceOrMerger = 18_000 := by decide
example : specStorageTransferOther = 90_000 := by decide
example : specStorageMortgageChangeByCO2LawConsent = 3_000 := by decide
example : specStorageMortgageRankChangeByOrderChange = 6_000 := by decide
example : specStorageMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : specStorageMortgageTransferOther = 9_000 := by decide
example : specStorageMortgageRankChange = 1_000 := by decide
example : specStorageNonMortgageRightTrust = 9_000 := by decide
example : agreeRegistryMiningFees = true := by decide

end JapanTaxLaw.RegistryMiningFees
