import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresApportionment — 租税特別措置法施行令 第二十五条の十八 / 第四十条の五の二（按分計算）の bounded L4 モデル

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 租税特別措置法施行令)

原文（担当範囲・正規化済み・UTF-8）: W_M_special_order.txt（2 条文）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 25の18（物納による譲渡所得等の非課税）
    「政令で定める額が当該財産の価額のうちに占める割合を、当該財産の価額に乗じて計算した金額に相当する部分とする」
  art. 40の5の2（特定贈与者が二人以上ある場合の控除額の計算）
    「百十万円に、特定贈与者ごとの贈与税の課税価格が当該課税価格の合計額のうちに占める割合を乗じて計算するものとする」

Modelled (only the explicit statutory arithmetic):

  * 按分共通 `apportion base numerator denominator = base * numerator / denominator`。
    Nat の除算は `n / 0 = 0` なので分母零でも停止し 0 を返す（安全版を兼ねる）。
  * art. 25の18: 「政令で定める額が当該財産の価額のうちに占める割合を、当該財産の価額に
    乗じて計算した金額に相当する部分」を割合計算の形に忠実に
    `nonTaxablePortion propertyValue prescribedAmount =
       apportion propertyValue prescribedAmount propertyValue`
    すなわち `propertyValue * prescribedAmount / propertyValue` とモデル化する。
    割合そのものは分子/分母ペア `(prescribedAmount, propertyValue)` で表現する。
    propertyValue > 0 なら結果は prescribedAmount に等しい。
  * art. 40の5の2: 「百十万円に、特定贈与者ごとの課税価格が合計額のうちに占める割合を
    乗じて計算」を
    `perDonorDeduction taxablePrice totalTaxablePrice =
       apportion specifiedGiftBasicDeduction taxablePrice totalTaxablePrice`
    すなわち `1_100_000 * taxablePrice / totalTaxablePrice` とモデル化する。
    割合は分子/分母ペア `(taxablePrice, totalTaxablePrice)`。
    合計額が 0 なら 0（算出不能ケースのモデル規約）。

Scope & honest boundaries:

  * 財産価額・政令額・特定贈与者ごとの課税価格・課税価格の合計額は **caller-established**。
    金額の認定・該当性判定は本モジュールの外で行い、Bool は算定式に入れない。
  * 原文は按分の割合を示し端数規定を持たない。Money = Nat の除算による**切り捨て**を
    丸め規則として明示する（他モジュールの applyFloor と同一慣例）。解釈を保証しない。
  * 「二人以上の特定贈与者からの贈与」の該当性、相続時精算課税適用者の特定、
    死亡により効力を生ずる贈与の除外、その他の政令要件は **caller-established** で
    NOT MODELLED。
  * propertyValue = 0 / totalTaxablePrice = 0 の退化ケースに法的意味があるとは主張しない。
    入力の妥当性（分母が正であること）は caller が担保する。
  * 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.SpecialMeasuresApportionment

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 按分共通
-- ============================================================

/-- 按分共通: `base * numerator / denominator`（切り捨て）。
    Nat 除算の定義により `denominator = 0` のとき 0 を返すため、分母零でも安全。 -/
def apportion (base numerator denominator : Money) : Money :=
  base * numerator / denominator

theorem apportion_eq (base numerator denominator : Money) :
    apportion base numerator denominator = base * numerator / denominator := rfl

/-- 分母零 → 0（Nat の `n / 0 = 0` による安全版）。 -/
theorem apportion_zero_denominator (base numerator : Money) :
    apportion base numerator 0 = 0 := by
  unfold apportion
  simp

/-- 分子零 → 0。 -/
theorem apportion_zero_numerator (base denominator : Money) :
    apportion base 0 denominator = 0 := by
  unfold apportion
  simp

/-- 按分 1:1（base = numerator = denominator > 0）→ base。 -/
theorem apportion_one_to_one (base : Money) (h : base ≠ 0) :
    apportion base base base = base := by
  unfold apportion
  exact Nat.mul_div_cancel base (Nat.pos_of_ne_zero h)

-- ============================================================
-- art. 25の18 — 政令額の割合を財産価額に乗じた非課税部分
-- ============================================================

/-- art. 25の18: 「政令で定める額が当該財産の価額のうちに占める割合」を
    分子/分母ペアで表現したもの。分子 = 政令額、分母 = 財産価額。 -/
def nonTaxablePortionRatio (propertyValue prescribedAmount : Money) : Money × Money :=
  (prescribedAmount, propertyValue)

/-- art. 25の18: 非課税部分 = 財産価額 × (政令額 / 財産価額)（切り捨て）。
    原文の割合計算の形に忠実に `apportion` で表現する。
    財産価額・政令額は caller-established。財産価額 = 0 なら 0（モデル規約）。 -/
def nonTaxablePortion (propertyValue prescribedAmount : Money) : Money :=
  apportion propertyValue prescribedAmount propertyValue

theorem nonTaxablePortion_eq (propertyValue prescribedAmount : Money) :
    nonTaxablePortion propertyValue prescribedAmount =
      propertyValue * prescribedAmount / propertyValue := rfl

