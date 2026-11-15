import JapanTaxLaw.TaxFinance

/-!
# RegistrationTax — 登録免許税法 別表第一（一）不動産の登記の主要定率項目 + art. 15/18/19 L4 スライス

Source (pinned):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

art. 9（課税標準及び税率）は「登記等の区分に応じ、別表第一の課税標準欄に掲げる金額又は
数量及び同表の税率欄に掲げる割合又は金額による」と規定するため、表との突合が定義層である。
本モジュールは**別表第一（一）不動産の登記のうち、定率（千分の割合）で課税する主要項目**を
モデル化する。同表の固定金額項目（例: 四（地役権 一個につき千五百円）・五（抵当権の順位の
変更 一件につき千円）・十三〜十五（付記/抹消/更正 一個につき千円））・船舶以下の号・
商業登記以下の号はモデル化しない。

* `RealEstateRegKind` — モデル化する登記の区分（千分の割合）。
* `realEstateMilleRate` — 別表第一（一）の各区分の千分の割合。
* `taxableBase` — art. 15（別表第一に掲げる登記に係る課税標準の金額を計算する場合において、
  その全額が千円に満たないときは、これを千円とする）。
* `registrationTax` — art. 9 + 別表第一による定率課税額（TaxRate.applyFloor と同じ切り捨て）。
* `registrationTaxWithMinimum` — art. 19（別表第一に掲げる登記又は登録につき同表に掲げる
  税率を適用して計算した金額が千円に満たない場合には、千円とする — 定率課税の場合の
  最低税額）。
* `sumRegistrationTaxes` — art. 18（同一の申請書（嘱託の場合は嘱託書）により二以上の
  登記を受ける場合は、各登記につき同表に掲げる税率を適用して計算した金額の合計額）。
  各登記ごとに art. 19 の最低税額を適用したのち合計する（art. 19 は登記ごとに適用されるため）。

**スコープ外**:
* 別表第一の固定金額項目・商業登記・会社登記・船舶・航空機・鉱業権・漁業権・特許登録・免許
  料等の全号はモデル化しない。
* 課税標準の「不動産の価額」の算定（art. 10）・債権金額がない場合の課税標準（art. 11）・
  債権金額の増額に係る変更の登記（art. 12）・共同担保の登記等（art. 13、千分の0.5に相当
  する按分等）・担保付社債の抵当権の設定（art. 14）はモデル化しない。
* art. 17（仮登記等のある不動産の移転登記の場合の税率の特例）・第17条の2・第17条の3
  （特例有限会社）の特例はモデル化しない（caller-supplied kind で表現する余地のみ）。
* art. 6/7（非課税公館・信託）・art. 13・仮登記（別表第一（一）十二）の区分もモデル化しない。
* 課税標準の金額の端数処理（art. 15）以外の端数処理（art. 16 の数量端数）のうち
  不動産登記に無関係なものは対象外。
* art. 21 以下の納付手続・art. 31 の還付はモデル化しない。

Pinned evidence in doc-comments only; all theorems here only claim properties of the
model, never of the real legal semantics（誠実性の原則 — Pin ↔ 原文一致 is the trust
boundary; interpretation is not guaranteed)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 別表第一（一）不動産の登記のうち、モデル化する定率（千分の割合）区分。 -/
inductive RealEstateRegKind where
  /-- 一（一）所有権の保存の登記 — 千分の四 -/
  | saveOwnership
  /-- 一（二）イ 相続又は法人の合併による移転の登記 — 千分の四 -/
  | transferByInheritance
  /-- 一（二）ロ 共有物の分割による移転の登記 — 千分の四 -/
  | transferByPartition
  /-- 一（二）ハ その他の原因による移転の登記 — 千分の二十 -/
  | transferOther
  /-- 一（三）イ 地上権、永小作権、賃借権又は採石権の設定又は転貸の登記 — 千分の十 -/
  | leaseholdSetup
  /-- 一（三）ロ 相続又は法人の合併による移転の登記 — 千分の二 -/
  | leaseholdTransferByInheritance
  /-- 一（三）ハ 共有に係る権利の分割による移転の登記 — 千分の二 -/
  | leaseholdTransferByPartition
  /-- 一（三）ニ その他の原因による移転の登記 — 千分の十 -/
  | leaseholdTransferOther
  /-- 一（三の二）配偶者居住権の設定の登記 — 千分の二 -/
  | spouseResidenceSetup
  /-- 一（五）先取特権の保存、質権若しくは抵当権の設定、強制競売・競売に係る差押え、
      仮差押え、仮処分又は抵当付債権の差押えその他権利の処分の制限の登記
      （課税標準: 債権金額、極度金額又は不動産工事費用の予算金額）— 千分の四 -/
  | mortgageSetup
  /-- 一（六）イ 先取特権、質権又は抵当権の移転の登記（相続又は法人の合併による移転）
      — 千分の一 -/
  | mortgageTransferByInheritance
  /-- 一（六）ロ その他の原因による移転の登記 — 千分の二 -/
  | mortgageTransferOther
  /-- 一（十）イ 所有権の信託の登記 — 千分の四 -/
  | trustOwnership
  /-- 一（十）ロ 先取特権、質権又は抵当権の信託の登記（課税標準: 債権金額又は極度金額）
      — 千分の二 -/
  | trustMortgage
  /-- 一（十）ハ その他の権利の信託の登記 — 千分の二 -/
  | trustOtherRights
  deriving DecidableEq, Repr

