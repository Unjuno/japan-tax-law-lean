import JapanTaxLaw.TaxFinance

/-!
# RegistryRealEstateFeesP1A — 登録免許税法 別表第一（一）の区分（一）〜（五）の手数料モデル (W-P)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: registry_app1_1_A.txt（区分（一）〜（五））

原文の各 fee string を読み、割合型は税率定数 `TaxRate ⟨X, 1000, …⟩` と
税額関数 `base.applyFloor`（= 課税標準 × X / 1000、切り捨て）、定額型は
`Money` 定数としてモデル化する。金額は日本語数字で検証して Arabic に変換:

  （一）   所有権の保存の登記 ................ 不動産の価額千分の四 ..... 4/1000
  （二）イ 相続又は法人の合併による移転の登記 .. 不動産の価額千分の四 ..... 4/1000
  （二）ロ 共有物の分割による移転の登記 ........ 不動産の価額千分の四 ..... 4/1000
  （二）ハ その他の原因による移転の登記 ........ 不動産の価額千分の二十 ... 20/1000
  （三）イ 設定又は転貸の登記 .................. 不動産の価額千分の十 ..... 10/1000
  （三）ロ 相続又は法人の合併による移転の登記 ... 不動産の価額千分の二 ..... 2/1000
  （三）ハ 共有に係る権利の分割による移転の登記 . 不動産の価額千分の二 ..... 2/1000
  （三）ニ その他の原因による移転の登記 ........ 不動産の価額千分の十 ..... 10/1000
  （三の二）配偶者居住権の設定の登記 ............ 不動産の価額千分の二 ..... 2/1000
  （四）   地役権の設定の登記 ................ 一個につき千五百円 ....... ¥1,500/個
  （五）   先取特権の保存、質権若しくは抵当権の設定、競売、差押え等 ...
           債権金額、極度金額又は不動産工事費用の予算金額千分の四 ...... 4/1000

Scope & honest boundaries:

* 課税標準（「不動産の価額」、「債権金額、極度金額又は不動産工事費用の予算金額」）は
  **caller-established** とする。本モデルは与えられた `base` に税率を乗じる算術
  （および定額）のみを扱い、価額の算定・評価は一切行わない。
* 登記の該当性・原因の判定（相続／法人の合併／共有物の分割／その他、設定／転貸）、
  「承役地の不動産の個数」の数え方、軽減・免税の適用可否は **caller-established** とし、
  Bool を金額計算式に入れない。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」とし当該区分に
  端数規定を持たないため、丸め規則は per-law business data として floor を採用した
  ことをここで明示する。
* （四）は一件ごとの定額ではなく「承役地の不動産の個数一個につき千五百円」。
  本モジュールは 1 個あたりの定数 `easementEstablishmentFeePerParcel` のみを与え、
  個数を掛ける Nat 掛け算は行わない（個数は caller-established）。
* 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
  代わりに各税率定数の `den_pos`（well-definedness）と各税額関数の smoke を付与する。
* 別表第一の他の区分・他の号は **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/

namespace JapanTaxLaw.RegistryRealEstateFeesP1A

open JapanTaxLaw.TaxFinance

/-! === 税率定数（割合型、すべて分母 1000） === -/

/-- （一） 所有権の保存の登記 — 不動産の価額千分の四 (4/1000). -/
def ownershipPreservationRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （二）イ 相続又は法人の合併による移転の登記 — 不動産の価額千分の四 (4/1000). -/
def ownershipTransferInheritanceOrMergerRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （二）ロ 共有物の分割による移転の登記 — 不動産の価額千分の四 (4/1000). -/
def ownershipTransferCoOwnershipDivisionRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （二）ハ その他の原因による移転の登記 — 不動産の価額千分の二十 (20/1000). -/
def ownershipTransferOtherRate : TaxRate := ⟨20, 1000, by decide⟩

/-- （三）イ 地上権、永小作権、賃借権又は採石権の設定又は転貸の登記 — 千分の十 (10/1000). -/
def restrictedRealRightEstablishmentOrSubleaseRate : TaxRate := ⟨10, 1000, by decide⟩

/-- （三）ロ 制限物権の相続又は法人の合併による移転の登記 — 千分の二 (2/1000). -/
def restrictedRealRightInheritanceOrMergerRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （三）ハ 制限物権の共有に係る権利の分割による移転の登記 — 千分の二 (2/1000). -/
def restrictedRealRightCoOwnershipDivisionRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （三）ニ 制限物権のその他の原因による移転の登記 — 千分の十 (10/1000). -/
def restrictedRealRightOtherRate : TaxRate := ⟨10, 1000, by decide⟩

/-- （三の二） 配偶者居住権の設定の登記 — 不動産の価額千分の二 (2/1000). -/
def spousalResidenceRightRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （五） 先取特権の保存、質権若しくは抵当権の設定、競売、差押え等の登記 —
    債権金額、極度金額又は不動産工事費用の予算金額千分の四 (4/1000). -/
