import JapanTaxLaw.RegistryMiningFees

/-!
# RegistryMiningFeesSpec — 別表第一（二）十九〜二十二の二（鉱業権系）の独立整数定式

Source (pinned; identical to RegistryMiningFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee formulas as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  割合型（9 件、すべて整数千分率、分母 1000）:
    千分の四 → (base * 4) / 1000 ; 千分の二 → (base * 2) / 1000 ; 千分の一 → (base * 1) / 1000
  面積型（14 件）・定額型（76 件）: 原文の円額をそのまま Nat 定数として保持
    （面積は十万平方メートル 1 単位あたり、単位換算は caller-established）。

The 課税標準 (`base`), the area, the case counts and the applicability are
caller-established in both the implementation and this spec; no eligibility Bool
enters any formula. Rounding is floor (切り捨て). No decimal per-mille rate occurs
in this range (so denominator is 1000 everywhere, never 10000). Scope boundaries
identical to the implementation: 二十二の二（十三）は原文が途中で切れており对象外。
本モジュールの def は 独立税額定式 9 + 独立定数定式 90 + agree 1 = 100 本。
-/

namespace JapanTaxLaw.RegistryMiningFees

open JapanTaxLaw.TaxFinance

/-! === 独立整数定式（割合型税額） === -/

/-- Spec: 十九（十三） 抵当権の設定又は鉱業権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（(base * 4) / 1000）。 -/
def specMiningMortgageEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000

/-- Spec: 十九（十八）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（(base * 2) / 1000）。 -/
def specMiningMortgageTrustFee (base : Nat) : Nat := (base * 2) / 1000

/-- Spec: 二十（九） 抵当権の設定又は砂鉱権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（(base * 4) / 1000）。 -/
def specPlacerMortgageEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000

/-- Spec: 二十（十四）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（(base * 2) / 1000）。 -/
def specPlacerMortgageTrustFee (base : Nat) : Nat := (base * 2) / 1000

/-- Spec: 二十一（一） 新規登録（予定された損害賠償額の登録） — 損害賠償の支払金額千分の一（(base * 1) / 1000）。 -/
def specDamagesRegistrationFee (base : Nat) : Nat := (base * 1) / 1000

/-- Spec: 二十二（十） 抵当権の設定又は特定鉱業権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（(base * 4) / 1000）。 -/
def specSpecialMiningMortgageEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000

/-- Spec: 二十二（十四）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（(base * 2) / 1000）。 -/
def specSpecialMiningMortgageTrustFee (base : Nat) : Nat := (base * 2) / 1000

/-- Spec: 二十二の二（七） 抵当権の設定又は試掘権、貯留権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（(base * 4) / 1000）。 -/
def specStorageMortgageEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000

/-- Spec: 二十二の二（十二）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（(base * 2) / 1000）。 -/
def specStorageMortgageTrustFee (base : Nat) : Nat := (base * 2) / 1000

/-! === 独立整数定式（面積型・定額型） === -/

/-- Spec: 二十（一） 砂鉱権の設定の登録 — 鉱区の面積十万平方メートルにつき四千五百円（¥4_500）。 -/
def specPlacerRightEstablishmentPerArea : Nat := 4_500

/-- Spec: 二十（二）イ 鉱区の増加又は鉱区の増加及び減少による砂鉱権の変更の登録 — 増加した鉱区の面積十万平方メートルにつき三千円（¥3_000）。 -/
def specPlacerIncreasedAreaChangePerArea : Nat := 3_000

/-- Spec: 二十（五） 租鉱権の設定の登録 — 租鉱区の面積十万平方メートルにつき四百五十円（¥450）。 -/
def specPlacerRoyaltyEstablishmentPerArea : Nat := 450

/-- Spec: 二十（六）イ 租鉱区の増加又は租鉱区の増加及び減少による租鉱権の変更の登録 — 増加した租鉱区の面積十万平方メートルにつき三百円（¥300）。 -/
def specPlacerIncreasedRoyaltyAreaChangePerArea : Nat := 300

/-- Spec: 二十二（一） 探査権の設定の登録 — 共同開発鉱区の面積十万平方メートルにつき三百円（¥300）。 -/
def specSpecialExplorationEstablishmentPerArea : Nat := 300

/-- Spec: 二十二（三）イ 探査権の移転の登録（相続又は法人の合併） — 共同開発鉱区の面積十万平方メートルにつき三十円（¥30）。 -/
def specSpecialExplorationTransferInheritanceOrMergerPerArea : Nat := 30

/-- Spec: 二十二（三）ロ 探査権の移転の登録（その他の原因） — 共同開発鉱区の面積十万平方メートルにつき百五十円（¥150）。 -/
def specSpecialExplorationTransferOtherPerArea : Nat := 150

/-- Spec: 二十二（五） 採掘権の設定の登録 — 共同開発鉱区の面積十万平方メートルにつき二千四百円（¥2_400）。 -/
def specSpecialMiningRightEstablishmentPerArea : Nat := 2_400

/-- Spec: 二十二（六） 採掘権の存続期間の延長の登録 — 共同開発鉱区の面積十万平方メートルにつき二百四十円（¥240）。 -/
def specSpecialMiningTermExtensionPerArea : Nat := 240

/-- Spec: 二十二（八）イ 採掘権の移転の登録（相続又は法人の合併） — 共同開発鉱区の面積十万平方メートルにつき二百四十円（¥240）。 -/
def specSpecialMiningTransferInheritanceOrMergerPerArea : Nat := 240

/-- Spec: 二十二（八）ロ 採掘権の移転の登録（その他の原因） — 共同開発鉱区の面積十万平方メートルにつき千二百円（¥1_200）。 -/
def specSpecialMiningTransferOtherPerArea : Nat := 1_200

/-- Spec: 二十二（十二）イ 抵当権の移転の登録（相続又は法人の合併） — 共同開発鉱区の面積十万平方メートルにつき六十円（¥60）。 -/
def specSpecialMortgageTransferInheritanceOrMergerPerArea : Nat := 60

/-- Spec: 二十二（十二）ロ 抵当権の移転の登録（その他の原因） — 共同開発鉱区の面積十万平方メートルにつき百二十円（¥120）。 -/
def specSpecialMortgageTransferOtherPerArea : Nat := 120

/-- Spec: 二十二（十四）ロ 抵当権以外の権利の信託の登録 — 共同開発鉱区の面積十万平方メートルにつき百二十円（¥120）。 -/
def specSpecialNonMortgageRightTrustPerArea : Nat := 120

/-- Spec: 十九（一） 試掘権の設定の登録 — 鉱区の数一個につき九万円（¥90_000）。 -/
def specMiningTrialMiningRightEstablishment : Nat := 90_000

/-- Spec: 十九（二）イ 鉱区の増加又は鉱区の増加及び減少による試掘権の変更の登録 — 鉱区の数一個につき四万五千円（¥45_000）。 -/
def specMiningTrialAreaIncreaseChange : Nat := 45_000

/-- Spec: 十九（二）ロ 鉱区の減少による試掘権の変更の登録 — 鉱区の数一個につき六千円（¥6_000）。 -/
def specMiningTrialAreaDecreaseChange : Nat := 6_000

/-- Spec: 十九（三）イ 試掘権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき九千円（¥9_000）。 -/
def specMiningTrialTransferInheritanceOrMerger : Nat := 9_000

/-- Spec: 十九（三）ロ 試掘権の移転の登録（その他の原因） — 鉱区の数一個につき四万五千円（¥45_000）。 -/
def specMiningTrialTransferOther : Nat := 45_000

/-- Spec: 十九（四） 放棄による試掘権の消滅の登録 — 鉱区の数一個につき三千円（¥3_000）。 -/
def specMiningTrialAbandonmentExtinction : Nat := 3_000

/-- Spec: 十九（五） 採掘権の設定の登録 — 鉱区の数一個につき十八万円（¥180_000）。 -/
def specMiningMiningRightEstablishment : Nat := 180_000

/-- Spec: 十九（六）イ 鉱区の増加又は鉱区の増加及び減少による採掘権の変更の登録 — 鉱区の数一個につき九万円（¥90_000）。 -/
def specMiningMiningAreaIncreaseChange : Nat := 90_000

/-- Spec: 十九（六）ロ 鉱区の減少による採掘権の変更の登録 — 鉱区の数一個につき一万二千円（¥12_000）。 -/
def specMiningMiningAreaDecreaseChange : Nat := 12_000

/-- Spec: 十九（六）ハ 鉱区の合併による採掘権の変更の登録（合併後） — 合併後の鉱区の数一個につき四万五千円（¥45_000）。 -/
def specMiningMiningAreaMergerChange : Nat := 45_000

/-- Spec: 十九（六）ニ 鉱区の分割による採掘権の変更の登録（分割後） — 分割後の鉱区の数一個につき四万五千円（¥45_000）。 -/
def specMiningMiningAreaDivisionChange : Nat := 45_000

/-- Spec: 十九（七）イ 採掘権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき一万八千円（¥18_000）。 -/
def specMiningMiningTransferInheritanceOrMerger : Nat := 18_000

/-- Spec: 十九（七）ロ 採掘権の移転の登録（その他の原因） — 鉱区の数一個につき九万円（¥90_000）。 -/
def specMiningMiningTransferOther : Nat := 90_000

/-- Spec: 十九（八） 放棄による採掘権の消滅の登録 — 鉱区の数一個につき三千円（¥3_000）。 -/
def specMiningMiningAbandonmentExtinction : Nat := 3_000

/-- Spec: 十九（九） 租鉱権の設定の登録 — 鉱区の数一個につき一万八千円（¥18_000）。 -/
def specMiningRoyaltyRightEstablishment : Nat := 18_000

/-- Spec: 十九（十）イ 租鉱区の増加又は租鉱区の増加及び減少による租鉱権の変更の登録 — 租鉱区の数一個につき六千円（¥6_000）。 -/
def specMiningRoyaltyAreaIncreaseChange : Nat := 6_000

/-- Spec: 十九（十）ロ 租鉱区の減少による租鉱権の変更の登録 — 租鉱区の数一個につき千二百円（¥1_200）。 -/
def specMiningRoyaltyAreaDecreaseChange : Nat := 1_200

/-- Spec: 十九（十一）イ 租鉱権の移転の登録（相続又は法人の合併） — 租鉱区の数一個につき千八百円（¥1_800）。 -/
def specMiningRoyaltyTransferInheritanceOrMerger : Nat := 1_800

/-- Spec: 十九（十一）ロ 租鉱権の移転の登録（その他の原因） — 租鉱区の数一個につき九千円（¥9_000）。 -/
def specMiningRoyaltyTransferOther : Nat := 9_000

/-- Spec: 十九（十二） 存続期間の満了前の租鉱権の消滅の登録 — 租鉱区の数一個につき千円（¥1_000）。 -/
def specMiningRoyaltyExtinctionBeforeExpiry : Nat := 1_000

/-- Spec: 十九（十四） 鉱業法第五十一条の承諾及び協定に係る抵当権の変更の登録 — 鉱区の数一個につき三千円（¥3_000）。 -/
def specMiningMortgageChangeByMiningLaw51Consent : Nat := 3_000

/-- Spec: 十九（十五） 順位の変更による抵当権の変更の登録（（十四）を除く） — 鉱区の数一個につき六千円（¥6_000）。 -/
def specMiningMortgageRankChangeByOrderChange : Nat := 6_000

/-- Spec: 十九（十六）イ 抵当権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき四千五百円（¥4_500）。 -/
def specMiningMortgageTransferInheritanceOrMerger : Nat := 4_500

/-- Spec: 十九（十六）ロ 抵当権の移転の登録（その他の原因） — 鉱区の数一個につき九千円（¥9_000）。 -/
def specMiningMortgageTransferOther : Nat := 9_000

/-- Spec: 十九（十七） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1_000）。 -/
def specMiningMortgageRankChange : Nat := 1_000

/-- Spec: 十九（十八）ロ 抵当権以外の権利の信託の登録 — 鉱区又は租鉱区の数一個につき九千円（¥9_000）。 -/
def specMiningNonMortgageRightTrust : Nat := 9_000

/-- Spec: 十九（十九） 共同鉱業権者又は共同租鉱権者の脱退の登録 — 鉱区又は租鉱区の数一個につき四千五百円（¥4_500）。 -/
def specMiningCoOwnerWithdrawal : Nat := 4_500

/-- Spec: 十九（二十） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（（一）から（十九）までを除く） — 鉱区又は租鉱区の数一個につき千円（¥1_000）。 -/
def specMiningIncidentalOrRestorationOrCorrection : Nat := 1_000

/-- Spec: 十九（二十一） 登録の抹消 — 鉱区又は租鉱区の数一個につき千円（¥1_000）。 -/
def specMiningCancellation : Nat := 1_000

/-- Spec: 二十（二）ロ 鉱区の減少による砂鉱権の変更の登録 — 鉱区の数一個につき千円（¥1_000）。 -/
def specPlacerAreaDecreaseChange : Nat := 1_000

/-- Spec: 二十（二）ハ 鉱区の合併による砂鉱権の変更の登録（合併後） — 合併後の鉱区の数一個につき二千円（¥2_000）。 -/
def specPlacerAreaMergerChange : Nat := 2_000

/-- Spec: 二十（二）ニ 鉱区の分割による砂鉱権の変更の登録（分割後） — 分割後の鉱区の数一個につき二千円（¥2_000）。 -/
def specPlacerAreaDivisionChange : Nat := 2_000

/-- Spec: 二十（三）イ 砂鉱権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき四千五百円（¥4_500）。 -/
def specPlacerTransferInheritanceOrMerger : Nat := 4_500

/-- Spec: 二十（三）ロ 砂鉱権の移転の登録（その他の原因） — 鉱区の数一個につき一万三千五百円（¥13_500）。 -/
def specPlacerTransferOther : Nat := 13_500

/-- Spec: 二十（四） 放棄による砂鉱権の消滅の登録 — 鉱区の数一個につき千円（¥1_000）。 -/
def specPlacerAbandonmentExtinction : Nat := 1_000

/-- Spec: 二十（六）ロ 租鉱区の減少による租鉱権の変更の登録 — 租鉱区の数一個につき千円（¥1_000）。 -/
def specPlacerRoyaltyAreaDecreaseChange : Nat := 1_000

/-- Spec: 二十（七） 租鉱権の移転の登録 — 租鉱区の数一個につき千五百円（¥1_500）。 -/
def specPlacerRoyaltyTransfer : Nat := 1_500

/-- Spec: 二十（八） 存続期間満了前の租鉱権の消滅の登録 — 租鉱区の数一個につき千円（¥1_000）。 -/
def specPlacerRoyaltyExtinctionBeforeExpiry : Nat := 1_000

/-- Spec: 二十（十） 鉱業法第五十一条の承諾及び協定に係る抵当権の変更の登録 — 鉱区の数一個につき三千円（¥3_000）。 -/
def specPlacerMortgageChangeByMiningLaw51Consent : Nat := 3_000

/-- Spec: 二十（十一） 順位の変更による抵当権の変更の登録（（十）を除く） — 鉱区の数一個につき六千円（¥6_000）。 -/
def specPlacerMortgageRankChangeByOrderChange : Nat := 6_000

/-- Spec: 二十（十二）イ 抵当権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき四千五百円（¥4_500）。 -/
def specPlacerMortgageTransferInheritanceOrMerger : Nat := 4_500

/-- Spec: 二十（十二）ロ 抵当権の移転の登録（その他の原因） — 鉱区の数一個につき九千円（¥9_000）。 -/
def specPlacerMortgageTransferOther : Nat := 9_000

/-- Spec: 二十（十三） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1_000）。 -/
def specPlacerMortgageRankChange : Nat := 1_000

/-- Spec: 二十（十四）ロ 抵当権以外の権利の信託の登録 — 鉱区又は租鉱区の数一個につき四千五百円（¥4_500）。 -/
def specPlacerNonMortgageRightTrust : Nat := 4_500

/-- Spec: 二十（十五） 共同砂鉱権者又は共同租鉱権者の脱退の登録 — 鉱区又は租鉱区の数一個につき四千五百円（¥4_500）。 -/
def specPlacerCoOwnerWithdrawal : Nat := 4_500

/-- Spec: 二十（十六） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（（一）から（十五）までを除く） — 鉱区又は租鉱区の数一個につき千円（¥1_000）。 -/
def specPlacerIncidentalOrRestorationOrCorrection : Nat := 1_000

/-- Spec: 二十（十七） 登録の抹消 — 鉱区又は租鉱区の数一個につき千円（¥1_000）。 -/
def specPlacerCancellation : Nat := 1_000

/-- Spec: 二十一（二） 抹消した登録の回復又は登録の更正若しくは変更の登録 — 不動産の個数一個につき千円（¥1_000）。 -/
def specDamagesRestorationOrCorrection : Nat := 1_000

/-- Spec: 二十一（三） 登録の抹消 — 不動産の個数一個につき千円（¥1_000）。 -/
def specDamagesCancellation : Nat := 1_000

/-- Spec: 二十二（二） 探査権の共同開発鉱区の減少の登録 — 共同開発鉱区の減少をする部分の数一個につき十二万円（¥120_000）。 -/
def specSpecialExplorationAreaDecrease : Nat := 120_000

/-- Spec: 二十二（四） 放棄による探査権の消滅の登録 — 共同開発鉱区の数一個につき六万円（¥60_000）。 -/
def specSpecialExplorationAbandonmentExtinction : Nat := 60_000

/-- Spec: 二十二（七） 採掘権の共同開発鉱区の減少の登録 — 共同開発鉱区の減少をする部分の数一個につき二十四万円（¥240_000）。 -/
def specSpecialMiningAreaDecrease : Nat := 240_000

/-- Spec: 二十二（九） 放棄による採掘権の消滅の登録 — 共同開発鉱区の数一個につき六万円（¥60_000）。 -/
def specSpecialMiningAbandonmentExtinction : Nat := 60_000

/-- Spec: 二十二（十一） 順位の変更による抵当権の変更の登録 — 共同開発鉱区の数一個につき十二万円（¥120_000）。 -/
def specSpecialMortgageRankChangeByOrderChange : Nat := 120_000

/-- Spec: 二十二（十三） 抵当権の順位の変更の登録 — 抵当権の件数一件につき二万円（¥20_000）。 -/
def specSpecialMortgageRankChange : Nat := 20_000

/-- Spec: 二十二（十五） 特定鉱業権共有者の脱退の登録 — 共同開発鉱区の数一個につき九万円（¥90_000）。 -/
def specSpecialCoOwnerWithdrawal : Nat := 90_000

/-- Spec: 二十二（十六） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（（一）から（十五）までを除く） — 共同開発鉱区の数一個につき二万円（¥20_000）。 -/
def specSpecialIncidentalOrRestorationOrCorrection : Nat := 20_000

/-- Spec: 二十二（十七） 登録の抹消 — 共同開発鉱区の数一個につき二万円（¥20_000）。 -/
def specSpecialCancellation : Nat := 20_000

/-- Spec: 二十二の二（一） 試掘権の設定の登録 — 試掘区域の数一個につき九万円（¥90_000）。 -/
def specStorageExplorationRightEstablishment : Nat := 90_000

/-- Spec: 二十二の二（二）イ 試掘区域の増加又は試掘区域の増加及び減少による試掘権の変更の登録 — 試掘区域の数一個につき四万五千円（¥45_000）。 -/
def specStorageExplorationAreaIncreaseChange : Nat := 45_000

/-- Spec: 二十二の二（二）ロ 試掘区域の減少による試掘権の変更の登録 — 試掘区域の数一個につき六千円（¥6_000）。 -/
def specStorageExplorationAreaDecreaseChange : Nat := 6_000

/-- Spec: 二十二の二（三）イ 試掘権の移転の登録（相続又は法人の合併） — 試掘区域の数一個につき九千円（¥9_000）。 -/
def specStorageExplorationTransferInheritanceOrMerger : Nat := 9_000

/-- Spec: 二十二の二（三）ロ 試掘権の移転の登録（その他の原因） — 試掘区域の数一個につき四万五千円（¥45_000）。 -/
def specStorageExplorationTransferOther : Nat := 45_000

/-- Spec: 二十二の二（四） 貯留権の設定の登録 — 貯留区域の数一個につき十八万円（¥180_000）。 -/
def specStorageRightEstablishment : Nat := 180_000

/-- Spec: 二十二の二（五）イ 貯留区域の増加又は貯留区域の増加及び減少による貯留権の変更の登録 — 貯留区域の数一個につき九万円（¥90_000）。 -/
def specStorageAreaIncreaseChange : Nat := 90_000

/-- Spec: 二十二の二（五）ロ 貯留区域の減少による貯留権の変更の登録 — 貯留区域の数一個につき一万二千円（¥12_000）。 -/
def specStorageAreaDecreaseChange : Nat := 12_000

/-- Spec: 二十二の二（五）ハ 貯留区域の合併による貯留権の変更の登録（合併後） — 合併後の貯留区域の数一個につき四万五千円（¥45_000）。 -/
def specStorageAreaMergerChange : Nat := 45_000

/-- Spec: 二十二の二（五）ニ 貯留区域の分割による貯留権の変更の登録（分割後） — 分割後の貯留区域の数一個につき四万五千円（¥45_000）。 -/
def specStorageAreaDivisionChange : Nat := 45_000

/-- Spec: 二十二の二（六）イ 貯留権の移転の登録（相続又は法人の合併） — 貯留区域の数一個につき一万八千円（¥18_000）。 -/
def specStorageTransferInheritanceOrMerger : Nat := 18_000

/-- Spec: 二十二の二（六）ロ 貯留権の移転の登録（その他の原因） — 貯留区域の数一個につき九万円（¥90_000）。 -/
def specStorageTransferOther : Nat := 90_000

/-- Spec: 二十二の二（八） 二酸化炭素の貯留事業に関する法律第十六条第五項の承諾及び協定に係る抵当権の変更の登録 — 貯留区域の数一個につき三千円（¥3_000）。 -/
def specStorageMortgageChangeByCO2LawConsent : Nat := 3_000

/-- Spec: 二十二の二（九） 順位の変更による抵当権の変更の登録（（八）を除く） — 貯留区域の数一個につき六千円（¥6_000）。 -/
def specStorageMortgageRankChangeByOrderChange : Nat := 6_000

/-- Spec: 二十二の二（十）イ 抵当権の移転の登録（相続又は法人の合併） — 貯留区域の数一個につき四千五百円（¥4_500）。 -/
def specStorageMortgageTransferInheritanceOrMerger : Nat := 4_500

/-- Spec: 二十二の二（十）ロ 抵当権の移転の登録（その他の原因） — 貯留区域の数一個につき九千円（¥9_000）。 -/
def specStorageMortgageTransferOther : Nat := 9_000

/-- Spec: 二十二の二（十一） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1_000）。 -/
def specStorageMortgageRankChange : Nat := 1_000

/-- Spec: 二十二の二（十二）ロ 抵当権以外の権利の信託の登録 — 試掘区域又は貯留区域の数一個につき九千円（¥9_000）。 -/
def specStorageNonMortgageRightTrust : Nat := 9_000

-- ==== 独立定式の smoke（kernel-decide） ====

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

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryMiningFees : Bool :=
  let g : List Nat := [0, 1, 99, 249, 250, 499, 500, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  g.all (fun n => miningMortgageEstablishmentFee n == specMiningMortgageEstablishmentFee n)
  && g.all (fun n => miningMortgageTrustFee n == specMiningMortgageTrustFee n)
  && g.all (fun n => placerMortgageEstablishmentFee n == specPlacerMortgageEstablishmentFee n)
  && g.all (fun n => placerMortgageTrustFee n == specPlacerMortgageTrustFee n)
  && g.all (fun n => damagesRegistrationFee n == specDamagesRegistrationFee n)
  && g.all (fun n => specialMiningMortgageEstablishmentFee n == specSpecialMiningMortgageEstablishmentFee n)
  && g.all (fun n => specialMiningMortgageTrustFee n == specSpecialMiningMortgageTrustFee n)
  && g.all (fun n => storageMortgageEstablishmentFee n == specStorageMortgageEstablishmentFee n)
  && g.all (fun n => storageMortgageTrustFee n == specStorageMortgageTrustFee n)
  && placerRightEstablishmentPerArea == specPlacerRightEstablishmentPerArea
  && placerIncreasedAreaChangePerArea == specPlacerIncreasedAreaChangePerArea
  && placerRoyaltyEstablishmentPerArea == specPlacerRoyaltyEstablishmentPerArea
  && placerIncreasedRoyaltyAreaChangePerArea == specPlacerIncreasedRoyaltyAreaChangePerArea
  && specialExplorationEstablishmentPerArea == specSpecialExplorationEstablishmentPerArea
  && specialExplorationTransferInheritanceOrMergerPerArea == specSpecialExplorationTransferInheritanceOrMergerPerArea
  && specialExplorationTransferOtherPerArea == specSpecialExplorationTransferOtherPerArea
  && specialMiningRightEstablishmentPerArea == specSpecialMiningRightEstablishmentPerArea
  && specialMiningTermExtensionPerArea == specSpecialMiningTermExtensionPerArea
  && specialMiningTransferInheritanceOrMergerPerArea == specSpecialMiningTransferInheritanceOrMergerPerArea
  && specialMiningTransferOtherPerArea == specSpecialMiningTransferOtherPerArea
  && specialMortgageTransferInheritanceOrMergerPerArea == specSpecialMortgageTransferInheritanceOrMergerPerArea
  && specialMortgageTransferOtherPerArea == specSpecialMortgageTransferOtherPerArea
  && specialNonMortgageRightTrustPerArea == specSpecialNonMortgageRightTrustPerArea
  && miningTrialMiningRightEstablishment == specMiningTrialMiningRightEstablishment
  && miningTrialAreaIncreaseChange == specMiningTrialAreaIncreaseChange
  && miningTrialAreaDecreaseChange == specMiningTrialAreaDecreaseChange
  && miningTrialTransferInheritanceOrMerger == specMiningTrialTransferInheritanceOrMerger
  && miningTrialTransferOther == specMiningTrialTransferOther
  && miningTrialAbandonmentExtinction == specMiningTrialAbandonmentExtinction
  && miningMiningRightEstablishment == specMiningMiningRightEstablishment
  && miningMiningAreaIncreaseChange == specMiningMiningAreaIncreaseChange
  && miningMiningAreaDecreaseChange == specMiningMiningAreaDecreaseChange
  && miningMiningAreaMergerChange == specMiningMiningAreaMergerChange
  && miningMiningAreaDivisionChange == specMiningMiningAreaDivisionChange
  && miningMiningTransferInheritanceOrMerger == specMiningMiningTransferInheritanceOrMerger
  && miningMiningTransferOther == specMiningMiningTransferOther
  && miningMiningAbandonmentExtinction == specMiningMiningAbandonmentExtinction
  && miningRoyaltyRightEstablishment == specMiningRoyaltyRightEstablishment
  && miningRoyaltyAreaIncreaseChange == specMiningRoyaltyAreaIncreaseChange
  && miningRoyaltyAreaDecreaseChange == specMiningRoyaltyAreaDecreaseChange
  && miningRoyaltyTransferInheritanceOrMerger == specMiningRoyaltyTransferInheritanceOrMerger
  && miningRoyaltyTransferOther == specMiningRoyaltyTransferOther
  && miningRoyaltyExtinctionBeforeExpiry == specMiningRoyaltyExtinctionBeforeExpiry
  && miningMortgageChangeByMiningLaw51Consent == specMiningMortgageChangeByMiningLaw51Consent
  && miningMortgageRankChangeByOrderChange == specMiningMortgageRankChangeByOrderChange
  && miningMortgageTransferInheritanceOrMerger == specMiningMortgageTransferInheritanceOrMerger
  && miningMortgageTransferOther == specMiningMortgageTransferOther
  && miningMortgageRankChange == specMiningMortgageRankChange
  && miningNonMortgageRightTrust == specMiningNonMortgageRightTrust
  && miningCoOwnerWithdrawal == specMiningCoOwnerWithdrawal
  && miningIncidentalOrRestorationOrCorrection == specMiningIncidentalOrRestorationOrCorrection
  && miningCancellation == specMiningCancellation
  && placerAreaDecreaseChange == specPlacerAreaDecreaseChange
  && placerAreaMergerChange == specPlacerAreaMergerChange
  && placerAreaDivisionChange == specPlacerAreaDivisionChange
  && placerTransferInheritanceOrMerger == specPlacerTransferInheritanceOrMerger
  && placerTransferOther == specPlacerTransferOther
  && placerAbandonmentExtinction == specPlacerAbandonmentExtinction
  && placerRoyaltyAreaDecreaseChange == specPlacerRoyaltyAreaDecreaseChange
  && placerRoyaltyTransfer == specPlacerRoyaltyTransfer
  && placerRoyaltyExtinctionBeforeExpiry == specPlacerRoyaltyExtinctionBeforeExpiry
  && placerMortgageChangeByMiningLaw51Consent == specPlacerMortgageChangeByMiningLaw51Consent
  && placerMortgageRankChangeByOrderChange == specPlacerMortgageRankChangeByOrderChange
  && placerMortgageTransferInheritanceOrMerger == specPlacerMortgageTransferInheritanceOrMerger
  && placerMortgageTransferOther == specPlacerMortgageTransferOther
  && placerMortgageRankChange == specPlacerMortgageRankChange
  && placerNonMortgageRightTrust == specPlacerNonMortgageRightTrust
  && placerCoOwnerWithdrawal == specPlacerCoOwnerWithdrawal
  && placerIncidentalOrRestorationOrCorrection == specPlacerIncidentalOrRestorationOrCorrection
  && placerCancellation == specPlacerCancellation
  && damagesRestorationOrCorrection == specDamagesRestorationOrCorrection
  && damagesCancellation == specDamagesCancellation
  && specialExplorationAreaDecrease == specSpecialExplorationAreaDecrease
  && specialExplorationAbandonmentExtinction == specSpecialExplorationAbandonmentExtinction
  && specialMiningAreaDecrease == specSpecialMiningAreaDecrease
  && specialMiningAbandonmentExtinction == specSpecialMiningAbandonmentExtinction
  && specialMortgageRankChangeByOrderChange == specSpecialMortgageRankChangeByOrderChange
  && specialMortgageRankChange == specSpecialMortgageRankChange
  && specialCoOwnerWithdrawal == specSpecialCoOwnerWithdrawal
  && specialIncidentalOrRestorationOrCorrection == specSpecialIncidentalOrRestorationOrCorrection
  && specialCancellation == specSpecialCancellation
  && storageExplorationRightEstablishment == specStorageExplorationRightEstablishment
  && storageExplorationAreaIncreaseChange == specStorageExplorationAreaIncreaseChange
  && storageExplorationAreaDecreaseChange == specStorageExplorationAreaDecreaseChange
  && storageExplorationTransferInheritanceOrMerger == specStorageExplorationTransferInheritanceOrMerger
  && storageExplorationTransferOther == specStorageExplorationTransferOther
  && storageRightEstablishment == specStorageRightEstablishment
  && storageAreaIncreaseChange == specStorageAreaIncreaseChange
  && storageAreaDecreaseChange == specStorageAreaDecreaseChange
  && storageAreaMergerChange == specStorageAreaMergerChange
  && storageAreaDivisionChange == specStorageAreaDivisionChange
  && storageTransferInheritanceOrMerger == specStorageTransferInheritanceOrMerger
  && storageTransferOther == specStorageTransferOther
  && storageMortgageChangeByCO2LawConsent == specStorageMortgageChangeByCO2LawConsent
  && storageMortgageRankChangeByOrderChange == specStorageMortgageRankChangeByOrderChange
  && storageMortgageTransferInheritanceOrMerger == specStorageMortgageTransferInheritanceOrMerger
  && storageMortgageTransferOther == specStorageMortgageTransferOther
  && storageMortgageRankChange == specStorageMortgageRankChange
  && storageNonMortgageRightTrust == specStorageNonMortgageRightTrust

example : agreeRegistryMiningFees = true := by decide

end JapanTaxLaw.RegistryMiningFees
