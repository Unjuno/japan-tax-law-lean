import JapanTaxLaw.TaxFinance

/-!
# RegistryMiningFees — 登録免許税法 別表第一（二）十九〜二十二の二（鉱業権・租鉱権・砂鉱権・特定鉱業権・試掘権／貯留権）の手数料モデル (W-Y)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_rem_A.txt（十九　鉱業権又は租鉱権 〜
    二十二の二　試掘権又は貯留権の（十二）ロまで。冒頭の育成者権の末尾は前区分のため対象外。）

原文の各 fee string を読み、割合型は税率定数 `TaxRate ⟨X, 1000, …⟩` と税額関数
`base.applyFloor`（= 課税標準 × X / 1000、切り捨て）、面積型・定額型は `Money` 定数として
モデル化する。担当範囲は 5 区分、55 の号／サブ区分、99 の fee string:

  十九   鉱業権又は租鉱権（砂鉱を目的とするものを除く。）の登録 .... 31 件（割合 2 + 定額 29）
  二十   砂鉱権又は租鉱権（砂鉱に係るものに限る。）の登録 ...... 24 件（割合 2 + 面積 4 + 定額 18）
  二十一 鉱業法第百十四条第二項（予定された損害賠償額の登録）の登録 .. 3 件（割合 1 + 定額 2）
  二十二 特定鉱業権の登録 .................................. 21 件（割合 2 + 面積 10 + 定額 9）
  二十二の二 試掘権又は貯留権の登録 ............................ 20 件（割合 2 + 定額 18）

割合はすべて整数千分率（千分の四＝4/1000、千分の二＝2/1000、千分の一＝1/1000）で
分母は 1000。**小数点率（千分の二・五等）は本担当範囲に存在しない**。分母を 10000 と
誤る 10 倍過大の過去バグを避けるため、各率定数の分子・分母を smoke で厳重に検証する。
面積型はすべて「十万平方メートルにつき△△円」であり、定数はその 1 単位（100,000 m²）
あたりの円額を表す。実際の面積を 100,000 m² 単位に直す除法・端数処理は caller-established。

各 fee string と本モジュールの def の対応は、下記 def の doc-comment に原文の fee 文言を
一字も変えず保持して記録する（例: 「鉱区の数一個につき九万円」「鉱区の面積十万平方メートルにつき四千五百円」
「債権金額又は極度金額千分の四」）。

Scope & honest boundaries:

  * 課税標準（「鉱区の数」「租鉱区の数」「共同開発鉱区の数」「抵当権の件数」「不動産の個数」、
    「債権金額又は極度金額」「損害賠償の支払金額」、および面積）は **caller-established**。
    本モデルは与えられた base に率を乗じる算術（および定額・面積単価）のみを扱い、
    価額の算定・評価、面積の単位換算・端数処理は一切行わない。
  * 登記／登録の該当性・原因判定（相続／法人の合併／その他、設定／変更／移転／消滅／信託／
    抵当権、砂鉱の別、鉱区の増加／減少／合併／分割、二酸化炭素の貯留事業等）、件数・個数・
    面積、軽減・免税の適用可否は **caller-established** とし、Bool を金額計算式に入れない。
  * 定額・面積型は 1 件／1 個／1 区画／100,000 m² あたりの定数のみを与え、件数・面積を掛ける
    Nat 掛け算は行わない。登録区分（一）〜（二十一）等の選択も呼び出し側が行う。
  * 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」で端数規定を
    持たないため、floor を per-law business data として採用した。
  * 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
    代わりに各率定数の `den_pos` と各定数の正性、各税額関数の smoke を付与する。
  * 二十二の二（十三）は担当範囲原文が文中で途切れており fee string を持たないため
    モデル化しない。担当範囲外の号・他の別表・登録免許税法全体（免税・軽減、納税義務者等）は
    **NOT YET COVERED**。pinned evidence は doc-comment のみで、各定理は実法的意味ではなく
    モデルの性質のみを主張する（誠実性の原則）。

本モジュールの def は 率定数 9 + 税額関数 9 + 面積定数 14 + 定額定数 76
= 108 本、well-definedness 定理 99 本（率の分母正性 9 + 定数正性 90）
および単調性 1 本。
-/

namespace JapanTaxLaw.RegistryMiningFees

open JapanTaxLaw.TaxFinance

/-! ==================== 割合型（税率定数と税額関数；整数千分率は分母 1000） ==================== -/

/-- 十九（十三） 抵当権の設定又は鉱業権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（4/1000）。 -/
def miningMortgageEstablishment : TaxRate := ⟨4, 1000, by decide⟩

/-- 十九（十三） 抵当権の設定又は鉱業権若しくは抵当権の処分の制限の登録 の税額 = 課税標準 × 4/1000（切り捨て）。債権金額又は極度金額千分の四 -/
def miningMortgageEstablishmentFee (base : Money) : Money := miningMortgageEstablishment.applyFloor base

/-- 十九（十八）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（2/1000）。 -/
def miningMortgageTrust : TaxRate := ⟨2, 1000, by decide⟩

/-- 十九（十八）イ 抵当権の信託の登録 の税額 = 課税標準 × 2/1000（切り捨て）。債権金額又は極度金額千分の二 -/
def miningMortgageTrustFee (base : Money) : Money := miningMortgageTrust.applyFloor base

/-- 二十（九） 抵当権の設定又は砂鉱権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（4/1000）。 -/
def placerMortgageEstablishment : TaxRate := ⟨4, 1000, by decide⟩

/-- 二十（九） 抵当権の設定又は砂鉱権若しくは抵当権の処分の制限の登録 の税額 = 課税標準 × 4/1000（切り捨て）。債権金額又は極度金額千分の四 -/
def placerMortgageEstablishmentFee (base : Money) : Money := placerMortgageEstablishment.applyFloor base

/-- 二十（十四）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（2/1000）。 -/
def placerMortgageTrust : TaxRate := ⟨2, 1000, by decide⟩