def securityRegistrationRate : TaxRate := ⟨4, 1000, by decide⟩

/-! === 定額型 === -/

/-- （四） 地役権の設定の登記 — 承役地の不動産 1 個につき千五百円 (¥1,500)。
    個数を掛ける Nat 掛け算は行わない（個数は caller-established）。 -/
def easementEstablishmentFeePerParcel : Money := 1_500

/-! === 税額関数（割合型）: 税額 = 課税標準 × X / 1000（applyFloor） === -/

/-- （一） 所有権の保存の登記の登録免許税額 = 不動産の価額 × 4/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def ownershipPreservationFee (base : Money) : Money :=
  ownershipPreservationRate.applyFloor base

/-- （二）イ 相続又は法人の合併による移転の登記の税額 = 不動産の価額 × 4/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def ownershipTransferInheritanceOrMergerFee (base : Money) : Money :=
  ownershipTransferInheritanceOrMergerRate.applyFloor base

/-- （二）ロ 共有物の分割による移転の登記の税額 = 不動産の価額 × 4/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def ownershipTransferCoOwnershipDivisionFee (base : Money) : Money :=
  ownershipTransferCoOwnershipDivisionRate.applyFloor base

/-- （二）ハ その他の原因による移転の登記の税額 = 不動産の価額 × 20/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def ownershipTransferOtherFee (base : Money) : Money :=
  ownershipTransferOtherRate.applyFloor base

/-- （三）イ 設定又は転貸の登記の税額 = 不動産の価額 × 10/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def restrictedRealRightEstablishmentOrSubleaseFee (base : Money) : Money :=
  restrictedRealRightEstablishmentOrSubleaseRate.applyFloor base

/-- （三）ロ 相続又は法人の合併による移転の登記の税額 = 不動産の価額 × 2/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def restrictedRealRightInheritanceOrMergerFee (base : Money) : Money :=
  restrictedRealRightInheritanceOrMergerRate.applyFloor base

/-- （三）ハ 共有に係る権利の分割による移転の登記の税額 = 不動産の価額 × 2/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def restrictedRealRightCoOwnershipDivisionFee (base : Money) : Money :=
  restrictedRealRightCoOwnershipDivisionRate.applyFloor base

/-- （三）ニ その他の原因による移転の登記の税額 = 不動産の価額 × 10/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def restrictedRealRightOtherFee (base : Money) : Money :=
  restrictedRealRightOtherRate.applyFloor base

/-- （三の二） 配偶者居住権の設定の登記の税額 = 不動産の価額 × 2/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def spousalResidenceRightFee (base : Money) : Money :=
  spousalResidenceRightRate.applyFloor base

/-- （五） 先取特権の保存、質権若しくは抵当権の設定等の登記の税額 =
    債権金額、極度金額又は不動産工事費用の予算金額 × 4/1000。
    `base` は caller-established、丸めは切り捨て。 -/
def securityRegistrationFee (base : Money) : Money :=
  securityRegistrationRate.applyFloor base

/-! === well-definedness（positivity） === -/

theorem ownershipPreservationRate_den_pos : 0 < ownershipPreservationRate.den := by decide
theorem ownershipTransferInheritanceOrMergerRate_den_pos :
    0 < ownershipTransferInheritanceOrMergerRate.den := by decide
theorem ownershipTransferCoOwnershipDivisionRate_den_pos :
    0 < ownershipTransferCoOwnershipDivisionRate.den := by decide
theorem ownershipTransferOtherRate_den_pos : 0 < ownershipTransferOtherRate.den := by decide
theorem restrictedRealRightEstablishmentOrSubleaseRate_den_pos :
    0 < restrictedRealRightEstablishmentOrSubleaseRate.den := by decide
theorem restrictedRealRightInheritanceOrMergerRate_den_pos :
    0 < restrictedRealRightInheritanceOrMergerRate.den := by decide
theorem restrictedRealRightCoOwnershipDivisionRate_den_pos :
    0 < restrictedRealRightCoOwnershipDivisionRate.den := by decide
theorem restrictedRealRightOtherRate_den_pos : 0 < restrictedRealRightOtherRate.den := by decide
theorem spousalResidenceRightRate_den_pos : 0 < spousalResidenceRightRate.den := by decide
theorem securityRegistrationRate_den_pos : 0 < securityRegistrationRate.den := by decide
theorem easementEstablishmentFeePerParcel_pos : easementEstablishmentFeePerParcel > 0 := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem rateFee_mono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  simp [TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)

/-! === smoke（各 def、すべて kernel-decide） === -/

