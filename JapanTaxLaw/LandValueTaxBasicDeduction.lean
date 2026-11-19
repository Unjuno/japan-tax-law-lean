import JapanTaxLaw.TaxFinance

/-!
# LandValueTaxBasicDeduction — 地価税法 art. 18（基礎控除）の bounded L4 モデル

Sources (pinned):

  Law id: 403AC0000000069
  Revision: 403AC0000000069_20250601_504AC0000000068
  Amendment enforcement date: 2025-06-01
  Raw snapshot: data/raw/403AC0000000069_20250601_504AC0000000068.law.json

Namespace note: a dedicated sub-namespace `JapanTaxLaw.LandValueTaxBasicDeduction` is
used so that this slice cannot collide with other modules of 地価税法 (law id
403AC0000000069) that live in the flat `JapanTaxLaw` namespace.

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from 担当範囲原文
`C8_LVT18.txt`; 全角空白 U+3000 を含まない。pinned JSON の Art.18 正規化テキスト
および flatten テキストに `.find()` / `.count()` で各 1 回出現を確認済み):

  art. 18 本文・一号導入「（基礎控除）第十八条次の各号に掲げる金額のいずれか多い金額は、
    課税価格から控除する。一土地等を有する者のイ又はロに掲げる区分に応じ…」
  art. 18 一号「…資本金の額又は出資金の額が一億円を超える法人…十億円ロ個人及び
    イに掲げる法人以外の法人十五億円」
  art. 18 二号柱書「…一平方メートル当たりの金額（当該土地等につき前条の規定の適用が
    ある場合には、当該金額に二分の一を乗じて計算した金額）に、当該土地等の面積を
    乗じて計算した金額の合計額」
  art. 18 二号イ・ロ「イ借地権等が設定されていない場合三万円ロ借地権等が設定されて
    いる場合において、当該土地等が借地権等であるとき。三万円に当該借地権等の価額が
    更地の価額のうちに占める割合を乗じて計算した金額」
  art. 18 二号ハ・2項「ハ借地権等が設定されている場合において、当該土地等が借地権等
    以外のもの（以下この号において「底地」という。）であるとき。三万円に当該底地の
    価額が更地の価額のうちに占める割合を乗じて計算した金額２前項の規定による控除は、
    基礎控除という。」

金額・算式の読み取り（原文どおり、逐語のみを根拠に導いた）:

  一号イ「十億円」  = 1_000_000_000  （十億 = 10 × 10^8）
  一号ロ「十五億円」= 1_500_000_000  （十五億 = 15 × 10^8）
  「一億円」        = 100_000_000    （区分イの判定閾値「を超える」。判定は
                                       caller-established で算算には用いない）
  二号の単価「三万円」 = 30_000
    イ（借地権等が設定されていない場合）      : 30_000
    ロ（土地等が借地権等であるとき）          : 30_000 × 借地権割合
    ハ（土地等が底地であるとき）              : 30_000 × 底地割合
  前条適用あり「当該金額に二分の一を乗じて計算した金額」: 上の単価 × 1/2
  二号金額 = 各区画の「単価 × 面積」の合計額
  基礎控除 = max(一号金額, 二号金額)  （原文「いずれか多い金額」）

Computational result (bounded):

  item1Amount owner             = 十億円 (イ) / 十五億円 (ロ)
  unitPricePerSqm cls ratio prev = 30_000 または 30_000×割合、さらに prev を乗じる
  parcelAmount p                = unitPricePerSqm p.cls p.ratio p.prev * p.area
  item2Amount ps                = Σ parcelAmount p
  basicDeduction owner ps       = max (item1Amount owner) (item2Amount ps)