/-- 二十（十四）イ 抵当権の信託の登録 の税額 = 課税標準 × 2/1000（切り捨て）。債権金額又は極度金額千分の二 -/
def placerMortgageTrustFee (base : Money) : Money := placerMortgageTrust.applyFloor base

/-- 二十一（一） 新規登録（予定された損害賠償額の登録） — 損害賠償の支払金額千分の一（1/1000）。 -/
def damagesRegistration : TaxRate := ⟨1, 1000, by decide⟩

/-- 二十一（一） 新規登録（予定された損害賠償額の登録） の税額 = 課税標準 × 1/1000（切り捨て）。損害賠償の支払金額千分の一 -/
def damagesRegistrationFee (base : Money) : Money := damagesRegistration.applyFloor base

/-- 二十二（十） 抵当権の設定又は特定鉱業権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（4/1000）。 -/
def specialMiningMortgageEstablishment : TaxRate := ⟨4, 1000, by decide⟩

/-- 二十二（十） 抵当権の設定又は特定鉱業権若しくは抵当権の処分の制限の登録 の税額 = 課税標準 × 4/1000（切り捨て）。債権金額又は極度金額千分の四 -/
def specialMiningMortgageEstablishmentFee (base : Money) : Money := specialMiningMortgageEstablishment.applyFloor base

/-- 二十二（十四）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（2/1000）。 -/
def specialMiningMortgageTrust : TaxRate := ⟨2, 1000, by decide⟩

/-- 二十二（十四）イ 抵当権の信託の登録 の税額 = 課税標準 × 2/1000（切り捨て）。債権金額又は極度金額千分の二 -/
def specialMiningMortgageTrustFee (base : Money) : Money := specialMiningMortgageTrust.applyFloor base

/-- 二十二の二（七） 抵当権の設定又は試掘権、貯留権若しくは抵当権の処分の制限の登録 — 債権金額又は極度金額千分の四（4/1000）。 -/
def storageMortgageEstablishment : TaxRate := ⟨4, 1000, by decide⟩

/-- 二十二の二（七） 抵当権の設定又は試掘権、貯留権若しくは抵当権の処分の制限の登録 の税額 = 課税標準 × 4/1000（切り捨て）。債権金額又は極度金額千分の四 -/
def storageMortgageEstablishmentFee (base : Money) : Money := storageMortgageEstablishment.applyFloor base

/-- 二十二の二（十二）イ 抵当権の信託の登録 — 債権金額又は極度金額千分の二（2/1000）。 -/
def storageMortgageTrust : TaxRate := ⟨2, 1000, by decide⟩

/-- 二十二の二（十二）イ 抵当権の信託の登録 の税額 = 課税標準 × 2/1000（切り捨て）。債権金額又は極度金額千分の二 -/
def storageMortgageTrustFee (base : Money) : Money := storageMortgageTrust.applyFloor base

/-! ==================== 面積型（十万平方メートル 1 単位あたりの円額；面積は caller-established） ==================== -/

/-- 二十（一） 砂鉱権の設定の登録 — 鉱区の面積十万平方メートルにつき四千五百円（¥4_500／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def placerRightEstablishmentPerArea : Money := 4_500

/-- 二十（二）イ 鉱区の増加又は鉱区の増加及び減少による砂鉱権の変更の登録 — 増加した鉱区の面積十万平方メートルにつき三千円（¥3_000／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def placerIncreasedAreaChangePerArea : Money := 3_000

/-- 二十（五） 租鉱権の設定の登録 — 租鉱区の面積十万平方メートルにつき四百五十円（¥450／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def placerRoyaltyEstablishmentPerArea : Money := 450

/-- 二十（六）イ 租鉱区の増加又は租鉱区の増加及び減少による租鉱権の変更の登録 — 増加した租鉱区の面積十万平方メートルにつき三百円（¥300／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def placerIncreasedRoyaltyAreaChangePerArea : Money := 300

/-- 二十二（一） 探査権の設定の登録 — 共同開発鉱区の面積十万平方メートルにつき三百円（¥300／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialExplorationEstablishmentPerArea : Money := 300

/-- 二十二（三）イ 探査権の移転の登録（相続又は法人の合併） — 共同開発鉱区の面積十万平方メートルにつき三十円（¥30／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialExplorationTransferInheritanceOrMergerPerArea : Money := 30

/-- 二十二（三）ロ 探査権の移転の登録（その他の原因） — 共同開発鉱区の面積十万平方メートルにつき百五十円（¥150／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialExplorationTransferOtherPerArea : Money := 150

/-- 二十二（五） 採掘権の設定の登録 — 共同開発鉱区の面積十万平方メートルにつき二千四百円（¥2_400／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialMiningRightEstablishmentPerArea : Money := 2_400

/-- 二十二（六） 採掘権の存続期間の延長の登録 — 共同開発鉱区の面積十万平方メートルにつき二百四十円（¥240／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialMiningTermExtensionPerArea : Money := 240

/-- 二十二（八）イ 採掘権の移転の登録（相続又は法人の合併） — 共同開発鉱区の面積十万平方メートルにつき二百四十円（¥240／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialMiningTransferInheritanceOrMergerPerArea : Money := 240

/-- 二十二（八）ロ 採掘権の移転の登録（その他の原因） — 共同開発鉱区の面積十万平方メートルにつき千二百円（¥1_200／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialMiningTransferOtherPerArea : Money := 1_200

/-- 二十二（十二）イ 抵当権の移転の登録（相続又は法人の合併） — 共同開発鉱区の面積十万平方メートルにつき六十円（¥60／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialMortgageTransferInheritanceOrMergerPerArea : Money := 60

/-- 二十二（十二）ロ 抵当権の移転の登録（その他の原因） — 共同開発鉱区の面積十万平方メートルにつき百二十円（¥120／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialMortgageTransferOtherPerArea : Money := 120

