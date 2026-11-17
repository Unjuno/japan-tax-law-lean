import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresMisc — 租税特別措置法 art. 29の4 / 36 / 37の15 / 41の10 の bounded L4 モデル

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  (revision CurrentEnforced per data/INVENTORY.json;
   same pin as DeemedCapitalGainsCost.lean / ResidentialTransferSpecialTax.lean /
   ListedDividendWithholding.lean / SpecialGiftRate.lean)

原文（担当範囲・正規化済み）: W_E_special.txt（4 条）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 41の10(1)
    「給付補塡金、利息、利益又は差益（以下この条及び次条において「給付補塡金等」という。）に
      ついては、同法第二十二条及び第八十九条並びに第百六十五条の規定にかかわらず、他の所得と
      区分し、その支払を受けるべき金額に対し百分の十五の税率を適用して所得税を課する。」
  art. 36
    「…控除すべき金額の合計額が五千万円を超えることとなるときは、これらの規定により控除すべき
      金額は、通じて五千万円の範囲内において、政令で定めるところにより計算した金額とする。」
  art. 37の15(2)
    「収入金額が当該貸付信託の受益権等の所得税法第三十三条第三項に規定する取得費及びその譲渡に
      要した費用の額の合計額又はその譲渡に係る必要経費に満たない場合におけるその不足額については、
      同法の規定の適用については、ないものとみなす。」

Modelled (only explicit statutory arithmetic):

  * art. 41の10(1) 給付補塡金等の分離課税: 税額 = 支払を受けるべき金額 × 15 / 100 (floor)。
  * art. 36       控除額の「通じて五千万円の範囲内」という明示上限の cap。
  * art. 37の15(2) 収入金額 < 取得費等 の不足額を「ないものとみなす」
                  → 認識される差益 = 収入金額 − 取得費等 (saturating Nat subtraction)。

NOT MODELLED (no explicit statutory formula — see also docs/STAGING_WE.md):

  * art. 29の4  未払賃金を「退職手当等の金額とみなして」所得税法の規定を適用する規定。
                条文に金額算定の数式はなく、みなし前の給与等・退職手当等の額は
                caller-established である。よって def を作らない。
  * art. 37の15(1) 「譲渡による所得については、所得税を課さない」は免税の宣言規定であり、
                数式がない。def を作らない（doc-comment で言及するのみ）。
  * art. 36 の「政令で定めるところにより計算した金額」そのものは政令委任で、
                条文に計算式がない。モデル化するのは明示的な上限（五千万円の範囲内）のみ。

Scope & honest boundaries:

  * 課税標準額・適用判定（居住者／恒久的施設を有する非居住者であること、昭和六十三年四月一日
    以後の支払、国内源泉所得該当性、給付補塡金等の該当性、二以上の規定の適用、貸付信託の受益権等
    への該当、取得費と必要経費の別）はすべて caller-established。Bool は計算式に入れない。
  * 政令細目（art. 36 の控除額の具体的計算、art. 37の15 の受益権等の範囲）は非モデル化・
    caller-established。
  * 端数・丸めの明文は本条にない。 Money = Nat の除算による切り捨てを丸め規則として明示する
    （他モジュールの applyFloor と同一慣例）。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 41の10(1) — 給付補塡金等の分離課税（百分の十五）
-- ============================================================

/-- art. 41の10(1): 「百分の十五の税率」。 -/
def benefitSupplementSeparateRate : TaxRate := ⟨15, 100, by decide⟩

/-- art. 41の10(1): 所得税額 = 支払を受けるべき金額 × 15 / 100（切り捨て）。
    「他の所得と区分し」・給付補塡金等の該当性は caller-established で式に入れない。 -/
def benefitSupplementSeparateTax (paymentAmount : Money) : Money :=
  benefitSupplementSeparateRate.applyFloor paymentAmount

theorem benefitSupplementSeparateRate_num_pos : 0 < benefitSupplementSeparateRate.num := by decide
theorem benefitSupplementSeparateRate_den_pos : 0 < benefitSupplementSeparateRate.den := by decide

theorem benefitSupplementSeparateTax_eq (amount : Money) :
    benefitSupplementSeparateTax amount = amount * 15 / 100 := rfl

