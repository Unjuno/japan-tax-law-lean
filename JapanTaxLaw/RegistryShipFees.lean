import JapanTaxLaw.TaxFinance

/-!
# RegistryShipFees — 登録免許税法 別表第一（二）二（船舶の登記）の手数料モデル (W-V)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  原文（担当範囲・正規化済み・UTF-8）: reg_prop_A.txt の「二　船舶の登記」〜
    「三　航空機の登録」手前（船舶の信託の登記を含む。）

原文の各 fee string を読み、割合型は税率定数 `TaxRate ⟨X, 1000, …⟩` と
税額関数 `base.applyFloor`（= 課税標準 × X / 1000、切り捨て）、定額型は `Money`
定数としてモデル化する。金額・率は日本語数字で検証して Arabic に変換した:

  （一）   所有権の保存 ............ 船舶の価額千分の四 ........ 4/1000
  （二）イ 相続・合併による移転 .... 船舶の価額千分の四 ........ 4/1000
  （二）ロ 遺贈・贈与その他無償名義 .. 船舶の価額千分の二十 ...... 20/1000
  （二）ハ その他の原因による移転 .... 船舶の価額千分の二十八 .... 28/1000
  （三）   委付 .................. 船舶の価額千分の四 ........ 4/1000
  （四）   賃借権の設定・転貸・移転 .. 船舶の価額千分の一・五 ..... 15/10000
  （五）   抵当権設定・差押え等 ...... 債権金額又は極度金額千分の四 .. 4/1000
  （六）イ 抵当権移転（相続・合併） .. 債権金額又は極度金額千分の一 .. 1/1000
  （六）ロ 抵当権移転（その他） ...... 債権金額又は極度金額千分の二 .. 2/1000
  （七）   根抵当権の一部譲渡／分割 .. 共有者数で除した金額千分の二 .. 2/1000
  （八）   抵当権の順位変更 ........ 抵当権の件数一件につき千円 .... ¥1,000/件
  （九）   賃借権の先順位優先同意 .... 件数一件につき千円 .......... ¥1,000/件
  （十）イ 所有権の信託 ............ 船舶の価額千分の四 ........ 4/1000
  （十）ロ 抵当権の信託 ............ 債権金額又は極度金額千分の二 .. 2/1000
  （十）ハ その他の権利の信託 ........ 船舶の価額千分の一・五 ..... 15/10000
  （十一）イ 所有権移転の仮登記・保全 .. 船舶の価額千分の四 ........ 4/1000
  （十一）ロ その他の仮登記 .......... 船舶の隻数一隻につき二千円 .. ¥2,000/隻
  （十二） 付記・回復・更正変更 ...... 船舶の隻数一隻につき千円 .... ¥1,000/隻
  （十三） 登記の抹消 .............. 船舶の隻数一隻につき千円 .... ¥1,000/隻

「千分の一・五」= 1.5/1000 = 15/10000 として分子分母を Nat で表現する。
「千分の二十八」= 28/1000、「千分の二十」= 20/1000（digit 誤りに注意）。

Scope & honest boundaries:

* 課税標準（「船舶の価額」「債権金額又は極度金額」「一部譲渡又は分割後の
  共有者の数で極度金額を除して計算した金額」）は **caller-established** とする。
  本モデルは与えられた `base` に税率を乗じる算術（および定額）のみを扱い、
  価額の算定・評価、共有者数での除算は一切行わない。
* 登記の該当性・原因の判定（相続／法人の合併／遺贈・贈与・無償／その他、
  設定／転貸／移転、信託の種別）、「隻数」「件数」の数え方、軽減・免税の
  適用可否は **caller-established** とし、Bool を金額計算式に入れない。
* 定額型は 1 隻／1 件あたりの定数のみを与え、隻数・件数を掛ける Nat 掛け算は
  行わない（隻数・件数は caller-established）。
* 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「千分のX」とし
  当該区分に端数規定を持たないため、丸め規則は floor を採用したことを明示する。
* 割合型の税額は `base` が小さいと 0 になり得るため strict positivity は成り立たない。
  代わりに各税率定数の `den_pos` と各税額関数の smoke を付与する。