/-- 二十二（十四）ロ 抵当権以外の権利の信託の登録 — 共同開発鉱区の面積十万平方メートルにつき百二十円（¥120／十万平方メートル）。
    面積（十万平方メートル単位の数）は caller-established。 -/
def specialNonMortgageRightTrustPerArea : Money := 120

/-! ==================== 定額型（一件／一個／一区画あたりの円額；件数・個数は caller-established） ==================== -/

/-- 十九（一） 試掘権の設定の登録 — 鉱区の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def miningTrialMiningRightEstablishment : Money := 90_000

/-- 十九（二）イ 鉱区の増加又は鉱区の増加及び減少による試掘権の変更の登録 — 鉱区の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def miningTrialAreaIncreaseChange : Money := 45_000

/-- 十九（二）ロ 鉱区の減少による試掘権の変更の登録 — 鉱区の数一個につき六千円（¥6_000）。件数・個数は caller-established。 -/
def miningTrialAreaDecreaseChange : Money := 6_000

/-- 十九（三）イ 試掘権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def miningTrialTransferInheritanceOrMerger : Money := 9_000

/-- 十九（三）ロ 試掘権の移転の登録（その他の原因） — 鉱区の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def miningTrialTransferOther : Money := 45_000

/-- 十九（四） 放棄による試掘権の消滅の登録 — 鉱区の数一個につき三千円（¥3_000）。件数・個数は caller-established。 -/
def miningTrialAbandonmentExtinction : Money := 3_000

/-- 十九（五） 採掘権の設定の登録 — 鉱区の数一個につき十八万円（¥180_000）。件数・個数は caller-established。 -/
def miningMiningRightEstablishment : Money := 180_000

/-- 十九（六）イ 鉱区の増加又は鉱区の増加及び減少による採掘権の変更の登録 — 鉱区の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def miningMiningAreaIncreaseChange : Money := 90_000

/-- 十九（六）ロ 鉱区の減少による採掘権の変更の登録 — 鉱区の数一個につき一万二千円（¥12_000）。件数・個数は caller-established。 -/
def miningMiningAreaDecreaseChange : Money := 12_000

/-- 十九（六）ハ 鉱区の合併による採掘権の変更の登録（合併後） — 合併後の鉱区の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def miningMiningAreaMergerChange : Money := 45_000

/-- 十九（六）ニ 鉱区の分割による採掘権の変更の登録（分割後） — 分割後の鉱区の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def miningMiningAreaDivisionChange : Money := 45_000

/-- 十九（七）イ 採掘権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき一万八千円（¥18_000）。件数・個数は caller-established。 -/
def miningMiningTransferInheritanceOrMerger : Money := 18_000

/-- 十九（七）ロ 採掘権の移転の登録（その他の原因） — 鉱区の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def miningMiningTransferOther : Money := 90_000

/-- 十九（八） 放棄による採掘権の消滅の登録 — 鉱区の数一個につき三千円（¥3_000）。件数・個数は caller-established。 -/
def miningMiningAbandonmentExtinction : Money := 3_000

/-- 十九（九） 租鉱権の設定の登録 — 鉱区の数一個につき一万八千円（¥18_000）。件数・個数は caller-established。 -/
def miningRoyaltyRightEstablishment : Money := 18_000

/-- 十九（十）イ 租鉱区の増加又は租鉱区の増加及び減少による租鉱権の変更の登録 — 租鉱区の数一個につき六千円（¥6_000）。件数・個数は caller-established。 -/
def miningRoyaltyAreaIncreaseChange : Money := 6_000

/-- 十九（十）ロ 租鉱区の減少による租鉱権の変更の登録 — 租鉱区の数一個につき千二百円（¥1_200）。件数・個数は caller-established。 -/
def miningRoyaltyAreaDecreaseChange : Money := 1_200

/-- 十九（十一）イ 租鉱権の移転の登録（相続又は法人の合併） — 租鉱区の数一個につき千八百円（¥1_800）。件数・個数は caller-established。 -/
def miningRoyaltyTransferInheritanceOrMerger : Money := 1_800

/-- 十九（十一）ロ 租鉱権の移転の登録（その他の原因） — 租鉱区の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def miningRoyaltyTransferOther : Money := 9_000

/-- 十九（十二） 存続期間の満了前の租鉱権の消滅の登録 — 租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def miningRoyaltyExtinctionBeforeExpiry : Money := 1_000

/-- 十九（十四） 鉱業法第五十一条の承諾及び協定に係る抵当権の変更の登録 — 鉱区の数一個につき三千円（¥3_000）。件数・個数は caller-established。 -/
def miningMortgageChangeByMiningLaw51Consent : Money := 3_000

/-- 十九（十五） 順位の変更による抵当権の変更の登録（（十四）を除く） — 鉱区の数一個につき六千円（¥6_000）。件数・個数は caller-established。 -/
def miningMortgageRankChangeByOrderChange : Money := 6_000

/-- 十九（十六）イ 抵当権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def miningMortgageTransferInheritanceOrMerger : Money := 4_500

/-- 十九（十六）ロ 抵当権の移転の登録（その他の原因） — 鉱区の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def miningMortgageTransferOther : Money := 9_000

/-- 十九（十七） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1_000）。件数・個数は caller-established。 -/
def miningMortgageRankChange : Money := 1_000

/-- 十九（十八）ロ 抵当権以外の権利の信託の登録 — 鉱区又は租鉱区の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def miningNonMortgageRightTrust : Money := 9_000

/-- 十九（十九） 共同鉱業権者又は共同租鉱権者の脱退の登録 — 鉱区又は租鉱区の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def miningCoOwnerWithdrawal : Money := 4_500

/-- 十九（二十） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（（一）から（十九）までを除く） — 鉱区又は租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def miningIncidentalOrRestorationOrCorrection : Money := 1_000

/-- 十九（二十一） 登録の抹消 — 鉱区又は租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def miningCancellation : Money := 1_000