Out of scope / honesty notes:

  * 一号イの「保険業法…相互会社…外国相互会社で政令で定めるもの」該当性は
    NOT MODELLED（人間の法的判断。区分は caller-established）。
  * 前条（art. 17）の適用判定は NOT MODELLED。Bool を金額式に入れず、
    「二分の一」を caller-established の TaxRate（⟨1,2,…⟩）として受け取る。
  * 借地権等の価額・底地の価額・更地の価額の算定および割合の算定は NOT MODELLED。
    割合は caller-established の TaxRate として受け取る。
  * 面積・区画の認定、課税価格からの控除の適用（art. 22）、端数処理・申告等は
    NOT MODELLED。
  * 割合の乗算は repo 標準の `TaxRate.applyFloor`（切り捨て）で行う。原文は
    丸め規則を明示しないため、これはモデル上の選択であり、割合自体は
    caller-established とする。
  * 完成・網羅を主張しない。L7 候補 3,438 件は LEGAL_REVIEW_PENDING のまま。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice`, `sorryAx`
or `Quot.sound`. A few theorems depend only on core `propext` (repo-permitted).
-/

namespace JapanTaxLaw.LandValueTaxBasicDeduction

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 18 — 金額定数
-- ============================================================

/-- 一号イの区分判定閾値「資本金の額又は出資金の額が一億円」（= 100_000_000）。
    原文は「一億円を超える」。判定は caller-established であり、本モデルでは
    金額計算に用いない（原文の記録としてのみ定義する）。 -/
def capitalThreshold : Money := 100_000_000

/-- 一号イ「十億円」= 1_000_000_000。 -/
def item1LargeCorpAmount : Money := 1_000_000_000

/-- 一号ロ「十五億円」= 1_500_000_000。 -/
def item1OtherAmount : Money := 1_500_000_000

/-- 二号の一平方メートル当たり基準単価「三万円」= 30_000。 -/
def unitPriceBase : Money := 30_000

-- --- positivity / value: 定数 ---

theorem capitalThreshold_pos : 0 < capitalThreshold := by decide

theorem capitalThreshold_value : capitalThreshold = 100_000_000 := by decide

theorem item1LargeCorpAmount_pos : 0 < item1LargeCorpAmount := by decide

theorem item1LargeCorpAmount_value : item1LargeCorpAmount = 1_000_000_000 := by decide

theorem item1OtherAmount_pos : 0 < item1OtherAmount := by decide

theorem item1OtherAmount_value : item1OtherAmount = 1_500_000_000 := by decide

/-- 一号イ（十億円）＜ 一号ロ（十五億円）。原文の金額どおり。 -/
theorem item1LargeCorpAmount_lt_other :
    item1LargeCorpAmount < item1OtherAmount := by decide

theorem unitPriceBase_pos : 0 < unitPriceBase := by decide

theorem unitPriceBase_value : unitPriceBase = 30_000 := by decide

-- ============================================================
-- 前条係数（Bool を金額式に入れないため caller-established の TaxRate で受け取る）
-- ============================================================

/-- 前条の規定の適用がない場合に caller が渡す係数「1」（= ⟨1,1,…⟩）。 -/
def prevNoAdjust : TaxRate := ⟨1, 1, by decide⟩

/-- 前条の規定の適用がある場合に caller が渡す「二分の一」（= ⟨1,2,…⟩）。
    原文「当該金額に二分の一を乗じて計算した金額」。適用判定自体は NOT MODELLED。 -/
def prevHalf : TaxRate := ⟨1, 2, by decide⟩

theorem prevNoAdjust_value : prevNoAdjust.numDen = (1, 1) := by decide

theorem prevHalf_value : prevHalf.numDen = (1, 2) := by decide

-- ============================================================
-- 一号 — 区分に応じた金額
-- ============================================================

/-- 一号の区分「土地等を有する者のイ又はロに掲げる区分」。caller-established。 -/
inductive OwnerClass where
  | largeCorp          -- イ: 資本金（出資金）一億円超の普通法人（相互会社等を含む）
  | individualOrOther  -- ロ: 個人及びイに掲げる法人以外の法人
  deriving DecidableEq

/-- art. 18 一号: 区分イ → 十億円、区分ロ → 十五億円。
    原文「土地等を有する者のイ又はロに掲げる区分に応じそれぞれイ又はロに定める金額」。
    該当性（資本金の額・相互会社該当性）は caller-established。 -/
def item1Amount (owner : OwnerClass) : Money :=
  match owner with
  | .largeCorp => item1LargeCorpAmount
  | .individualOrOther => item1OtherAmount

theorem item1Amount_of_largeCorp :
    item1Amount .largeCorp = item1LargeCorpAmount := rfl

theorem item1Amount_of_individualOrOther :
    item1Amount .individualOrOther = item1OtherAmount := rfl

theorem item1Amount_pos (owner : OwnerClass) : 0 < item1Amount owner := by
  cases owner <;> decide

theorem item1Amount_eq_largeCorp_iff (owner : OwnerClass) :
    (item1Amount owner = item1LargeCorpAmount) ↔ owner = .largeCorp := by
  cases owner <;> decide

-- ============================================================
-- 二号 — 場合区分・単価・面積・合計額
-- ============================================================

/-- 二号の「イからハまでに掲げる場合」の区分。caller-established。 -/
inductive LandClass where
  | noLeasehold     -- イ: 借地権等が設定されていない場合
  | leaseholdRight  -- ロ: 土地等が借地権等であるとき
  | underlyingLand  -- ハ: 土地等が借地権等以外のもの（底地）であるとき
  deriving DecidableEq

/-- art. 18 二号の「一平方メートル当たりの金額」。

    イ → 三万円
    ロ → 三万円に当該借地権等の価額が更地の価額のうちに占める割合を乗じて計算した金額
    ハ → 三万円に当該底地の価額が更地の価額のうちに占める割合を乗じて計算した金額

    さらに前条の規定の適用がある場合には「当該金額に二分の一を乗じて計算した金額」。
    `ratio`（借地権割合／底地割合）と `prev`（前条係数）は caller-established の
    TaxRate であり、Bool は金額式に含まない。イでは `ratio` は使用しない。 -/
def unitPricePerSqm (cls : LandClass) (ratio : TaxRate) (prev : TaxRate) : Money :=
  let base := match cls with
    | .noLeasehold => unitPriceBase
    | .leaseholdRight => ratio.applyFloor unitPriceBase
    | .underlyingLand => ratio.applyFloor unitPriceBase
  prev.applyFloor base

theorem unitPricePerSqm_noLeasehold :
    unitPricePerSqm .noLeasehold ⟨1, 1, by decide⟩ ⟨1, 1, by decide⟩ = 30_000 := by
  decide

theorem unitPricePerSqm_noLeasehold_half :
    unitPricePerSqm .noLeasehold ⟨1, 1, by decide⟩ ⟨1, 2, by decide⟩ = 15_000 := by
  decide

theorem unitPricePerSqm_leasehold :
    unitPricePerSqm .leaseholdRight ⟨7, 10, by decide⟩ ⟨1, 1, by decide⟩ = 21_000 := by
  decide

theorem unitPricePerSqm_leasehold_half :
    unitPricePerSqm .leaseholdRight ⟨7, 10, by decide⟩ ⟨1, 2, by decide⟩ = 10_500 := by
  decide

theorem unitPricePerSqm_underlyingLand :
    unitPricePerSqm .underlyingLand ⟨3, 10, by decide⟩ ⟨1, 1, by decide⟩ = 9_000 := by
  decide

theorem unitPricePerSqm_underlyingLand_half :
    unitPricePerSqm .underlyingLand ⟨3, 10, by decide⟩ ⟨1, 2, by decide⟩ = 4_500 := by
  decide

/-- 割合が 0 なら単価は 0（原文の「割合を乗じて計算した金額」どおり）。 -/
theorem unitPricePerSqm_ratio_zero :
    unitPricePerSqm .leaseholdRight ⟨0, 1, by decide⟩ ⟨1, 1, by decide⟩ = 0 := by
  decide

/-- 二号の算定対象となる一区画の土地等。全フィールドが caller-established。 -/
structure Parcel where
  cls   : LandClass
  ratio : TaxRate   -- 借地権割合 / 底地割合（イでは未使用）
  prev  : TaxRate   -- 前条係数（適用なし ⟨1,1⟩ / あり ⟨1,2⟩）
  area  : Nat       -- 面積（平方メートル）

/-- 一区画の二号金額:
    「一平方メートル当たりの金額に、当該土地等の面積を乗じて計算した金額」。 -/
def parcelAmount (p : Parcel) : Money :=
  unitPricePerSqm p.cls p.ratio p.prev * p.area

theorem parcelAmount_area_zero (p : Parcel) (h : p.area = 0) : parcelAmount p = 0 := by
  simp [parcelAmount, h]

theorem parcelAmount_noLeasehold_area_100 :
    parcelAmount { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
                   prev := ⟨1, 1, by decide⟩, area := 100 } = 3_000_000 := by
  decide

theorem parcelAmount_noLeasehold_half_area_100 :
    parcelAmount { cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
                   prev := ⟨1, 2, by decide⟩, area := 100 } = 1_500_000 := by
  decide

theorem parcelAmount_ratio_zero :
    parcelAmount { cls := .leaseholdRight, ratio := ⟨0, 1, by decide⟩,
                   prev := ⟨1, 1, by decide⟩, area := 1_000 } = 0 := by
  decide

/-- art. 18 二号: 「…当該土地等の面積を乗じて計算した金額の合計額」。 -/
def item2Amount (parcels : List Parcel) : Money :=
  (parcels.map parcelAmount).sum

theorem item2Amount_nil : item2Amount [] = 0 := by decide

theorem item2Amount_cons (p : Parcel) (ps : List Parcel) :
    item2Amount (p :: ps) = parcelAmount p + item2Amount ps := by
  simp [item2Amount]

theorem item2Amount_nonneg (parcels : List Parcel) : 0 ≤ item2Amount parcels :=
  Nat.zero_le _

-- ============================================================
-- art. 18(1) — 各号のいずれか多い金額
-- ============================================================

/-- art. 18(1): 「次の各号に掲げる金額のいずれか多い金額は、課税価格から控除する」。
    一号金額と二号金額の max。課税価格からの控除の適用自体は art. 22 側の話で
    本スライスでは NOT MODELLED（本 def は控除額のみを返す）。 -/
def basicDeduction (owner : OwnerClass) (parcels : List Parcel) : Money :=
  max (item1Amount owner) (item2Amount parcels)

theorem basicDeduction_ge_item1 (owner : OwnerClass) (parcels : List Parcel) :
    item1Amount owner ≤ basicDeduction owner parcels := by
  unfold basicDeduction
  exact Nat.le_max_left _ _

theorem basicDeduction_ge_item2 (owner : OwnerClass) (parcels : List Parcel) :
    item2Amount parcels ≤ basicDeduction owner parcels := by
  unfold basicDeduction
  exact Nat.le_max_right _ _

theorem basicDeduction_pos (owner : OwnerClass) (parcels : List Parcel) :
    0 < basicDeduction owner parcels :=
  Nat.lt_of_lt_of_le (item1Amount_pos owner) (basicDeduction_ge_item1 owner parcels)

theorem basicDeduction_eq_item1_of_item2_le {owner : OwnerClass} {parcels : List Parcel}
    (h : item2Amount parcels ≤ item1Amount owner) :
    basicDeduction owner parcels = item1Amount owner := by
  unfold basicDeduction
  exact Nat.max_eq_left h

theorem basicDeduction_eq_item2_of_item1_le {owner : OwnerClass} {parcels : List Parcel}
    (h : item1Amount owner ≤ item2Amount parcels) :
    basicDeduction owner parcels = item2Amount parcels := by
  unfold basicDeduction
  exact Nat.max_eq_right h

-- ==== kernel-decided smoke checks ====

example : capitalThreshold = 100_000_000 := by decide
example : item1LargeCorpAmount = 1_000_000_000 := by decide
example : item1OtherAmount = 1_500_000_000 := by decide
example : unitPriceBase = 30_000 := by decide
example : prevHalf.numDen = (1, 2) := by decide

-- 一号 > 二号（土地等なし → 二号 0）
example : basicDeduction .largeCorp [] = 1_000_000_000 := by decide
example : basicDeduction .individualOrOther [] = 1_500_000_000 := by decide

-- 二号 > 一号（単価 30_000 × 面積 40_000 = 1_200_000_000 > 十億円）
example : basicDeduction .largeCorp
    [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
       prev := ⟨1, 1, by decide⟩, area := 40_000 }] = 1_200_000_000 := by decide

example : basicDeduction .individualOrOther
    [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
       prev := ⟨1, 1, by decide⟩, area := 60_000 }] = 1_800_000_000 := by decide

-- 二分の一適用 / 割合 0 / 面積 0
example : basicDeduction .largeCorp
    [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
       prev := ⟨1, 2, by decide⟩, area := 100 }] = 1_000_000_000 := by decide
example : item2Amount
    [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
       prev := ⟨1, 2, by decide⟩, area := 100 }] = 1_500_000 := by decide
example : item2Amount
    [{ cls := .leaseholdRight, ratio := ⟨0, 1, by decide⟩,
       prev := ⟨1, 1, by decide⟩, area := 1_000 }] = 0 := by decide
example : item2Amount
    [{ cls := .noLeasehold, ratio := ⟨1, 1, by decide⟩,
       prev := ⟨1, 1, by decide⟩, area := 0 }] = 0 := by decide

end JapanTaxLaw.LandValueTaxBasicDeduction
