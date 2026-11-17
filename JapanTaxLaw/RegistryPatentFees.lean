import JapanTaxLaw.TaxFinance

/-!
# RegistryPatentFees — 登録免許税法 別表第一（二）第十三号・第十四号（特許権・実用新案権）の手数料モデル (W-T)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_ip_B.txt（第十三号・第十四号）

原文の各 fee string を一字も変えず読み、金額を確定してモデル化する。
定額型は `Money` 定数、割合型（「債権金額千分のX」）は税率定数
`TaxRate ⟨X, 1000, by decide⟩` と税額関数 `rate.applyFloor`
（= 課税標準 × X / 1000、切り捨て）としてモデル化する。

  【十三 特許権の登録（特許権の信託の登録を含む。）】
  （一）イ 相続又は法人の合併による移転 .... 特許権の件数一件につき三千円 ......... ¥3,000
  （一）ロ その他の原因による移転 .......... 特許権の件数一件につき一万五千円 ..... ¥15,000
  （二）専用実施権の設定又は保存 ........... 専用実施権の件数一件につき一万五千円 ... ¥15,000
  （三）質権の設定／処分の制限 ............. 債権金額千分の四 .................... 4/1000
  （四）イ 相続・合併による移転 ............ 特許権等の件数一件につき千五百円 ...... ¥1,500
  （四）ロ その他の原因による移転 .......... 特許権等の件数一件につき三千円 ......... ¥3,000
  （五）イ 質権の信託 ..................... 債権金額千分の二 .................... 2/1000
  （五）ロ 質権以外の権利の信託 ............ 特許権等の件数一件につき三千円 ......... ¥3,000
  （六）付記・仮登録・回復・更正／変更 ..... 特許権等の件数一件につき千円 ........... ¥1,000
  （七）登録の抹消 ........................ 特許権等の件数一件につき千円 ........... ¥1,000

  【十四 実用新案権の登録（実用新案権の信託の登録を含む。）】
  （一）イ 相続又は法人の合併による移転 .... 実用新案権の件数一件につき三千円 ....... ¥3,000
  （一）ロ その他の原因による移転 .......... 実用新案権の件数一件につき九千円 ........ ¥9,000
  （二）専用実施権の設定又は保存 ........... 専用実施権の件数一件につき九千円 ........ ¥9,000
  （三）質権の設定／処分の制限 ............. 債権金額千分の四 .................... 4/1000
  （四）イ 相続・合併による移転 ............ 実用新案権等の件数一件につき千五百円 .... ¥1,500
  （四）ロ その他の原因による移転 .......... 実用新案権等の件数一件につき三千円 ...... ¥3,000
  （五）イ 質権の信託 ..................... 債権金額千分の二 .................... 2/1000
  （五）ロ 質権以外の権利の信託 ............ 実用新案権等の件数一件につき三千円 ...... ¥3,000
  （六）付記・仮登録・回復・更正／変更 ..... 実用新案権等の件数一件につき千円 ........ ¥1,000
  （七）登録の抹消 ........................ 実用新案権等の件数一件につき千円 ........ ¥1,000

Scope & honest boundaries:

* 登録の該当性・原因の判定（相続／法人の合併／その他、設定／保存／移転、質権／
  質権以外、付記・仮登録・回復・更正・変更／抹消）、件数の数え方、軽減・免税の
  適用可否は **caller-established** とする。Bool は金額計算式に入れない。
* 割合型の課税標準（「債権金額」）は **caller-established** とする。本モデルは
  与えられた `base` に税率を乗じる算術のみを扱い、債権金額の算定は行わない。
* 定額型は「件数一件につき」の 1 件あたりの定数のみを与え、件数を掛ける Nat
  掛け算は行わない（件数は caller-established）。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」とし
  当該号に端数規定を持たないため、丸め規則は floor を採用したことを明示する。