/-- 二十（二）ロ 鉱区の減少による砂鉱権の変更の登録 — 鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerAreaDecreaseChange : Money := 1_000

/-- 二十（二）ハ 鉱区の合併による砂鉱権の変更の登録（合併後） — 合併後の鉱区の数一個につき二千円（¥2_000）。件数・個数は caller-established。 -/
def placerAreaMergerChange : Money := 2_000

/-- 二十（二）ニ 鉱区の分割による砂鉱権の変更の登録（分割後） — 分割後の鉱区の数一個につき二千円（¥2_000）。件数・個数は caller-established。 -/
def placerAreaDivisionChange : Money := 2_000

/-- 二十（三）イ 砂鉱権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def placerTransferInheritanceOrMerger : Money := 4_500

/-- 二十（三）ロ 砂鉱権の移転の登録（その他の原因） — 鉱区の数一個につき一万三千五百円（¥13_500）。件数・個数は caller-established。 -/
def placerTransferOther : Money := 13_500

/-- 二十（四） 放棄による砂鉱権の消滅の登録 — 鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerAbandonmentExtinction : Money := 1_000

/-- 二十（六）ロ 租鉱区の減少による租鉱権の変更の登録 — 租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerRoyaltyAreaDecreaseChange : Money := 1_000

/-- 二十（七） 租鉱権の移転の登録 — 租鉱区の数一個につき千五百円（¥1_500）。件数・個数は caller-established。 -/
def placerRoyaltyTransfer : Money := 1_500

/-- 二十（八） 存続期間満了前の租鉱権の消滅の登録 — 租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerRoyaltyExtinctionBeforeExpiry : Money := 1_000

/-- 二十（十） 鉱業法第五十一条の承諾及び協定に係る抵当権の変更の登録 — 鉱区の数一個につき三千円（¥3_000）。件数・個数は caller-established。 -/
def placerMortgageChangeByMiningLaw51Consent : Money := 3_000

/-- 二十（十一） 順位の変更による抵当権の変更の登録（（十）を除く） — 鉱区の数一個につき六千円（¥6_000）。件数・個数は caller-established。 -/
def placerMortgageRankChangeByOrderChange : Money := 6_000

/-- 二十（十二）イ 抵当権の移転の登録（相続又は法人の合併） — 鉱区の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def placerMortgageTransferInheritanceOrMerger : Money := 4_500

/-- 二十（十二）ロ 抵当権の移転の登録（その他の原因） — 鉱区の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def placerMortgageTransferOther : Money := 9_000

/-- 二十（十三） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerMortgageRankChange : Money := 1_000

/-- 二十（十四）ロ 抵当権以外の権利の信託の登録 — 鉱区又は租鉱区の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def placerNonMortgageRightTrust : Money := 4_500

/-- 二十（十五） 共同砂鉱権者又は共同租鉱権者の脱退の登録 — 鉱区又は租鉱区の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def placerCoOwnerWithdrawal : Money := 4_500

/-- 二十（十六） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（（一）から（十五）までを除く） — 鉱区又は租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerIncidentalOrRestorationOrCorrection : Money := 1_000

/-- 二十（十七） 登録の抹消 — 鉱区又は租鉱区の数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def placerCancellation : Money := 1_000

/-- 二十一（二） 抹消した登録の回復又は登録の更正若しくは変更の登録 — 不動産の個数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def damagesRestorationOrCorrection : Money := 1_000

/-- 二十一（三） 登録の抹消 — 不動産の個数一個につき千円（¥1_000）。件数・個数は caller-established。 -/
def damagesCancellation : Money := 1_000

/-- 二十二（二） 探査権の共同開発鉱区の減少の登録 — 共同開発鉱区の減少をする部分の数一個につき十二万円（¥120_000）。件数・個数は caller-established。 -/
def specialExplorationAreaDecrease : Money := 120_000

/-- 二十二（四） 放棄による探査権の消滅の登録 — 共同開発鉱区の数一個につき六万円（¥60_000）。件数・個数は caller-established。 -/
def specialExplorationAbandonmentExtinction : Money := 60_000

/-- 二十二（七） 採掘権の共同開発鉱区の減少の登録 — 共同開発鉱区の減少をする部分の数一個につき二十四万円（¥240_000）。件数・個数は caller-established。 -/
def specialMiningAreaDecrease : Money := 240_000

/-- 二十二（九） 放棄による採掘権の消滅の登録 — 共同開発鉱区の数一個につき六万円（¥60_000）。件数・個数は caller-established。 -/
def specialMiningAbandonmentExtinction : Money := 60_000

/-- 二十二（十一） 順位の変更による抵当権の変更の登録 — 共同開発鉱区の数一個につき十二万円（¥120_000）。件数・個数は caller-established。 -/
def specialMortgageRankChangeByOrderChange : Money := 120_000

/-- 二十二（十三） 抵当権の順位の変更の登録 — 抵当権の件数一件につき二万円（¥20_000）。件数・個数は caller-established。 -/
def specialMortgageRankChange : Money := 20_000

/-- 二十二（十五） 特定鉱業権共有者の脱退の登録 — 共同開発鉱区の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def specialCoOwnerWithdrawal : Money := 90_000

/-- 二十二（十六） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録（（一）から（十五）までを除く） — 共同開発鉱区の数一個につき二万円（¥20_000）。件数・個数は caller-established。 -/
def specialIncidentalOrRestorationOrCorrection : Money := 20_000

/-- 二十二（十七） 登録の抹消 — 共同開発鉱区の数一個につき二万円（¥20_000）。件数・個数は caller-established。 -/
def specialCancellation : Money := 20_000

/-- 二十二の二（一） 試掘権の設定の登録 — 試掘区域の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def storageExplorationRightEstablishment : Money := 90_000

/-- 二十二の二（二）イ 試掘区域の増加又は試掘区域の増加及び減少による試掘権の変更の登録 — 試掘区域の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def storageExplorationAreaIncreaseChange : Money := 45_000

