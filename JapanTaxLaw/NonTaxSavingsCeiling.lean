import JapanTaxLaw.TaxFinance

/-!
# NonTaxSavingsCeiling — 所得税法施行令 art.40（非課税貯蓄申告書）bounded L4 モデル

Sources (pinned):

  Law id: 340CO0000000096（所得税法施行令 / CabinetOrder）
  Revision: 340CO0000000096_20260522_508CO0000000093
  Amendment enforcement date: 2026-05-22
  Raw snapshot: data/raw/340CO0000000096_20260522_508CO0000000093.law.json
  Article Num 40, flat/normalized leaf text 186 chars, U+3000 count 0
  （担当範囲原文 C8_NONTAX40.txt の本文 186 文字と完全一致）。

原文（一字一句、186 文字）:

  （非課税貯蓄申告書）第四十条国内に住所を有する個人が非課税貯蓄申告書を提出する
  場合には、当該申告書に記載する法第十条第三項第三号（非課税貯蓄申告書の記載事項）
  に掲げる最高限度額は、一万円に整数を乗じた金額で、かつ、三百万円（当該申告書に
  記載すべき同項第四号に掲げる最高限度額がある場合には、三百万円から当該最高限度額の
  合計額を控除した残額）以下の金額としなければならない。

数式の導出（coordinator の要約ではなく、上記原文の逐語のみを根拠とする）:

  * 「…に掲げる最高限度額は、一万円に整数を乗じた金額で」
      → 記載する最高限度額 = 10,000 × units
        （`declaredCeiling units = unitYen * units`）。
        「整数」は金額（円）なので非負として自然数でモデル化する（caller-established）。
  * 「かつ、三百万円（…）以下の金額としなければならない」
      → 制約 `declaredCeiling units ≤ cap`。
  * 括弧内「当該申告書に記載すべき同項第四号に掲げる最高限度額がある場合には、
    三百万円から当該最高限度額の合計額を控除した残額」
      → 第四号の最高限度額の合計額を item4Total とすると上限は
        `residualCeiling item4Total = 3,000,000 − item4Total`（saturating、
        item4Total ≥ 3,000,000 なら 0）。第四号が無い場合は caller が
        item4Total = 0 を渡し、上限は 3,000,000 になる。
  * したがって中核制約は `declaredCeiling units ≤ residualCeiling item4Total`。

Scope & honest boundaries:

  * 各金額（一万円・三百万円・第四号の最高限度額の合計額）、整数（unit 数）、
    および該当性（国内に住所を有する個人、第四号の最高限度額の有無）はすべて
    caller-established。Bool は金額式に入れない（該当性は引数 item4Total の
    選択として呼び出し側が確定する）。
  * 法第十条第三項第三号（非課税貯蓄申告書の記載事項）および同項第四号の
    具体的記載事項・算式は NOT MODELLED。
  * 「残額」が負になり得ないとの読みから saturating 減算を採用するが、原文に
    「零を下回る場合には零」の明示句はない。合計額が三百万円を超える場合の
    法的取扱いの詳細は主張しない。
  * Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw.NonTaxSavingsCeiling

open JapanTaxLaw.TaxFinance

/-- 一万円（原文「一万円」）。unit multiplier。 -/
def unitYen : Money := 10_000

/-- 三百万円（原文「三百万円」）。第四号の最高限度額が無い場合の上限。 -/
def baseCeilingYen : Money := 3_000_000

/-- 原文「一万円に整数を乗じた金額」。申告書に記載する最高限度額そのもの。
    `units` は caller-established な非負整数（金額なので自然数で表現）。 -/
def declaredCeiling (units : Nat) : Money := unitYen * units

/-- 原文「三百万円（…同項第四号…がある場合には、三百万円から当該最高限度額の
    合計額を控除した残額）」。第四号の最高限度額の合計額 `item4Total` を
    三百万円から控除した残額。saturating（`item4Total ≥ 三百万円` → 0）。
    第四号が無い場合は caller が `item4Total = 0` を渡す。 -/
def residualCeiling (item4Total : Money) : Money :=
  if baseCeilingYen ≤ item4Total then 0 else baseCeilingYen - item4Total

/-- 原文「かつ、…以下の金額」の制約。記載する最高限度額が上限以下であることを
    表すモデル性質（法的意味の等価証明ではない）。 -/
abbrev ceilingWithinLimit (units : Nat) (item4Total : Money) : Prop :=
  declaredCeiling units ≤ residualCeiling item4Total

/-- 派生量（便宜的な補助 def）: 上限内で取りうる最大の整数 unit 数
    `⌊residualCeiling / 一万円⌋`。残額が一万円の整数倍でない場合の端数を
    切り捨てる（原文に直接現れる式ではない）。 -/
def maxAllowedUnits (item4Total : Money) : Nat :=
  residualCeiling item4Total / unitYen

-- ==== verified facts (model properties only) ====

/-- 一万円は正。 -/
theorem unitYen_pos : 0 < unitYen := by decide

/-- 三百万円は正。 -/
theorem baseCeilingYen_pos : 0 < baseCeilingYen := by decide