* 別表第一（二）の他の区分（航空機の登録等）・他の号は **NOT YET COVERED**。
* Pinned evidence is in doc-comments only; all theorems claim model properties only,
  never the real legal semantics (誠実性の原則)。
-/

namespace JapanTaxLaw.RegistryShipFees

open JapanTaxLaw.TaxFinance

/-! === 税率定数（割合型；通常は分母 1000、「一・五」は 15/10000） === -/

/-- （一） 所有権の保存の登記 — 船舶の価額千分の四 (4/1000). -/
def shipOwnershipPreservationRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （二）イ 相続又は法人の合併による移転の登記 — 船舶の価額千分の四 (4/1000). -/
def shipOwnershipTransferInheritanceOrMergerRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （二）ロ 遺贈、贈与その他無償名義による移転の登記 — 船舶の価額千分の二十 (20/1000). -/
def shipOwnershipTransferGratuitousRate : TaxRate := ⟨20, 1000, by decide⟩

/-- （二）ハ その他の原因による移転の登記 — 船舶の価額千分の二十八 (28/1000). -/
def shipOwnershipTransferOtherRate : TaxRate := ⟨28, 1000, by decide⟩

/-- （三） 委付の登記 — 船舶の価額千分の四 (4/1000). -/
def shipAbandonmentRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （四） 賃借権の設定、転貸又は移転の登記 — 船舶の価額千分の一・五 (15/10000). -/
def shipLeaseholdRate : TaxRate := ⟨15, 10000, by decide⟩

/-- （五） 抵当権の設定、差押えその他権利の処分の制限の登記 —
    債権金額又は極度金額千分の四 (4/1000). -/
def shipMortgageSecurityRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （六）イ 抵当権の移転の登記（相続又は法人の合併） — 債権金額又は極度金額千分の一 (1/1000). -/
def shipMortgageTransferInheritanceOrMergerRate : TaxRate := ⟨1, 1000, by decide⟩

/-- （六）ロ 抵当権の移転の登記（その他の原因） — 債権金額又は極度金額千分の二 (2/1000). -/
def shipMortgageTransferOtherRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （七） 根抵当権の一部譲渡又は法人の分割による移転の登記 —
    一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の二 (2/1000).
    課税標準（除算結果）の算定は caller-established。 -/
def shipSweepMortgagePartialTransferOrDivisionRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十）イ 所有権の信託の登記 — 船舶の価額千分の四 (4/1000). -/
def shipOwnershipTrustRate : TaxRate := ⟨4, 1000, by decide⟩

/-- （十）ロ 抵当権の信託の登記 — 債権金額又は極度金額千分の二 (2/1000). -/
def shipMortgageTrustRate : TaxRate := ⟨2, 1000, by decide⟩

/-- （十）ハ その他の権利の信託の登記 — 船舶の価額千分の一・五 (15/10000). -/
def shipOtherRightTrustRate : TaxRate := ⟨15, 10000, by decide⟩

/-- （十一）イ 所有権の移転の仮登記又は所有権の移転請求権の保全のための仮登記 —
    船舶の価額千分の四 (4/1000). -/
def shipOwnershipTransferProvisionalRate : TaxRate := ⟨4, 1000, by decide⟩

/-! === 定額型（Money 定数；1 隻／1 件あたり） === -/

/-- （八） 抵当権の順位の変更の登記 — 抵当権の件数一件につき千円 (¥1,000/件)。 -/
def shipMortgageRankChangeFeePerCase : Money := 1_000

/-- （九） 賃借権の先順位抵当権に優先する同意の登記 —
    賃借権及び抵当権の件数一件につき千円 (¥1,000/件)。 -/
def shipLeaseholdPriorityConsentFeePerCase : Money := 1_000

/-- （十一）ロ その他の仮登記 — 船舶の隻数一隻につき二千円 (¥2,000/隻)。 -/
def shipOtherProvisionalFeePerVessel : Money := 2_000

/-- （十二） 付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 —
    船舶の隻数一隻につき千円 (¥1,000/隻)。 -/
def shipSupplementaryRegistrationFeePerVessel : Money := 1_000

/-- （十三） 登記の抹消 — 船舶の隻数一隻につき千円 (¥1,000/隻)。 -/
def shipCancellationFeePerVessel : Money := 1_000