* 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
  代わりに各税率定数の `den_pos`（well-definedness）と各税額関数の smoke を付与する。
* 第十三号・第十四号以外の別表第一の号、および登録免許税法全体（免税・軽減規定、
  納税義務者、税率の特例、他の別表）は **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/

namespace JapanTaxLaw.RegistryPatentFees

open JapanTaxLaw.TaxFinance

/-! === 十三 特許権の登録 — 定額型（Money = Nat） === -/

/-- 十三（一）イ 相続又は法人の合併による移転の登録 — 特許権の件数一件につき三千円 (¥3,000). -/
def patentTransferInheritanceOrMergerFee : Money := 3_000

/-- 十三（一）ロ その他の原因による移転の登録 — 特許権の件数一件につき一万五千円 (¥15,000). -/
def patentTransferOtherFee : Money := 15_000

/-- 十三（二） 専用実施権の設定又は保存の登録 — 専用実施権の件数一件につき一万五千円 (¥15,000). -/
def patentExclusiveRightEstablishmentOrPreservationFee : Money := 15_000

/-- 十三（四）イ 相続又は法人の合併による移転の登録 —
    特許権又は専用実施権（「特許権等」）の件数一件につき千五百円 (¥1,500). -/
def patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee : Money := 1_500

/-- 十三（四）ロ その他の原因による移転の登録 — 特許権等の件数一件につき三千円 (¥3,000). -/
def patentExclusiveRightOrPledgeTransferOtherFee : Money := 3_000

/-- 十三（五）ロ 質権以外の権利の信託の登録 — 特許権等の件数一件につき三千円 (¥3,000). -/
def patentNonPledgeTrustFee : Money := 3_000

/-- 十三（六） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録 —
    特許権等の件数一件につき千円 (¥1,000). -/
def patentMiscRegistrationFee : Money := 1_000

/-- 十三（七） 登録の抹消 — 特許権等の件数一件につき千円 (¥1,000). -/
def patentCancellationFee : Money := 1_000

/-! === 十三 特許権の登録 — 割合型（税率定数、分母 1000） === -/

/-- 十三（三） 質権の設定又は処分の制限の登録 — 債権金額千分の四 (4/1000). -/
def patentPledgeEstablishmentOrDispositionRestrictionRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十三（五）イ 質権の信託の登録 — 債権金額千分の二 (2/1000). -/
def patentPledgeTrustRate : TaxRate := ⟨2, 1000, by decide⟩

/-! === 十四 実用新案権の登録 — 定額型（Money = Nat） === -/

/-- 十四（一）イ 相続又は法人の合併による移転の登録 — 実用新案権の件数一件につき三千円 (¥3,000). -/
def utilityModelTransferInheritanceOrMergerFee : Money := 3_000

/-- 十四（一）ロ その他の原因による移転の登録 — 実用新案権の件数一件につき九千円 (¥9,000). -/
def utilityModelTransferOtherFee : Money := 9_000

/-- 十四（二） 専用実施権の設定又は保存の登録 — 専用実施権の件数一件につき九千円 (¥9,000). -/
def utilityModelExclusiveRightEstablishmentOrPreservationFee : Money := 9_000

/-- 十四（四）イ 相続又は法人の合併による移転の登録 —
    実用新案権又は専用実施権（「実用新案権等」）の件数一件につき千五百円 (¥1,500). -/
def utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee : Money := 1_500

/-- 十四（四）ロ その他の原因による移転の登録 — 実用新案権等の件数一件につき三千円 (¥3,000). -/
def utilityModelExclusiveRightOrPledgeTransferOtherFee : Money := 3_000

/-- 十四（五）ロ 質権以外の権利の信託の登録 — 実用新案権等の件数一件につき三千円 (¥3,000). -/
def utilityModelNonPledgeTrustFee : Money := 3_000

/-- 十四（六） 付記登録、仮登録、抹消した登録の回復の登録又は登録の更正若しくは変更の登録 —
    実用新案権等の件数一件につき千円 (¥1,000). -/