/-- 二十二の二（二）ロ 試掘区域の減少による試掘権の変更の登録 — 試掘区域の数一個につき六千円（¥6_000）。件数・個数は caller-established。 -/
def storageExplorationAreaDecreaseChange : Money := 6_000

/-- 二十二の二（三）イ 試掘権の移転の登録（相続又は法人の合併） — 試掘区域の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def storageExplorationTransferInheritanceOrMerger : Money := 9_000

/-- 二十二の二（三）ロ 試掘権の移転の登録（その他の原因） — 試掘区域の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def storageExplorationTransferOther : Money := 45_000

/-- 二十二の二（四） 貯留権の設定の登録 — 貯留区域の数一個につき十八万円（¥180_000）。件数・個数は caller-established。 -/
def storageRightEstablishment : Money := 180_000

/-- 二十二の二（五）イ 貯留区域の増加又は貯留区域の増加及び減少による貯留権の変更の登録 — 貯留区域の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def storageAreaIncreaseChange : Money := 90_000

/-- 二十二の二（五）ロ 貯留区域の減少による貯留権の変更の登録 — 貯留区域の数一個につき一万二千円（¥12_000）。件数・個数は caller-established。 -/
def storageAreaDecreaseChange : Money := 12_000

/-- 二十二の二（五）ハ 貯留区域の合併による貯留権の変更の登録（合併後） — 合併後の貯留区域の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def storageAreaMergerChange : Money := 45_000

/-- 二十二の二（五）ニ 貯留区域の分割による貯留権の変更の登録（分割後） — 分割後の貯留区域の数一個につき四万五千円（¥45_000）。件数・個数は caller-established。 -/
def storageAreaDivisionChange : Money := 45_000

/-- 二十二の二（六）イ 貯留権の移転の登録（相続又は法人の合併） — 貯留区域の数一個につき一万八千円（¥18_000）。件数・個数は caller-established。 -/
def storageTransferInheritanceOrMerger : Money := 18_000

/-- 二十二の二（六）ロ 貯留権の移転の登録（その他の原因） — 貯留区域の数一個につき九万円（¥90_000）。件数・個数は caller-established。 -/
def storageTransferOther : Money := 90_000

/-- 二十二の二（八） 二酸化炭素の貯留事業に関する法律第十六条第五項の承諾及び協定に係る抵当権の変更の登録 — 貯留区域の数一個につき三千円（¥3_000）。件数・個数は caller-established。 -/
def storageMortgageChangeByCO2LawConsent : Money := 3_000

/-- 二十二の二（九） 順位の変更による抵当権の変更の登録（（八）を除く） — 貯留区域の数一個につき六千円（¥6_000）。件数・個数は caller-established。 -/
def storageMortgageRankChangeByOrderChange : Money := 6_000

/-- 二十二の二（十）イ 抵当権の移転の登録（相続又は法人の合併） — 貯留区域の数一個につき四千五百円（¥4_500）。件数・個数は caller-established。 -/
def storageMortgageTransferInheritanceOrMerger : Money := 4_500

/-- 二十二の二（十）ロ 抵当権の移転の登録（その他の原因） — 貯留区域の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def storageMortgageTransferOther : Money := 9_000

/-- 二十二の二（十一） 抵当権の順位の変更の登録 — 抵当権の件数一件につき千円（¥1_000）。件数・個数は caller-established。 -/
def storageMortgageRankChange : Money := 1_000

/-- 二十二の二（十二）ロ 抵当権以外の権利の信託の登録 — 試掘区域又は貯留区域の数一個につき九千円（¥9_000）。件数・個数は caller-established。 -/
def storageNonMortgageRightTrust : Money := 9_000

/-! ==================== well-definedness（positivity） ==================== -/

theorem miningMortgageEstablishment_den_pos : 0 < miningMortgageEstablishment.den := by decide
theorem miningMortgageTrust_den_pos : 0 < miningMortgageTrust.den := by decide
theorem placerMortgageEstablishment_den_pos : 0 < placerMortgageEstablishment.den := by decide
theorem placerMortgageTrust_den_pos : 0 < placerMortgageTrust.den := by decide
theorem damagesRegistration_den_pos : 0 < damagesRegistration.den := by decide
theorem specialMiningMortgageEstablishment_den_pos : 0 < specialMiningMortgageEstablishment.den := by decide
theorem specialMiningMortgageTrust_den_pos : 0 < specialMiningMortgageTrust.den := by decide
theorem storageMortgageEstablishment_den_pos : 0 < storageMortgageEstablishment.den := by decide
theorem storageMortgageTrust_den_pos : 0 < storageMortgageTrust.den := by decide

