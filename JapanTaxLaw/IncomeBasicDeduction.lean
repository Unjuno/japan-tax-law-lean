import JapanTaxLaw.TaxFinance

/-!
# IncomeBasicDeduction — 所得税法 art. 86（基礎控除）の bounded L4 モデル

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  （current enforced revision per data/INVENTORY.json, same pin as
   IndividualIncomeTax.lean / IncomeMiscDeductions.lean /
   IncomeDependentDeductions.lean）

Namespace note: a dedicated sub-namespace `JapanTaxLaw.IncomeBasicDeduction` is used
on purpose so this slice cannot collide with the flat-namespace `basicDeduction`
constants of 地方税法 art. 34 (LocalIncomeTax.lean), which carry DIFFERENT amounts.

Pinned bytes 逐語 (needle evidence, transcribed one-for-one from the normalized
source; `re.sub(r"[\s　]+", "", ...)` 正規化後も一字不変。担当範囲原文・pinned JSON の
両方で各 1 回出現を `.find()` で確認済み):

  art. 86(1) 本文 「合計所得金額が二千五百万円以下である居住者については、その者のその年分の総所得金額、退職所得金額又は山林所得金額から次の各号に掲げる場合の区分に応じ当該各号に定める金額を控除する。」
  art. 86(1) 一   「一その居住者の合計所得金額が二千三百五十万円以下である場合五十八万円」
  art. 86(1) 二   「二その居住者の合計所得金額が二千三百五十万円を超え二千四百万円以下である場合四十八万円」
  art. 86(1) 三   「三その居住者の合計所得金額が二千四百万円を超え二千四百五十万円以下である場合三十二万円」
  art. 86(1) 四   「四その居住者の合計所得金額が二千四百五十万円を超え二千五百万円以下である場合十六万円」
  art. 86(2)     「前項の規定による控除は、基礎控除という。」

金額の読み取り（日本語数字 → Arabic、原文どおり）:

  五十八万円 = 580_000（合計所得金額 2,350万円以下）
  四十八万円 = 480_000（2,350万円超 2,400万円以下）
  三十二万円 = 320_000（2,400万円超 2,450万円以下）
  十六万円   = 160_000（2,450万円超 2,500万円以下）
  2,500万円超 → 第1項の適用外（控除なし = 0）

Computational result (bounded):

  basicDeductionAmount(totalIncome) =
    totalIncome ≤ 23_500_000            → 580_000
    23_500_001 ≤ totalIncome ≤ 24_000_000 → 480_000
    24_000_001 ≤ totalIncome ≤ 24_500_000 → 320_000
    24_500_001 ≤ totalIncome ≤ 25_000_000 → 160_000
    totalIncome ≥ 25_000_001            → 0
  taxableAfterBasicDeduction(income, deduction) = income − deduction (saturating Nat)

Out of scope / honesty notes:

  * 「合計所得金額が 2,500万円以下である居住者について」という適用要件（居住者であること
    及び合計所得金額の算定）は caller-established とし、区分判定・金額算出式には
    居住者判定の Bool を混入させません。合計所得金額は caller-established な入力です。
  * 本モデルは**所得控除の額のみ**を扱い、税額計算（所得税の課税所得・税率適用・
    復興特別所得税・防衛特別所得税）は一切含みません。
  * 控除の適用顺序、他の所得控除との調整、総所得金額等自体の算定、端数処理
    （通則法 art. 118 / 119）は非モデル化。
  * 所得税法全体の完成・網羅を主張しません。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat; no `sorry`, `admit`, `Classical.choice` or `propext`.
-/ 

namespace JapanTaxLaw.IncomeBasicDeduction

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 86 — 区分ごとの控除額定数（原文の日本語数字を Arabic 化）
-- ============================================================

/-- art. 86(1) 一: 合計所得金額 2,350万円以下 → 五十八万円。 -/
def basicDeductionLe2350 : Money := 580_000

/-- art. 86(1) 二: 2,350万円超 2,400万円以下 → 四十八万円。 -/
def basicDeductionLe2400 : Money := 480_000

/-- art. 86(1) 三: 2,400万円超 2,450万円以下 → 三十二万円。 -/
def basicDeductionLe2450 : Money := 320_000

/-- art. 86(1) 四: 2,450万円超 2,500万円以下 → 十六万円。 -/
def basicDeductionLe2500 : Money := 160_000

-- ============================================================
-- art. 86 — 区分選択と控除後金额
-- ============================================================

/-- art. 86(1): 合計所得金額（caller-established）に応じた基礎控除額。
    境界を正確に: ≤23_500_000→580_000 / 23_500_001..24_000_000→480_000 /
    24_000_001..24_500_000→320_000 / 24_500_001..25_000_000→160_000 /
    ≥25_000_001→0（第1項の適用外）。 -/
