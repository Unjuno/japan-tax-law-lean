import JapanTaxLaw.TaxFinance

/-!
# SpecifiedRelativeSpecialDeduction — 所得税法 第八十四条の二（特定親族特別控除）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  SHA-256 pin: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

担当範囲原文（pinned JSON の正規化テキストから転記）:

  一 合計所得金額が八十五万円以下である特定親族 六十三万円
  二 合計所得金額が八十五万円を超え百十五万円以下である特定親族
    六十三万円からその特定親族の合計所得金額のうち八十四万一円を超える部分の金額に
    二を乗じた金額（当該乗じた金額が十万円の整数倍の金額から八万円を控除した金額でないときは、
    十万円の整数倍の金額から八万円を控除した金額で当該乗じた金額に満たないもののうち
    最も多い金額とする。）を控除した金額
  三 百十五万円超百二十万円以下 六万円 / 四 百二十万円超 三万円

Pinned needle（doc-comment のみ）:

  「六十三万円からその特定親族の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額」

Modelled（明示された算術のみ）:

  * 区分 1: 所得 ≤ 850,000 → 630,000 円
  * 区分 2: 850,000 < 所得 ≤ 1,150,000 → 630,000 − round(excess)
    ここで excess = (所得 − 840,001) × 2、round(e) = 十万円の整数倍 − 八万円 のうち
    e を超えない最大値（e < 20,000 は定義域外なので防御的に 0）
  * 区分 3: 1,150,000 < 所得 ≤ 1,200,000 → 60,000 円
  * 区分 4: 1,200,000 < 所得 → 30,000 円

Scope & boundaries:

  * 年齢 19–23 歳、生計一、配偶者除外、里親委託、青色事業専従者除外、合計所得
    1,230,000 以下、適用除外（他条文の適用・政令）は **NOT MODELLED / caller-established**。
  * 丸めは原文の「十万円の整数倍から八万円を控除」を Nat 整数比で符号化する。
  * fidelity-only; 法的正しさを保証しない。No sorry / admit / axiom.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 十万円の整数倍から八万円を控除した金額のうち、 excess を超えない最大値。
    excess < 20,000 は原文の丸め手続の定義域外なので防御的に 0 を返す。 -/
def specialRelativeRound (excess : Money) : Money :=
  if excess < 20_000 then 0
  else ((excess + 80_000) / 100_000) * 100_000 - 80_000

/-- 特定親族一人当たりの特別控除額（円）。所得 Money = Nat（円）。 -/
def specifiedRelativeSpecialDeduction (income : Money) : Money :=
  if income ≤ 850_000 then 630_000
  else if income ≤ 1_150_000 then
    630_000 - specialRelativeRound ((income - 840_001) * 2)
  else if income ≤ 1_200_000 then 60_000
  else 30_000

theorem round_at_floor : specialRelativeRound 20_000 = 20_000 := by decide
theorem round_below_step : specialRelativeRound 19_999 = 0 := by decide
theorem round_next_step : specialRelativeRound 119_999 = 20_000 := by decide
theorem round_step_120k : specialRelativeRound 120_000 = 120_000 := by decide

theorem deduction_at_850k : specifiedRelativeSpecialDeduction 850_000 = 630_000 := by decide
theorem deduction_just_above_850k : specifiedRelativeSpecialDeduction 850_001 = 610_000 := by decide
theorem deduction_at_1_150k : specifiedRelativeSpecialDeduction 1_150_000 = 110_000 := by decide
theorem deduction_above_1_150k : specifiedRelativeSpecialDeduction 1_150_001 = 60_000 := by decide
theorem deduction_at_1_200k : specifiedRelativeSpecialDeduction 1_200_000 = 60_000 := by decide
theorem deduction_above_1_200k : specifiedRelativeSpecialDeduction 1_200_001 = 30_000 := by decide

theorem deduction_zero : specifiedRelativeSpecialDeduction 0 = 630_000 := by decide

/-- 840,001 を 841,000 と誤記すると境界値が変わる（反例）。 -/
theorem no_base_841k_error : specifiedRelativeSpecialDeduction 850_001 ≠ 612_000 := by decide

/-- 控除額は任意の所得で 630,000 円を超えない（全分岐の到達可能範囲）。 -/
theorem deduction_bounded (income : Money) : specifiedRelativeSpecialDeduction income ≤ 630_000 := by
  by_cases h1 : income ≤ 850_000
  · simp [specifiedRelativeSpecialDeduction, h1]
  · by_cases h2 : income ≤ 1_150_000
    · simp [specifiedRelativeSpecialDeduction, h1, h2, Nat.sub_le]
    · by_cases h3 : income ≤ 1_200_000
      · simp [specifiedRelativeSpecialDeduction, h1, h2, h3]
      · simp [specifiedRelativeSpecialDeduction, h1, h2, h3]

end JapanTaxLaw