/-- 別表第一（一）の各区分の千分の割合（法文の「千分の四」等から読み取れる整数）。 -/
def realEstateMilleRate (kind : RealEstateRegKind) : Nat :=
  match kind with
  | .saveOwnership => 4
  | .transferByInheritance => 4
  | .transferByPartition => 4
  | .transferOther => 20
  | .leaseholdSetup => 10
  | .leaseholdTransferByInheritance => 2
  | .leaseholdTransferByPartition => 2
  | .leaseholdTransferOther => 10
  | .spouseResidenceSetup => 2
  | .mortgageSetup => 4
  | .mortgageTransferByInheritance => 1
  | .mortgageTransferOther => 2
  | .trustOwnership => 4
  | .trustMortgage => 2
  | .trustOtherRights => 2

/-- art. 15: 別表第一に掲げる登記に係る課税標準の金額を計算する場合において、
    その全額が千円に満たないときは、これを千円とする。 -/
def taxableBase (price : Money) : Money :=
  if price < 1_000 then 1_000 else price

/-- art. 9 + 別表第一: 定率課税額（切り捨て）。 -/
def registrationTax (kind : RealEstateRegKind) (price : Money) : Money :=
  taxableBase price * realEstateMilleRate kind / 1000

/-- art. 19: 別表第一に掲げる登記につき同表に掲げる税率を適用して計算した金額が
    千円に満たない場合には、千円とする（定率課税の場合の最低税額）。 -/
def registrationTaxWithMinimum (kind : RealEstateRegKind) (price : Money) : Money :=
  if registrationTax kind price < 1_000 then 1_000 else registrationTax kind price

/-- art. 18: 同一の登記等の申請書（嘱託の場合は嘱託書）により二以上の登記等を受ける
    場合における登録免許税の額は、各登記等につき同表に掲げる税率を適用して計算した
    金額の合計金額とする。各登記ごとに art. 19 の最低税額を適用してから合計する。 -/
def sumRegistrationTaxes (registrations : List (RealEstateRegKind × Money)) : Money :=
  (registrations.map (fun (kind, price) => registrationTaxWithMinimum kind price)).sum

-- ==== verified facts about the model (no performance of the law, only model consistency) ====

/-- 課税標準は常に 1,000 以上（art. 15）。 -/
theorem taxableBase_ge_1000 (price : Money) : 1_000 ≤ taxableBase price := by
  unfold taxableBase
  by_cases h : price < 1_000
  · rw [ite_eq_left h]
    decide
  · rw [ite_eq_right h]
    exact Nat.not_lt.mp h

/-- 課税標準が 1,000 以上ならそのまま（art. 15 の当然の読み）。 -/
theorem taxableBase_of_ge_1000 (price : Money) (h : 1_000 ≤ price) :
    taxableBase price = price := by
  unfold taxableBase
  have h' : ¬ price < 1_000 := Nat.not_lt.mpr h
  simp [h']

/-- 千分の 20 の代表値: その他の原因による移転の登記。モデルが計算できる
    端点の検証は `RegistrationTaxTests` を参照。 -/
theorem transferOther_rate : realEstateMilleRate .transferOther = 20 := by decide

/-- 最低税額は 1,000 以上（art. 19）。 -/
theorem registrationTaxWithMinimum_ge_1000 (kind : RealEstateRegKind) (price : Money) :
    1_000 ≤ registrationTaxWithMinimum kind price := by
  unfold registrationTaxWithMinimum
  by_cases h : registrationTax kind price < 1_000
  · rw [ite_eq_left h]
    decide
  · rw [ite_eq_right h]
    exact Nat.not_lt.mp h

/-- 最低税額の適用がなければ、適用前の額に等しい。 -/
theorem registrationTaxWithMinimum_eq_base (kind : RealEstateRegKind) (price : Money)
    (h : 1_000 ≤ registrationTax kind price) :
    registrationTaxWithMinimum kind price = registrationTax kind price := by
  unfold registrationTaxWithMinimum
  have h' : ¬ registrationTax kind price < 1_000 := Nat.not_lt.mpr h
  simp [h']

/-- 保存の登記・移転登記の定率は千分の四（相続・法人の合併・共有分割・信託以外を含む）。 -/
theorem saveOwnership_rate : realEstateMilleRate .saveOwnership = 4 := by decide
theorem transferByInheritance_rate : realEstateMilleRate .transferByInheritance = 4 := by
  decide

/-- 配偶者居住権の設定の登記は千分の二。 -/
theorem spouseResidenceSetup_rate : realEstateMilleRate .spouseResidenceSetup = 2 := by
  decide

/-- 課税標準は価格に単調非減少。 -/
theorem taxableBase_mono {p q : Money} (h : p ≤ q) : taxableBase p ≤ taxableBase q := by
  unfold taxableBase
  by_cases hp : p < 1_000
  · rw [ite_eq_left hp]
    by_cases hq : q < 1_000
    · rw [ite_eq_left hq]
      decide
    · rw [ite_eq_right hq]
      exact Nat.not_lt.mp hq
  · rw [ite_eq_right hp]
    by_cases hq : q < 1_000
    · exfalso
      have h1 : 1_000 ≤ p := Nat.not_lt.mp hp
      have h2 : 1_000 ≤ q := Nat.le_trans h1 h
      exact absurd hq (Nat.not_lt.mpr h2)
    · rw [ite_eq_right hq]
      exact h

/-- 税額の単調性（同一区分内で課税標準に単調非減少）。 -/
theorem registrationTax_mono (kind : RealEstateRegKind) {p q : Money} (h : p ≤ q) :
    registrationTax kind p ≤ registrationTax kind q := by
  unfold registrationTax
  apply Nat.div_le_div_right
  exact Nat.mul_le_mul_right (realEstateMilleRate kind) (taxableBase_mono h)

end JapanTaxLaw