/-! === 税額関数（割合型）: 税額 = 課税標準 × X / 分母（applyFloor） === -/

/-- （一） 所有権の保存の登記の税額 = 船舶の価額 × 4/1000。 -/
def shipOwnershipPreservationFee (base : Money) : Money :=
  shipOwnershipPreservationRate.applyFloor base

/-- （二）イ 相続・合併による移転の登記の税額 = 船舶の価額 × 4/1000。 -/
def shipOwnershipTransferInheritanceOrMergerFee (base : Money) : Money :=
  shipOwnershipTransferInheritanceOrMergerRate.applyFloor base

/-- （二）ロ 遺贈・贈与その他無償名義による移転の登記の税額 = 船舶の価額 × 20/1000。 -/
def shipOwnershipTransferGratuitousFee (base : Money) : Money :=
  shipOwnershipTransferGratuitousRate.applyFloor base

/-- （二）ハ その他の原因による移転の登記の税額 = 船舶の価額 × 28/1000。 -/
def shipOwnershipTransferOtherFee (base : Money) : Money :=
  shipOwnershipTransferOtherRate.applyFloor base

/-- （三） 委付の登記の税額 = 船舶の価額 × 4/1000。 -/
def shipAbandonmentFee (base : Money) : Money :=
  shipAbandonmentRate.applyFloor base

/-- （四） 賃借権の設定・転貸・移転の登記の税額 = 船舶の価額 × 15/10000。 -/
def shipLeaseholdFee (base : Money) : Money :=
  shipLeaseholdRate.applyFloor base

/-- （五） 抵当権の設定・差押え等の登記の税額 = 債権金額又は極度金額 × 4/1000。 -/
def shipMortgageSecurityFee (base : Money) : Money :=
  shipMortgageSecurityRate.applyFloor base

/-- （六）イ 抵当権の移転（相続・合併）の税額 = 債権金額又は極度金額 × 1/1000。 -/
def shipMortgageTransferInheritanceOrMergerFee (base : Money) : Money :=
  shipMortgageTransferInheritanceOrMergerRate.applyFloor base

/-- （六）ロ 抵当権の移転（その他）の税額 = 債権金額又は極度金額 × 2/1000。 -/
def shipMortgageTransferOtherFee (base : Money) : Money :=
  shipMortgageTransferOtherRate.applyFloor base

/-- （七） 根抵当権の一部譲渡／分割による移転の税額 = 除算後の金額 × 2/1000。 -/
def shipSweepMortgagePartialTransferOrDivisionFee (base : Money) : Money :=
  shipSweepMortgagePartialTransferOrDivisionRate.applyFloor base

/-- （十）イ 所有権の信託の登記の税額 = 船舶の価額 × 4/1000。 -/
def shipOwnershipTrustFee (base : Money) : Money :=
  shipOwnershipTrustRate.applyFloor base

/-- （十）ロ 抵当権の信託の登記の税額 = 債権金額又は極度金額 × 2/1000。 -/
def shipMortgageTrustFee (base : Money) : Money :=
  shipMortgageTrustRate.applyFloor base

/-- （十）ハ その他の権利の信託の登記の税額 = 船舶の価額 × 15/10000。 -/
def shipOtherRightTrustFee (base : Money) : Money :=
  shipOtherRightTrustRate.applyFloor base

/-- （十一）イ 所有権移転の仮登記・保全のための仮登記の税額 = 船舶の価額 × 4/1000。 -/
def shipOwnershipTransferProvisionalFee (base : Money) : Money :=
  shipOwnershipTransferProvisionalRate.applyFloor base

/-! === well-definedness（positivity） === -/

theorem shipOwnershipPreservationRate_den_pos : 0 < shipOwnershipPreservationRate.den := by decide
theorem shipOwnershipTransferInheritanceOrMergerRate_den_pos :
    0 < shipOwnershipTransferInheritanceOrMergerRate.den := by decide
theorem shipOwnershipTransferGratuitousRate_den_pos :
    0 < shipOwnershipTransferGratuitousRate.den := by decide
theorem shipOwnershipTransferOtherRate_den_pos :
    0 < shipOwnershipTransferOtherRate.den := by decide