theorem placerRightEstablishmentPerArea_pos : placerRightEstablishmentPerArea > 0 := by decide
theorem placerIncreasedAreaChangePerArea_pos : placerIncreasedAreaChangePerArea > 0 := by decide
theorem placerRoyaltyEstablishmentPerArea_pos : placerRoyaltyEstablishmentPerArea > 0 := by decide
theorem placerIncreasedRoyaltyAreaChangePerArea_pos : placerIncreasedRoyaltyAreaChangePerArea > 0 := by decide
theorem specialExplorationEstablishmentPerArea_pos : specialExplorationEstablishmentPerArea > 0 := by decide
theorem specialExplorationTransferInheritanceOrMergerPerArea_pos : specialExplorationTransferInheritanceOrMergerPerArea > 0 := by decide
theorem specialExplorationTransferOtherPerArea_pos : specialExplorationTransferOtherPerArea > 0 := by decide
theorem specialMiningRightEstablishmentPerArea_pos : specialMiningRightEstablishmentPerArea > 0 := by decide
theorem specialMiningTermExtensionPerArea_pos : specialMiningTermExtensionPerArea > 0 := by decide
theorem specialMiningTransferInheritanceOrMergerPerArea_pos : specialMiningTransferInheritanceOrMergerPerArea > 0 := by decide
theorem specialMiningTransferOtherPerArea_pos : specialMiningTransferOtherPerArea > 0 := by decide
theorem specialMortgageTransferInheritanceOrMergerPerArea_pos : specialMortgageTransferInheritanceOrMergerPerArea > 0 := by decide
theorem specialMortgageTransferOtherPerArea_pos : specialMortgageTransferOtherPerArea > 0 := by decide
theorem specialNonMortgageRightTrustPerArea_pos : specialNonMortgageRightTrustPerArea > 0 := by decide
theorem miningTrialMiningRightEstablishment_pos : miningTrialMiningRightEstablishment > 0 := by decide
theorem miningTrialAreaIncreaseChange_pos : miningTrialAreaIncreaseChange > 0 := by decide
theorem miningTrialAreaDecreaseChange_pos : miningTrialAreaDecreaseChange > 0 := by decide
theorem miningTrialTransferInheritanceOrMerger_pos : miningTrialTransferInheritanceOrMerger > 0 := by decide
theorem miningTrialTransferOther_pos : miningTrialTransferOther > 0 := by decide
theorem miningTrialAbandonmentExtinction_pos : miningTrialAbandonmentExtinction > 0 := by decide
theorem miningMiningRightEstablishment_pos : miningMiningRightEstablishment > 0 := by decide
theorem miningMiningAreaIncreaseChange_pos : miningMiningAreaIncreaseChange > 0 := by decide
theorem miningMiningAreaDecreaseChange_pos : miningMiningAreaDecreaseChange > 0 := by decide
theorem miningMiningAreaMergerChange_pos : miningMiningAreaMergerChange > 0 := by decide
theorem miningMiningAreaDivisionChange_pos : miningMiningAreaDivisionChange > 0 := by decide
theorem miningMiningTransferInheritanceOrMerger_pos : miningMiningTransferInheritanceOrMerger > 0 := by decide
theorem miningMiningTransferOther_pos : miningMiningTransferOther > 0 := by decide
theorem miningMiningAbandonmentExtinction_pos : miningMiningAbandonmentExtinction > 0 := by decide
theorem miningRoyaltyRightEstablishment_pos : miningRoyaltyRightEstablishment > 0 := by decide
theorem miningRoyaltyAreaIncreaseChange_pos : miningRoyaltyAreaIncreaseChange > 0 := by decide
theorem miningRoyaltyAreaDecreaseChange_pos : miningRoyaltyAreaDecreaseChange > 0 := by decide
theorem miningRoyaltyTransferInheritanceOrMerger_pos : miningRoyaltyTransferInheritanceOrMerger > 0 := by decide
theorem miningRoyaltyTransferOther_pos : miningRoyaltyTransferOther > 0 := by decide
theorem miningRoyaltyExtinctionBeforeExpiry_pos : miningRoyaltyExtinctionBeforeExpiry > 0 := by decide
theorem miningMortgageChangeByMiningLaw51Consent_pos : miningMortgageChangeByMiningLaw51Consent > 0 := by decide
theorem miningMortgageRankChangeByOrderChange_pos : miningMortgageRankChangeByOrderChange > 0 := by decide
theorem miningMortgageTransferInheritanceOrMerger_pos : miningMortgageTransferInheritanceOrMerger > 0 := by decide
theorem miningMortgageTransferOther_pos : miningMortgageTransferOther > 0 := by decide
theorem miningMortgageRankChange_pos : miningMortgageRankChange > 0 := by decide
theorem miningNonMortgageRightTrust_pos : miningNonMortgageRightTrust > 0 := by decide
theorem miningCoOwnerWithdrawal_pos : miningCoOwnerWithdrawal > 0 := by decide
theorem miningIncidentalOrRestorationOrCorrection_pos : miningIncidentalOrRestorationOrCorrection > 0 := by decide
theorem miningCancellation_pos : miningCancellation > 0 := by decide
theorem placerAreaDecreaseChange_pos : placerAreaDecreaseChange > 0 := by decide
theorem placerAreaMergerChange_pos : placerAreaMergerChange > 0 := by decide
theorem placerAreaDivisionChange_pos : placerAreaDivisionChange > 0 := by decide
theorem placerTransferInheritanceOrMerger_pos : placerTransferInheritanceOrMerger > 0 := by decide
theorem placerTransferOther_pos : placerTransferOther > 0 := by decide
theorem placerAbandonmentExtinction_pos : placerAbandonmentExtinction > 0 := by decide
theorem placerRoyaltyAreaDecreaseChange_pos : placerRoyaltyAreaDecreaseChange > 0 := by decide
theorem placerRoyaltyTransfer_pos : placerRoyaltyTransfer > 0 := by decide
theorem placerRoyaltyExtinctionBeforeExpiry_pos : placerRoyaltyExtinctionBeforeExpiry > 0 := by decide
theorem placerMortgageChangeByMiningLaw51Consent_pos : placerMortgageChangeByMiningLaw51Consent > 0 := by decide
theorem placerMortgageRankChangeByOrderChange_pos : placerMortgageRankChangeByOrderChange > 0 := by decide
theorem placerMortgageTransferInheritanceOrMerger_pos : placerMortgageTransferInheritanceOrMerger > 0 := by decide
theorem placerMortgageTransferOther_pos : placerMortgageTransferOther > 0 := by decide
theorem placerMortgageRankChange_pos : placerMortgageRankChange > 0 := by decide
theorem placerNonMortgageRightTrust_pos : placerNonMortgageRightTrust > 0 := by decide
theorem placerCoOwnerWithdrawal_pos : placerCoOwnerWithdrawal > 0 := by decide
theorem placerIncidentalOrRestorationOrCorrection_pos : placerIncidentalOrRestorationOrCorrection > 0 := by decide
theorem placerCancellation_pos : placerCancellation > 0 := by decide
theorem damagesRestorationOrCorrection_pos : damagesRestorationOrCorrection > 0 := by decide
theorem damagesCancellation_pos : damagesCancellation > 0 := by decide
theorem specialExplorationAreaDecrease_pos : specialExplorationAreaDecrease > 0 := by decide
theorem specialExplorationAbandonmentExtinction_pos : specialExplorationAbandonmentExtinction > 0 := by decide
theorem specialMiningAreaDecrease_pos : specialMiningAreaDecrease > 0 := by decide
theorem specialMiningAbandonmentExtinction_pos : specialMiningAbandonmentExtinction > 0 := by decide
theorem specialMortgageRankChangeByOrderChange_pos : specialMortgageRankChangeByOrderChange > 0 := by decide
theorem specialMortgageRankChange_pos : specialMortgageRankChange > 0 := by decide
theorem specialCoOwnerWithdrawal_pos : specialCoOwnerWithdrawal > 0 := by decide
theorem specialIncidentalOrRestorationOrCorrection_pos : specialIncidentalOrRestorationOrCorrection > 0 := by decide
theorem specialCancellation_pos : specialCancellation > 0 := by decide
theorem storageExplorationRightEstablishment_pos : storageExplorationRightEstablishment > 0 := by decide
theorem storageExplorationAreaIncreaseChange_pos : storageExplorationAreaIncreaseChange > 0 := by decide
theorem storageExplorationAreaDecreaseChange_pos : storageExplorationAreaDecreaseChange > 0 := by decide
theorem storageExplorationTransferInheritanceOrMerger_pos : storageExplorationTransferInheritanceOrMerger > 0 := by decide
theorem storageExplorationTransferOther_pos : storageExplorationTransferOther > 0 := by decide
theorem storageRightEstablishment_pos : storageRightEstablishment > 0 := by decide
theorem storageAreaIncreaseChange_pos : storageAreaIncreaseChange > 0 := by decide
theorem storageAreaDecreaseChange_pos : storageAreaDecreaseChange > 0 := by decide
theorem storageAreaMergerChange_pos : storageAreaMergerChange > 0 := by decide
theorem storageAreaDivisionChange_pos : storageAreaDivisionChange > 0 := by decide
theorem storageTransferInheritanceOrMerger_pos : storageTransferInheritanceOrMerger > 0 := by decide
theorem storageTransferOther_pos : storageTransferOther > 0 := by decide
theorem storageMortgageChangeByCO2LawConsent_pos : storageMortgageChangeByCO2LawConsent > 0 := by decide
theorem storageMortgageRankChangeByOrderChange_pos : storageMortgageRankChangeByOrderChange > 0 := by decide
theorem storageMortgageTransferInheritanceOrMerger_pos : storageMortgageTransferInheritanceOrMerger > 0 := by decide
theorem storageMortgageTransferOther_pos : storageMortgageTransferOther > 0 := by decide
theorem storageMortgageRankChange_pos : storageMortgageRankChange > 0 := by decide
theorem storageNonMortgageRightTrust_pos : storageNonMortgageRightTrust > 0 := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem miningRateFeeMono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  simp [TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)