def utilityModelMiscRegistrationFee : Money := 1_000

/-- 十四（七） 登録の抹消 — 実用新案権等の件数一件につき千円 (¥1,000). -/
def utilityModelCancellationFee : Money := 1_000

/-! === 十四 実用新案権の登録 — 割合型（税率定数、分母 1000） === -/

/-- 十四（三） 質権の設定又は処分の制限の登録 — 債権金額千分の四 (4/1000). -/
def utilityModelPledgeEstablishmentOrDispositionRestrictionRate : TaxRate := ⟨4, 1000, by decide⟩

/-- 十四（五）イ 質権の信託の登録 — 債権金額千分の二 (2/1000). -/
def utilityModelPledgeTrustRate : TaxRate := ⟨2, 1000, by decide⟩

/-! === 税額関数（割合型）: 税額 = 債権金額 × X / 1000（applyFloor） === -/

/-- 十三（三） 税額 = 債権金額 × 4/1000。`base` は caller-established、丸めは切り捨て。 -/
def patentPledgeEstablishmentOrDispositionRestrictionFee (base : Money) : Money :=
  patentPledgeEstablishmentOrDispositionRestrictionRate.applyFloor base

/-- 十三（五）イ 税額 = 債権金額 × 2/1000。`base` は caller-established、丸めは切り捨て。 -/
def patentPledgeTrustFee (base : Money) : Money :=
  patentPledgeTrustRate.applyFloor base

/-- 十四（三） 税額 = 債権金額 × 4/1000。`base` は caller-established、丸めは切り捨て。 -/
def utilityModelPledgeEstablishmentOrDispositionRestrictionFee (base : Money) : Money :=
  utilityModelPledgeEstablishmentOrDispositionRestrictionRate.applyFloor base

/-- 十四（五）イ 税額 = 債権金額 × 2/1000。`base` は caller-established、丸めは切り捨て。 -/
def utilityModelPledgeTrustFee (base : Money) : Money :=
  utilityModelPledgeTrustRate.applyFloor base

/-! === well-definedness（positivity） === -/

theorem patentTransferInheritanceOrMergerFee_pos : patentTransferInheritanceOrMergerFee > 0 := by decide
theorem patentTransferOtherFee_pos : patentTransferOtherFee > 0 := by decide
theorem patentExclusiveRightEstablishmentOrPreservationFee_pos :
    patentExclusiveRightEstablishmentOrPreservationFee > 0 := by decide
theorem patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee_pos :
    patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee > 0 := by decide
theorem patentExclusiveRightOrPledgeTransferOtherFee_pos :
    patentExclusiveRightOrPledgeTransferOtherFee > 0 := by decide
theorem patentNonPledgeTrustFee_pos : patentNonPledgeTrustFee > 0 := by decide
theorem patentMiscRegistrationFee_pos : patentMiscRegistrationFee > 0 := by decide
theorem patentCancellationFee_pos : patentCancellationFee > 0 := by decide

theorem patentPledgeEstablishmentOrDispositionRestrictionRate_den_pos :
    0 < patentPledgeEstablishmentOrDispositionRestrictionRate.den := by decide
theorem patentPledgeTrustRate_den_pos : 0 < patentPledgeTrustRate.den := by decide

theorem utilityModelTransferInheritanceOrMergerFee_pos : utilityModelTransferInheritanceOrMergerFee > 0 := by decide
theorem utilityModelTransferOtherFee_pos : utilityModelTransferOtherFee > 0 := by decide
theorem utilityModelExclusiveRightEstablishmentOrPreservationFee_pos :
    utilityModelExclusiveRightEstablishmentOrPreservationFee > 0 := by decide
theorem utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee_pos :
    utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee > 0 := by decide