def basicDeductionAmount (totalIncome : Money) : Money :=
  if totalIncome ≤ 23_500_000 then basicDeductionLe2350
  else if totalIncome ≤ 24_000_000 then basicDeductionLe2400
  else if totalIncome ≤ 24_500_000 then basicDeductionLe2450
  else if totalIncome ≤ 25_000_000 then basicDeductionLe2500
  else 0

/-- 控除後金额 = 総所得等 − 控除額（saturating Nat 減算）。
    税額計算ではなく所得控除の額のみをモデル化する。 -/
def taxableAfterBasicDeduction (income deduction : Money) : Money :=
  income - deduction

-- --- positivity ---

theorem basicDeductionLe2350_pos : 0 < basicDeductionLe2350 := by decide
theorem basicDeductionLe2400_pos : 0 < basicDeductionLe2400 := by decide
theorem basicDeductionLe2450_pos : 0 < basicDeductionLe2450 := by decide
theorem basicDeductionLe2500_pos : 0 < basicDeductionLe2500 := by decide

-- --- 区分定数の大小（原文の金額どおり） ---

theorem basicDeduction_strictlyDecreasing :
    basicDeductionLe2350 > basicDeductionLe2400 ∧
    basicDeductionLe2400 > basicDeductionLe2450 ∧
    basicDeductionLe2450 > basicDeductionLe2500 := by decide

-- --- 境界区分の characterization（caller-established な totalIncome に対する分岐） ---

theorem basicDeductionAmount_of_le2350 (h : totalIncome ≤ 23_500_000) :
    basicDeductionAmount totalIncome = 580_000 := by
  simp [basicDeductionAmount, basicDeductionLe2350, h]

theorem basicDeductionAmount_of_gt2500 (h : 25_000_000 < totalIncome) :
    basicDeductionAmount totalIncome = 0 := by
  have h23 : 23_500_000 < totalIncome := Nat.lt_trans (by decide) h
  have h24a : 24_000_000 < totalIncome := Nat.lt_trans (by decide) h
  have h24b : 24_500_000 < totalIncome := Nat.lt_trans (by decide) h
  simp [basicDeductionAmount, Nat.not_le_of_gt h, Nat.not_le_of_gt h23,
    Nat.not_le_of_gt h24a, Nat.not_le_of_gt h24b]

-- --- saturating 減算の2分岐を明示（axiom-free 自前証明） ---

/-- `a ≤ b → a - b = 0` の axiom-free 証明。core の `Nat.sub_eq_zero_of_le` は
    `propext` に依存するため、`Nat.zero_sub` / `Nat.succ_sub_succ` を用いた
    帰納法で自前で示す。 -/
private theorem natSubEqZeroOfLeFree {a b : Nat} (h : a ≤ b) : a - b = 0 := by
  induction b generalizing a with
  | zero =>
      cases a with
      | zero => rfl
      | succ a => exact (Nat.not_succ_le_zero a h).elim
  | succ b ih =>
      cases a with
      | zero => exact Nat.zero_sub (Nat.succ b)
      | succ a =>
          rw [Nat.succ_sub_succ]
          exact ih (Nat.succ_le_succ_iff.mp h)

theorem taxableAfterBasicDeduction_of_lt (income deduction : Money)
    (h : income < deduction) :
    taxableAfterBasicDeduction income deduction = 0 := by
  unfold taxableAfterBasicDeduction
  exact natSubEqZeroOfLeFree (Nat.le_of_lt h)

theorem taxableAfterBasicDeduction_le_income (income deduction : Money) :
    taxableAfterBasicDeduction income deduction ≤ income := by
  unfold taxableAfterBasicDeduction
  exact Nat.sub_le _ _

-- ==== kernel-decided smoke checks ====

example : basicDeductionLe2350 = 580_000 := by decide  -- 五十八万円
example : basicDeductionLe2400 = 480_000 := by decide  -- 四十八万円
example : basicDeductionLe2450 = 320_000 := by decide  -- 三十二万円
example : basicDeductionLe2500 = 160_000 := by decide  -- 十六万円

example : basicDeductionAmount 0 = 580_000 := by decide
example : basicDeductionAmount 23_500_000 = 580_000 := by decide
example : basicDeductionAmount 23_500_001 = 480_000 := by decide
example : basicDeductionAmount 25_000_001 = 0 := by decide

example : taxableAfterBasicDeduction 1_000_000 580_000 = 420_000 := by decide
example : taxableAfterBasicDeduction 580_000 580_000 = 0 := by decide
example : taxableAfterBasicDeduction 100_000 580_000 = 0 := by decide

end JapanTaxLaw.IncomeBasicDeduction