/-! ==================== smoke（各 def、すべて kernel-decide） ==================== -/

-- 率定数: 分子・分母が原文どおり（整数千分率 = X/1000、10 倍バグ監視）
example : miningMortgageEstablishment.num = 4 := by decide
example : miningMortgageEstablishment.den = 1000 := by decide
example : miningMortgageTrust.num = 2 := by decide
example : miningMortgageTrust.den = 1000 := by decide
example : placerMortgageEstablishment.num = 4 := by decide
example : placerMortgageEstablishment.den = 1000 := by decide
example : placerMortgageTrust.num = 2 := by decide
example : placerMortgageTrust.den = 1000 := by decide
example : damagesRegistration.num = 1 := by decide
example : damagesRegistration.den = 1000 := by decide
example : specialMiningMortgageEstablishment.num = 4 := by decide
example : specialMiningMortgageEstablishment.den = 1000 := by decide
example : specialMiningMortgageTrust.num = 2 := by decide
example : specialMiningMortgageTrust.den = 1000 := by decide
example : storageMortgageEstablishment.num = 4 := by decide
example : storageMortgageEstablishment.den = 1000 := by decide
example : storageMortgageTrust.num = 2 := by decide
example : storageMortgageTrust.den = 1000 := by decide

-- 面積型・定額型: 金額が原文どおり
example : placerRightEstablishmentPerArea = 4_500 := by decide
example : placerIncreasedAreaChangePerArea = 3_000 := by decide
example : placerRoyaltyEstablishmentPerArea = 450 := by decide
example : placerIncreasedRoyaltyAreaChangePerArea = 300 := by decide
example : specialExplorationEstablishmentPerArea = 300 := by decide
example : specialExplorationTransferInheritanceOrMergerPerArea = 30 := by decide
example : specialExplorationTransferOtherPerArea = 150 := by decide
example : specialMiningRightEstablishmentPerArea = 2_400 := by decide
example : specialMiningTermExtensionPerArea = 240 := by decide
example : specialMiningTransferInheritanceOrMergerPerArea = 240 := by decide
example : specialMiningTransferOtherPerArea = 1_200 := by decide
example : specialMortgageTransferInheritanceOrMergerPerArea = 60 := by decide
example : specialMortgageTransferOtherPerArea = 120 := by decide
example : specialNonMortgageRightTrustPerArea = 120 := by decide
example : miningTrialMiningRightEstablishment = 90_000 := by decide
example : miningTrialAreaIncreaseChange = 45_000 := by decide
example : miningTrialAreaDecreaseChange = 6_000 := by decide
example : miningTrialTransferInheritanceOrMerger = 9_000 := by decide
example : miningTrialTransferOther = 45_000 := by decide
example : miningTrialAbandonmentExtinction = 3_000 := by decide
example : miningMiningRightEstablishment = 180_000 := by decide
example : miningMiningAreaIncreaseChange = 90_000 := by decide
example : miningMiningAreaDecreaseChange = 12_000 := by decide
example : miningMiningAreaMergerChange = 45_000 := by decide
example : miningMiningAreaDivisionChange = 45_000 := by decide
example : miningMiningTransferInheritanceOrMerger = 18_000 := by decide
example : miningMiningTransferOther = 90_000 := by decide
example : miningMiningAbandonmentExtinction = 3_000 := by decide
example : miningRoyaltyRightEstablishment = 18_000 := by decide
example : miningRoyaltyAreaIncreaseChange = 6_000 := by decide
example : miningRoyaltyAreaDecreaseChange = 1_200 := by decide
example : miningRoyaltyTransferInheritanceOrMerger = 1_800 := by decide
example : miningRoyaltyTransferOther = 9_000 := by decide
example : miningRoyaltyExtinctionBeforeExpiry = 1_000 := by decide
example : miningMortgageChangeByMiningLaw51Consent = 3_000 := by decide
example : miningMortgageRankChangeByOrderChange = 6_000 := by decide
example : miningMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : miningMortgageTransferOther = 9_000 := by decide
example : miningMortgageRankChange = 1_000 := by decide
example : miningNonMortgageRightTrust = 9_000 := by decide
example : miningCoOwnerWithdrawal = 4_500 := by decide
example : miningIncidentalOrRestorationOrCorrection = 1_000 := by decide
example : miningCancellation = 1_000 := by decide
example : placerAreaDecreaseChange = 1_000 := by decide
example : placerAreaMergerChange = 2_000 := by decide
example : placerAreaDivisionChange = 2_000 := by decide
example : placerTransferInheritanceOrMerger = 4_500 := by decide
example : placerTransferOther = 13_500 := by decide
example : placerAbandonmentExtinction = 1_000 := by decide
example : placerRoyaltyAreaDecreaseChange = 1_000 := by decide
example : placerRoyaltyTransfer = 1_500 := by decide
example : placerRoyaltyExtinctionBeforeExpiry = 1_000 := by decide
example : placerMortgageChangeByMiningLaw51Consent = 3_000 := by decide
example : placerMortgageRankChangeByOrderChange = 6_000 := by decide
example : placerMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : placerMortgageTransferOther = 9_000 := by decide
example : placerMortgageRankChange = 1_000 := by decide
example : placerNonMortgageRightTrust = 4_500 := by decide
example : placerCoOwnerWithdrawal = 4_500 := by decide
example : placerIncidentalOrRestorationOrCorrection = 1_000 := by decide
example : placerCancellation = 1_000 := by decide
example : damagesRestorationOrCorrection = 1_000 := by decide
example : damagesCancellation = 1_000 := by decide
example : specialExplorationAreaDecrease = 120_000 := by decide
example : specialExplorationAbandonmentExtinction = 60_000 := by decide
example : specialMiningAreaDecrease = 240_000 := by decide
example : specialMiningAbandonmentExtinction = 60_000 := by decide
example : specialMortgageRankChangeByOrderChange = 120_000 := by decide
example : specialMortgageRankChange = 20_000 := by decide
example : specialCoOwnerWithdrawal = 90_000 := by decide
example : specialIncidentalOrRestorationOrCorrection = 20_000 := by decide
example : specialCancellation = 20_000 := by decide
example : storageExplorationRightEstablishment = 90_000 := by decide
example : storageExplorationAreaIncreaseChange = 45_000 := by decide
example : storageExplorationAreaDecreaseChange = 6_000 := by decide
example : storageExplorationTransferInheritanceOrMerger = 9_000 := by decide
example : storageExplorationTransferOther = 45_000 := by decide
example : storageRightEstablishment = 180_000 := by decide
example : storageAreaIncreaseChange = 90_000 := by decide
example : storageAreaDecreaseChange = 12_000 := by decide
example : storageAreaMergerChange = 45_000 := by decide
example : storageAreaDivisionChange = 45_000 := by decide
example : storageTransferInheritanceOrMerger = 18_000 := by decide
example : storageTransferOther = 90_000 := by decide
example : storageMortgageChangeByCO2LawConsent = 3_000 := by decide
example : storageMortgageRankChangeByOrderChange = 6_000 := by decide
example : storageMortgageTransferInheritanceOrMerger = 4_500 := by decide
example : storageMortgageTransferOther = 9_000 := by decide
example : storageMortgageRankChange = 1_000 := by decide
example : storageNonMortgageRightTrust = 9_000 := by decide