/-- 整数 0 倍 → 金額 0（境界: 整数 0）。 -/
theorem declaredCeiling_zero : declaredCeiling 0 = 0 := by decide

/-- unit 数が正なら記載額も正。 -/
theorem declaredCeiling_pos {units : Nat} (h : 0 < units) :
    0 < declaredCeiling units := by
  unfold declaredCeiling unitYen
  exact Nat.mul_pos (by decide) h

/-- 記載額は一万円の整数倍（原文「一万円に整数を乗じた金額」）。 -/
theorem declaredCeiling_mod_unitYen (units : Nat) :
    declaredCeiling units % unitYen = 0 := by
  unfold declaredCeiling
  exact Nat.mod_eq_zero_of_dvd ⟨units, rfl⟩

/-- unit 数について単調非減少。 -/
theorem declaredCeiling_mono {a b : Nat} (h : a ≤ b) :
    declaredCeiling a ≤ declaredCeiling b := by
  unfold declaredCeiling
  exact Nat.mul_le_mul_left unitYen h

/-- 第四号の合計額 0（該当なし）→ 上限は三百万円。 -/
theorem residualCeiling_zero : residualCeiling 0 = baseCeilingYen := by decide

/-- 合計額が三百万円以上 → 残額 0（saturating）。 -/
theorem residualCeiling_saturate (item4Total : Money)
    (h : baseCeilingYen ≤ item4Total) : residualCeiling item4Total = 0 := by
  unfold residualCeiling
  rw [ite_eq_left h]

/-- 合計額が三百万円未満 → 原文どおりの差。 -/
theorem residualCeiling_eq (item4Total : Money) (h : item4Total < baseCeilingYen) :
    residualCeiling item4Total = baseCeilingYen - item4Total := by
  unfold residualCeiling
  rw [ite_eq_right (Nat.not_le_of_gt h)]

/-- 残額は常に三百万円以下。 -/
theorem residualCeiling_le_base (item4Total : Money) :
    residualCeiling item4Total ≤ baseCeilingYen := by
  unfold residualCeiling
  by_cases h : baseCeilingYen ≤ item4Total
  · rw [ite_eq_left h]
    exact Nat.zero_le _
  · rw [ite_eq_right h]
    exact Nat.sub_le _ _

/-- 合計額が三百万円未満なら残額は正。 -/
theorem residualCeiling_pos (item4Total : Money) (h : item4Total < baseCeilingYen) :
    0 < residualCeiling item4Total := by
  rw [residualCeiling_eq item4Total h]
  exact Nat.sub_pos_of_lt h

/-- 整数 0 の記載額は常に上限内。 -/
theorem ceilingWithinLimit_zero_units (item4Total : Money) :
    ceilingWithinLimit 0 item4Total := by
  unfold ceilingWithinLimit declaredCeiling
  simp

/-- 合計額 0 のとき、許される最大 unit 数は 300。 -/
theorem maxAllowedUnits_zero : maxAllowedUnits 0 = 300 := by decide

/-- 合計額が三百万円以上なら最大 unit 数は 0。 -/
theorem maxAllowedUnits_saturate (item4Total : Money)
    (h : baseCeilingYen ≤ item4Total) : maxAllowedUnits item4Total = 0 := by
  unfold maxAllowedUnits
  rw [residualCeiling_saturate item4Total h]
  simp

-- ==== kernel-decided smoke checks (boundaries) ====

-- 定数
example : unitYen = 10_000 := by decide
example : baseCeilingYen = 3_000_000 := by decide
-- 整数 0
example : declaredCeiling 0 = 0 := by decide
example : declaredCeiling 1 = 10_000 := by decide
-- 上限ちょうど（300 × 一万円 = 三百万円）
example : declaredCeiling 300 = 3_000_000 := by decide
-- 合計額 ≥ 300 万で 0（saturating）
example : residualCeiling 3_000_000 = 0 := by decide
example : residualCeiling 3_500_000 = 0 := by decide
example : residualCeiling 9_999_999 = 0 := by decide
-- 第四号なし / 控除後
example : residualCeiling 0 = 3_000_000 := by decide
example : residualCeiling 1_000_000 = 2_000_000 := by decide
-- 端数（残額が一万円の整数倍でない）
example : residualCeiling 1 = 2_999_999 := by decide
-- 上限ちょうどは許容 / 1 unit 超過は不可
example : ceilingWithinLimit 300 0 := by decide
example : ¬ ceilingWithinLimit 301 0 := by decide
-- 端数を含む上限の境界
example : ceilingWithinLimit 299 1 := by decide
example : ¬ ceilingWithinLimit 300 1 := by decide
-- 整数 0 は上限 0 でも許容
example : ceilingWithinLimit 0 3_000_000 := by decide
-- 最大 unit 数（端数切り捨て）
example : maxAllowedUnits 0 = 300 := by decide
example : maxAllowedUnits 1 = 299 := by decide
example : maxAllowedUnits 3_000_000 = 0 := by decide

end JapanTaxLaw.NonTaxSavingsCeiling