theorem shipAbandonmentRate_den_pos : 0 < shipAbandonmentRate.den := by decide
theorem shipLeaseholdRate_den_pos : 0 < shipLeaseholdRate.den := by decide
theorem shipMortgageSecurityRate_den_pos : 0 < shipMortgageSecurityRate.den := by decide
theorem shipMortgageTransferInheritanceOrMergerRate_den_pos :
    0 < shipMortgageTransferInheritanceOrMergerRate.den := by decide
theorem shipMortgageTransferOtherRate_den_pos : 0 < shipMortgageTransferOtherRate.den := by decide
theorem shipSweepMortgagePartialTransferOrDivisionRate_den_pos :
    0 < shipSweepMortgagePartialTransferOrDivisionRate.den := by decide
theorem shipOwnershipTrustRate_den_pos : 0 < shipOwnershipTrustRate.den := by decide
theorem shipMortgageTrustRate_den_pos : 0 < shipMortgageTrustRate.den := by decide
theorem shipOtherRightTrustRate_den_pos : 0 < shipOtherRightTrustRate.den := by decide
theorem shipOwnershipTransferProvisionalRate_den_pos :
    0 < shipOwnershipTransferProvisionalRate.den := by decide

theorem shipMortgageRankChangeFeePerCase_pos : shipMortgageRankChangeFeePerCase > 0 := by decide
theorem shipLeaseholdPriorityConsentFeePerCase_pos : shipLeaseholdPriorityConsentFeePerCase > 0 := by decide
theorem shipOtherProvisionalFeePerVessel_pos : shipOtherProvisionalFeePerVessel > 0 := by decide
theorem shipSupplementaryRegistrationFeePerVessel_pos :
    shipSupplementaryRegistrationFeePerVessel > 0 := by decide
theorem shipCancellationFeePerVessel_pos : shipCancellationFeePerVessel > 0 := by decide

/-- 割合型手数料額は caller-established な課税標準について単調非減少。 -/
theorem rateFee_mono (rate : TaxRate) {a b : Money} (h : a ≤ b) :
    rate.applyFloor a ≤ rate.applyFloor b := by
  simp [TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate.num h)

/-! === smoke（各 def、すべて kernel-decide） === -/

-- 税率定数: 分子・分母が原文どおり
example : shipOwnershipPreservationRate.num = 4 := by decide
example : shipOwnershipPreservationRate.den = 1000 := by decide
example : shipOwnershipTransferInheritanceOrMergerRate.num = 4 := by decide
example : shipOwnershipTransferInheritanceOrMergerRate.den = 1000 := by decide
example : shipOwnershipTransferGratuitousRate.num = 20 := by decide
example : shipOwnershipTransferGratuitousRate.den = 1000 := by decide
example : shipOwnershipTransferOtherRate.num = 28 := by decide
example : shipOwnershipTransferOtherRate.den = 1000 := by decide
example : shipAbandonmentRate.num = 4 := by decide
example : shipAbandonmentRate.den = 1000 := by decide
example : shipLeaseholdRate.num = 15 := by decide
example : shipLeaseholdRate.den = 10000 := by decide
example : shipMortgageSecurityRate.num = 4 := by decide
example : shipMortgageSecurityRate.den = 1000 := by decide
example : shipMortgageTransferInheritanceOrMergerRate.num = 1 := by decide
example : shipMortgageTransferInheritanceOrMergerRate.den = 1000 := by decide
example : shipMortgageTransferOtherRate.num = 2 := by decide
example : shipMortgageTransferOtherRate.den = 1000 := by decide
example : shipSweepMortgagePartialTransferOrDivisionRate.num = 2 := by decide
example : shipSweepMortgagePartialTransferOrDivisionRate.den = 1000 := by decide
example : shipOwnershipTrustRate.num = 4 := by decide
example : shipOwnershipTrustRate.den = 1000 := by decide
example : shipMortgageTrustRate.num = 2 := by decide
example : shipMortgageTrustRate.den = 1000 := by decide
example : shipOtherRightTrustRate.num = 15 := by decide
example : shipOtherRightTrustRate.den = 10000 := by decide
example : shipOwnershipTransferProvisionalRate.num = 4 := by decide
example : shipOwnershipTransferProvisionalRate.den = 1000 := by decide