-- 税額関数の floor 境界 (den → num, 999 → 4/1/0)
example : miningMortgageEstablishmentFee 1_000 = 4 := by decide
example : miningMortgageEstablishmentFee 999 = 3 := by decide
example : miningMortgageTrustFee 1_000 = 2 := by decide
example : miningMortgageTrustFee 999 = 1 := by decide
example : placerMortgageEstablishmentFee 1_000 = 4 := by decide
example : placerMortgageEstablishmentFee 999 = 3 := by decide
example : placerMortgageTrustFee 1_000 = 2 := by decide
example : placerMortgageTrustFee 999 = 1 := by decide
example : damagesRegistrationFee 1_000 = 1 := by decide
example : damagesRegistrationFee 999 = 0 := by decide
example : specialMiningMortgageEstablishmentFee 1_000 = 4 := by decide
example : specialMiningMortgageEstablishmentFee 999 = 3 := by decide
example : specialMiningMortgageTrustFee 1_000 = 2 := by decide
example : specialMiningMortgageTrustFee 999 = 1 := by decide
example : storageMortgageEstablishmentFee 1_000 = 4 := by decide
example : storageMortgageEstablishmentFee 999 = 3 := by decide
example : storageMortgageTrustFee 1_000 = 2 := by decide
example : storageMortgageTrustFee 999 = 1 := by decide
end JapanTaxLaw.RegistryMiningFees