/-- 財産価額が正なら、割合計算の結果は政令額そのものに等しい。 -/
theorem nonTaxablePortion_eq_prescribedAmount (propertyValue prescribedAmount : Money)
    (h : propertyValue ≠ 0) :
    nonTaxablePortion propertyValue prescribedAmount = prescribedAmount := by
  unfold nonTaxablePortion apportion
  rw [Nat.mul_comm]
  exact Nat.mul_div_cancel prescribedAmount (Nat.pos_of_ne_zero h)

/-- 財産価額 = 0 の退化ケース → 0。 -/
theorem nonTaxablePortion_zero_propertyValue (prescribedAmount : Money) :
    nonTaxablePortion 0 prescribedAmount = 0 := by
  unfold nonTaxablePortion apportion
  simp

-- ============================================================
-- art. 40の5の2 — 特定贈与者ごとの控除額（百十万円の按分）
-- ============================================================

/-- art. 40の5の2: 「百十万円」の定数。 -/
def specifiedGiftBasicDeduction : Money := 1_100_000

theorem specifiedGiftBasicDeduction_pos : 0 < specifiedGiftBasicDeduction := by decide
theorem specifiedGiftBasicDeduction_eq : specifiedGiftBasicDeduction = 1_100_000 := rfl

/-- art. 40の5の2: 「特定贈与者ごとの課税価格が当該課税価格の合計額のうちに占める割合」を
    分子/分母ペアで表現したもの。分子 = 当該贈与者の課税価格、分母 = 合計額。 -/
def perDonorRatio (taxablePrice totalTaxablePrice : Money) : Money × Money :=
  (taxablePrice, totalTaxablePrice)

/-- art. 40の5の2: 控除額 = 1_100_000 × (当該贈与者の課税価格 / 合計課税価格)（切り捨て）。
    課税価格・合計額は caller-established。合計額 = 0 なら 0（モデル規約）。 -/
def perDonorDeduction (taxablePrice totalTaxablePrice : Money) : Money :=
  apportion specifiedGiftBasicDeduction taxablePrice totalTaxablePrice

theorem perDonorDeduction_eq (taxablePrice totalTaxablePrice : Money) :
    perDonorDeduction taxablePrice totalTaxablePrice =
      1_100_000 * taxablePrice / totalTaxablePrice := rfl

/-- 合計課税価格 = 0 の退化ケース → 0。 -/
theorem perDonorDeduction_zero_total (taxablePrice : Money) :
    perDonorDeduction taxablePrice 0 = 0 := by
  unfold perDonorDeduction apportion
  simp

/-- 単一の贈与者（当該課税価格 = 合計額 > 0）なら控除額は百十万円に等しい。 -/
theorem perDonorDeduction_full (totalTaxablePrice : Money) (h : totalTaxablePrice ≠ 0) :
    perDonorDeduction totalTaxablePrice totalTaxablePrice = 1_100_000 := by
  unfold perDonorDeduction apportion
  exact Nat.mul_div_cancel specifiedGiftBasicDeduction (Nat.pos_of_ne_zero h)

/-- 合計額が固定なら、控除額は当該贈与者の課税価格について単調非減少。 -/
theorem perDonorDeduction_mono {a b totalTaxablePrice : Money} (h : a ≤ b) :
    perDonorDeduction a totalTaxablePrice ≤ perDonorDeduction b totalTaxablePrice := by
  unfold perDonorDeduction apportion
  exact Nat.div_le_div_right (Nat.mul_le_mul_left _ h)

-- ============================================================
-- kernel-decided smoke checks
-- ============================================================

-- apportion: 1:1 / 零 / 分母零 / 端数切り捨て
example : apportion 100 100 100 = 100 := by decide
example : apportion 1_000_000 250_000 1_000_000 = 250_000 := by decide
example : apportion 10 7 3 = 23 := by decide
example : apportion 10 0 3 = 0 := by decide
example : apportion 10 3 0 = 0 := by decide

-- nonTaxablePortionRatio / nonTaxablePortion
example : nonTaxablePortionRatio 10_000_000 2_000_000 = (2_000_000, 10_000_000) := by decide
example : nonTaxablePortion 10_000_000 2_000_000 = 2_000_000 := by decide
example : nonTaxablePortion 100 7 = 7 := by decide
example : nonTaxablePortion 0 7 = 0 := by decide

-- perDonorDeduction: 端数切り捨て / 1:1 / 分母零 / 按分
example : specifiedGiftBasicDeduction = 1_100_000 := by decide
example : perDonorRatio 4_000_000 10_000_000 = (4_000_000, 10_000_000) := by decide
example : perDonorDeduction 4_000_000 10_000_000 = 440_000 := by decide
example : perDonorDeduction 3_000_000 10_000_000 = 330_000 := by decide
example : perDonorDeduction 1 3 = 366_666 := by decide
example : perDonorDeduction 10_000_000 10_000_000 = 1_100_000 := by decide
example : perDonorDeduction 5 0 = 0 := by decide

end JapanTaxLaw.SpecialMeasuresApportionment