-- 税率定数: 分子・分母が原文どおり
example : ownershipPreservationRate.num = 4 := by decide
example : ownershipPreservationRate.den = 1000 := by decide
example : ownershipTransferInheritanceOrMergerRate.num = 4 := by decide
example : ownershipTransferInheritanceOrMergerRate.den = 1000 := by decide
example : ownershipTransferCoOwnershipDivisionRate.num = 4 := by decide
example : ownershipTransferCoOwnershipDivisionRate.den = 1000 := by decide
example : ownershipTransferOtherRate.num = 20 := by decide
example : ownershipTransferOtherRate.den = 1000 := by decide
example : restrictedRealRightEstablishmentOrSubleaseRate.num = 10 := by decide
example : restrictedRealRightEstablishmentOrSubleaseRate.den = 1000 := by decide
example : restrictedRealRightInheritanceOrMergerRate.num = 2 := by decide
example : restrictedRealRightInheritanceOrMergerRate.den = 1000 := by decide
example : restrictedRealRightCoOwnershipDivisionRate.num = 2 := by decide
example : restrictedRealRightCoOwnershipDivisionRate.den = 1000 := by decide
example : restrictedRealRightOtherRate.num = 10 := by decide
example : restrictedRealRightOtherRate.den = 1000 := by decide
example : spousalResidenceRightRate.num = 2 := by decide
example : spousalResidenceRightRate.den = 1000 := by decide
example : securityRegistrationRate.num = 4 := by decide
example : securityRegistrationRate.den = 1000 := by decide

-- 定額
example : easementEstablishmentFeePerParcel = 1_500 := by decide

-- （一）4/1000: 0, 1, 999(切捨て), 1000, 10000, 1000000
example : ownershipPreservationFee 0 = 0 := by decide
example : ownershipPreservationFee 1 = 0 := by decide
example : ownershipPreservationFee 999 = 3 := by decide
example : ownershipPreservationFee 1000 = 4 := by decide
example : ownershipPreservationFee 10_000 = 40 := by decide
example : ownershipPreservationFee 1_000_000 = 4_000 := by decide

-- （二）イ 4/1000
example : ownershipTransferInheritanceOrMergerFee 0 = 0 := by decide
example : ownershipTransferInheritanceOrMergerFee 999 = 3 := by decide
example : ownershipTransferInheritanceOrMergerFee 1000 = 4 := by decide
example : ownershipTransferInheritanceOrMergerFee 1_000_000 = 4_000 := by decide

-- （二）ロ 4/1000
example : ownershipTransferCoOwnershipDivisionFee 0 = 0 := by decide
example : ownershipTransferCoOwnershipDivisionFee 999 = 3 := by decide
example : ownershipTransferCoOwnershipDivisionFee 1000 = 4 := by decide
example : ownershipTransferCoOwnershipDivisionFee 1_000_000 = 4_000 := by decide

-- （二）ハ 20/1000
example : ownershipTransferOtherFee 0 = 0 := by decide
example : ownershipTransferOtherFee 1 = 0 := by decide
example : ownershipTransferOtherFee 999 = 19 := by decide
example : ownershipTransferOtherFee 1000 = 20 := by decide
example : ownershipTransferOtherFee 10_000 = 200 := by decide
example : ownershipTransferOtherFee 1_000_000 = 20_000 := by decide

-- （三）イ 10/1000
example : restrictedRealRightEstablishmentOrSubleaseFee 0 = 0 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 999 = 9 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 1000 = 10 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 1_000_000 = 10_000 := by decide

-- （三）ロ 2/1000
example : restrictedRealRightInheritanceOrMergerFee 0 = 0 := by decide
example : restrictedRealRightInheritanceOrMergerFee 999 = 1 := by decide
example : restrictedRealRightInheritanceOrMergerFee 1000 = 2 := by decide
example : restrictedRealRightInheritanceOrMergerFee 1_000_000 = 2_000 := by decide

-- （三）ハ 2/1000
example : restrictedRealRightCoOwnershipDivisionFee 0 = 0 := by decide
example : restrictedRealRightCoOwnershipDivisionFee 999 = 1 := by decide
example : restrictedRealRightCoOwnershipDivisionFee 1000 = 2 := by decide
example : restrictedRealRightCoOwnershipDivisionFee 1_000_000 = 2_000 := by decide

-- （三）ニ 10/1000
example : restrictedRealRightOtherFee 0 = 0 := by decide
example : restrictedRealRightOtherFee 999 = 9 := by decide
example : restrictedRealRightOtherFee 1000 = 10 := by decide
example : restrictedRealRightOtherFee 1_000_000 = 10_000 := by decide

-- （三の二）2/1000
example : spousalResidenceRightFee 0 = 0 := by decide
example : spousalResidenceRightFee 999 = 1 := by decide
example : spousalResidenceRightFee 1000 = 2 := by decide
example : spousalResidenceRightFee 1_000_000 = 2_000 := by decide

-- （五）4/1000
example : securityRegistrationFee 0 = 0 := by decide
example : securityRegistrationFee 999 = 3 := by decide
example : securityRegistrationFee 1000 = 4 := by decide
example : securityRegistrationFee 1_000_000 = 4_000 := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1A