-- ============================================================
-- art. 36 — 控除合計額の上限（通じて五千万円の範囲内）
-- ============================================================

/-- art. 36: 控除すべき金額の上限 五千万円。 -/
def assetTransferDeductionCeiling : Money := 50_000_000

/-- art. 36: 「通じて五千万円の範囲内」という明示的上限を適用した控除額。
    `computed` は「政令で定めるところにより計算した金額」を caller-established で受け取る。
    本 def は政令の計算内容をモデル化せず、上限（範囲内）の強制のみを行う補助関数である。
    上限を超える政令計算額は想定外であり、入力の妥当性は caller が担保する。 -/
def assetTransferDeductionCapped (computed : Money) : Money :=
  min computed assetTransferDeductionCeiling

theorem assetTransferDeductionCeiling_pos : 0 < assetTransferDeductionCeiling := by decide
theorem assetTransferDeductionCeiling_eq : assetTransferDeductionCeiling = 50_000_000 := rfl

theorem assetTransferDeductionCapped_le_ceiling (computed : Money) :
    assetTransferDeductionCapped computed ≤ assetTransferDeductionCeiling := by
  unfold assetTransferDeductionCapped
  exact Nat.min_le_right _ _

theorem assetTransferDeductionCapped_le_computed (computed : Money) :
    assetTransferDeductionCapped computed ≤ computed := by
  unfold assetTransferDeductionCapped
  exact Nat.min_le_left _ _

/-- 政令計算額が上限以内なら cap は効かず控除額はそのまま。 -/
theorem assetTransferDeductionCapped_of_le (computed : Money)
    (h : computed ≤ assetTransferDeductionCeiling) :
    assetTransferDeductionCapped computed = computed := by
  unfold assetTransferDeductionCapped
  exact Nat.min_eq_left h

-- ============================================================
-- art. 37の15(2) — 不足額をないものとみなす（saturating Nat 減算）
-- ============================================================

/-- art. 37の15(2): 収入金額から「取得費及びその譲渡に要した費用の額の合計額又はその譲渡に
    係る必要経費」を控除した認識差益。収入金額が当該合計額に満たない場合の不足額は
    「ないものとみなす」ため、Nat の saturating subtraction で 0 に floor される。
    `cost` は上記合計額（又は必要経費）を caller-established で受け取り、区分判定は式に入れない。 -/
def lendingTrustGain (proceeds cost : Money) : Money :=
  proceeds - cost

/-- cost ≤ proceeds のとき、通常の減算と一致する（exact）。 -/
theorem lendingTrustGain_exact (proceeds cost : Money) (_h : cost ≤ proceeds) :
    lendingTrustGain proceeds cost = proceeds - cost := rfl

/-- proceeds ≤ cost（収入金額が合計額に満たない／同額）のとき不足額はないものとみなされ 0。 -/
theorem lendingTrustGain_zero_of_shortfall (proceeds cost : Money) (h : proceeds ≤ cost) :
    lendingTrustGain proceeds cost = 0 := by
  unfold lendingTrustGain
  exact Nat.sub_eq_zero_of_le h

theorem lendingTrustGain_le_proceeds (proceeds cost : Money) :
    lendingTrustGain proceeds cost ≤ proceeds := by
  unfold lendingTrustGain
  exact Nat.sub_le _ _

-- ============================================================
-- kernel-decided smoke checks
-- ============================================================

-- art. 41の10(1): 15%
example : benefitSupplementSeparateTax 1_000_000 = 150_000 := by decide
example : benefitSupplementSeparateTax 0 = 0 := by decide
example : benefitSupplementSeparateTax 100 = 15 := by decide
example : benefitSupplementSeparateTax 99 = 14 := by decide

-- art. 36: 5,000万 cap
example : assetTransferDeductionCapped 30_000_000 = 30_000_000 := by decide
example : assetTransferDeductionCapped 50_000_000 = 50_000_000 := by decide
example : assetTransferDeductionCapped 80_000_000 = 50_000_000 := by decide

-- art. 37の15(2): saturating gain
example : lendingTrustGain 10_000_000 6_000_000 = 4_000_000 := by decide
example : lendingTrustGain 6_000_000 10_000_000 = 0 := by decide
example : lendingTrustGain 5_000 5_000 = 0 := by decide

end JapanTaxLaw