theorem utilityModelExclusiveRightOrPledgeTransferOtherFee_pos :
    utilityModelExclusiveRightOrPledgeTransferOtherFee > 0 := by decide
theorem utilityModelNonPledgeTrustFee_pos : utilityModelNonPledgeTrustFee > 0 := by decide
theorem utilityModelMiscRegistrationFee_pos : utilityModelMiscRegistrationFee > 0 := by decide
theorem utilityModelCancellationFee_pos : utilityModelCancellationFee > 0 := by decide

theorem utilityModelPledgeEstablishmentOrDispositionRestrictionRate_den_pos :
    0 < utilityModelPledgeEstablishmentOrDispositionRestrictionRate.den := by decide
theorem utilityModelPledgeTrustRate_den_pos : 0 < utilityModelPledgeTrustRate.den := by decide

/-! === smoke（各 def、すべて kernel-decide） === -/

-- 十三 定額
example : patentTransferInheritanceOrMergerFee = 3_000 := by decide
example : patentTransferOtherFee = 15_000 := by decide
example : patentExclusiveRightEstablishmentOrPreservationFee = 15_000 := by decide
example : patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : patentExclusiveRightOrPledgeTransferOtherFee = 3_000 := by decide
example : patentNonPledgeTrustFee = 3_000 := by decide
example : patentMiscRegistrationFee = 1_000 := by decide
example : patentCancellationFee = 1_000 := by decide

-- 十三 割合型: 分子・分母が原文どおり
example : patentPledgeEstablishmentOrDispositionRestrictionRate.num = 4 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionRate.den = 1000 := by decide
example : patentPledgeTrustRate.num = 2 := by decide
example : patentPledgeTrustRate.den = 1000 := by decide

-- 十三（三）4/1000: 0, 999(切捨て), 1000, 12345, 1_000_000
example : patentPledgeEstablishmentOrDispositionRestrictionFee 0 = 0 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 999 = 3 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 1000 = 4 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 12_345 = 49 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 1_000_000 = 4_000 := by decide

-- 十三（五）イ 2/1000
example : patentPledgeTrustFee 0 = 0 := by decide
example : patentPledgeTrustFee 999 = 1 := by decide
example : patentPledgeTrustFee 1000 = 2 := by decide
example : patentPledgeTrustFee 12_345 = 24 := by decide
example : patentPledgeTrustFee 1_000_000 = 2_000 := by decide

-- 十四 定額
example : utilityModelTransferInheritanceOrMergerFee = 3_000 := by decide
example : utilityModelTransferOtherFee = 9_000 := by decide
example : utilityModelExclusiveRightEstablishmentOrPreservationFee = 9_000 := by decide
example : utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : utilityModelExclusiveRightOrPledgeTransferOtherFee = 3_000 := by decide
example : utilityModelNonPledgeTrustFee = 3_000 := by decide
example : utilityModelMiscRegistrationFee = 1_000 := by decide
example : utilityModelCancellationFee = 1_000 := by decide

-- 十四 割合型: 分子・分母が原文どおり
example : utilityModelPledgeEstablishmentOrDispositionRestrictionRate.num = 4 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionRate.den = 1000 := by decide
example : utilityModelPledgeTrustRate.num = 2 := by decide
example : utilityModelPledgeTrustRate.den = 1000 := by decide

-- 十四（三）4/1000
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 0 = 0 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 999 = 3 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 1000 = 4 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 12_345 = 49 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 1_000_000 = 4_000 := by decide

-- 十四（五）イ 2/1000
example : utilityModelPledgeTrustFee 0 = 0 := by decide
example : utilityModelPledgeTrustFee 999 = 1 := by decide
example : utilityModelPledgeTrustFee 1000 = 2 := by decide
example : utilityModelPledgeTrustFee 12_345 = 24 := by decide
example : utilityModelPledgeTrustFee 1_000_000 = 2_000 := by decide

end JapanTaxLaw.RegistryPatentFees