-- 定額
example : shipMortgageRankChangeFeePerCase = 1_000 := by decide
example : shipLeaseholdPriorityConsentFeePerCase = 1_000 := by decide
example : shipOtherProvisionalFeePerVessel = 2_000 := by decide
example : shipSupplementaryRegistrationFeePerVessel = 1_000 := by decide
example : shipCancellationFeePerVessel = 1_000 := by decide

-- （一）4/1000
example : shipOwnershipPreservationFee 0 = 0 := by decide
example : shipOwnershipPreservationFee 999 = 3 := by decide
example : shipOwnershipPreservationFee 1000 = 4 := by decide
example : shipOwnershipPreservationFee 1_000_000 = 4_000 := by decide

-- （二）イ 4/1000
example : shipOwnershipTransferInheritanceOrMergerFee 0 = 0 := by decide
example : shipOwnershipTransferInheritanceOrMergerFee 1000 = 4 := by decide
example : shipOwnershipTransferInheritanceOrMergerFee 1_000_000 = 4_000 := by decide

-- （二）ロ 20/1000
example : shipOwnershipTransferGratuitousFee 0 = 0 := by decide
example : shipOwnershipTransferGratuitousFee 999 = 19 := by decide
example : shipOwnershipTransferGratuitousFee 1000 = 20 := by decide
example : shipOwnershipTransferGratuitousFee 1_000_000 = 20_000 := by decide

-- （二）ハ 28/1000
example : shipOwnershipTransferOtherFee 0 = 0 := by decide
example : shipOwnershipTransferOtherFee 999 = 27 := by decide
example : shipOwnershipTransferOtherFee 1000 = 28 := by decide
example : shipOwnershipTransferOtherFee 12_345 = 345 := by decide
example : shipOwnershipTransferOtherFee 1_000_000 = 28_000 := by decide

-- （三）4/1000
example : shipAbandonmentFee 1000 = 4 := by decide
example : shipAbandonmentFee 1_000_000 = 4_000 := by decide

-- （四）15/10000（千分の一・五）
example : shipLeaseholdFee 0 = 0 := by decide
example : shipLeaseholdFee 666 = 0 := by decide
example : shipLeaseholdFee 667 = 1 := by decide
example : shipLeaseholdFee 1000 = 1 := by decide
example : shipLeaseholdFee 1_000_000 = 1_500 := by decide

-- （五）4/1000
example : shipMortgageSecurityFee 1000 = 4 := by decide
example : shipMortgageSecurityFee 1_000_000 = 4_000 := by decide

-- （六）イ 1/1000
example : shipMortgageTransferInheritanceOrMergerFee 0 = 0 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 999 = 0 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 1000 = 1 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 12_345 = 12 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 1_000_000 = 1_000 := by decide

-- （六）ロ 2/1000
example : shipMortgageTransferOtherFee 999 = 1 := by decide
example : shipMortgageTransferOtherFee 1000 = 2 := by decide
example : shipMortgageTransferOtherFee 1_000_000 = 2_000 := by decide

-- （七）2/1000
example : shipSweepMortgagePartialTransferOrDivisionFee 1000 = 2 := by decide
example : shipSweepMortgagePartialTransferOrDivisionFee 1_000_000 = 2_000 := by decide

-- （十）イ 4/1000
example : shipOwnershipTrustFee 1000 = 4 := by decide
example : shipOwnershipTrustFee 1_000_000 = 4_000 := by decide

-- （十）ロ 2/1000
example : shipMortgageTrustFee 1000 = 2 := by decide
example : shipMortgageTrustFee 1_000_000 = 2_000 := by decide

-- （十）ハ 15/10000
example : shipOtherRightTrustFee 1000 = 1 := by decide
example : shipOtherRightTrustFee 1_000_000 = 1_500 := by decide

-- （十一）イ 4/1000
example : shipOwnershipTransferProvisionalFee 1000 = 4 := by decide
example : shipOwnershipTransferProvisionalFee 1_000_000 = 4_000 := by decide

end JapanTaxLaw.RegistryShipFees
