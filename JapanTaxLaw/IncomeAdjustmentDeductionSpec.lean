import JapanTaxLaw.IncomeAdjustmentDeduction

/-!
# IncomeAdjustmentDeduction spec — 租税特別措置法 art. 41の3の11 の独立整数定式

Sources (pinned; identical to IncomeAdjustmentDeduction.lean):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

This file restates the statutory arithmetic independently in plain `Nat`, without
referencing any implementation constant: the thresholds are bare literals read from
原文 八百五十万円 / 千万円 / 百分の十 / 十万円 (8_500_000 / 10_000_000 / 10 / 100 /
100_000). The implementation writes `(min salary cap - threshold) * 10 / 100`; the
spec writes an explicit branch on `salary ≤ threshold` / `salary < cap` with the
mathematically equivalent `(salary - threshold) / 10`, and caps at exactly 150_000
otherwise. For 第2項 the implementation uses `min` + saturating subtraction; the
spec spells both caps out as `if` branches and the saturation as an explicit `if`.

`agreeIncomeAdjustmentDeduction1` / `agreeIncomeAdjustmentDeduction2` check that the
implementation and these independent restatements coincide on a finite grid
(kernel `decide`); they are NOT universal claims.

Scope boundaries are identical to the implementation. In particular the eligibility
facts (居住者・特別障害者／23歳未満扶養親族等・適用条項の選択) are caller-established
and are never used to derive an amount inside this model. 第3項の判定基準日は
NOT MODELLED（日付・現況による法的判断であり金額式ではない）。
-/

namespace JapanTaxLaw.IncomeAdjustmentDeduction

-- ==== art. 41の3の11: 独立定式（impl の定数を参照しない） ====

/-- art. 41の3の11(1): 給与収入 ≤ 8_500_000 → 0 /
    8_500_000 < 給与収入 < 10_000_000 → (給与収入 − 8_500_000) / 10 /
    10_000_000 ≤ 給与収入 → 150_000（原文の千万円 cap）。 -/
def specIncomeAdjustmentDeduction1 (salary : Nat) : Nat :=
  if salary ≤ 8_500_000 then 0
  else if salary < 10_000_000 then (salary - 8_500_000) / 10
  else 150_000

/-- art. 41の3の11(2): 各金額を十万で cap し、合計から十万を控除（saturating）。
    `min` を if で、アンダーフローを明示の if で書き下した独立定式。 -/
def specIncomeAdjustmentDeduction2 (salaryAfter pensionOther : Nat) : Nat :=
  let salaryCapped := if salaryAfter ≤ 100_000 then salaryAfter else 100_000
  let pensionCapped := if pensionOther ≤ 100_000 then pensionOther else 100_000
  if salaryCapped + pensionCapped ≤ 100_000 then 0
  else salaryCapped + pensionCapped - 100_000

-- ==== points（独立定式のスモーク、全境界値） ====

example : specIncomeAdjustmentDeduction1 0 = 0 := by decide
example : specIncomeAdjustmentDeduction1 8_500_000 = 0 := by decide
example : specIncomeAdjustmentDeduction1 8_500_001 = 0 := by decide
example : specIncomeAdjustmentDeduction1 8_500_010 = 1 := by decide
example : specIncomeAdjustmentDeduction1 9_999_999 = 149_999 := by decide
example : specIncomeAdjustmentDeduction1 10_000_000 = 150_000 := by decide
example : specIncomeAdjustmentDeduction1 99_999_999 = 150_000 := by decide

example : specIncomeAdjustmentDeduction2 0 0 = 0 := by decide
example : specIncomeAdjustmentDeduction2 100_000 100_000 = 100_000 := by decide
example : specIncomeAdjustmentDeduction2 50_000 50_000 = 0 := by decide
example : specIncomeAdjustmentDeduction2 50_000 200_000 = 50_000 := by decide
example : specIncomeAdjustmentDeduction2 200_000 200_000 = 100_000 := by decide
example : specIncomeAdjustmentDeduction2 99_999 2 = 1 := by decide

-- ==== agreement（impl ↔ spec、有限点のみ；全称主張ではない） ====

/-- 実装と独立定式が有限グリッド上で一致するか（列挙された点のみ；全称主張ではない）。
    850万円ちょうど／超、1000万円超、端数（8_500_009 / 8_500_010 / 8_500_011）を含む。 -/
def agreeIncomeAdjustmentDeduction1 : Bool :=
  let salaries := [0, 1, 8_499_999, 8_500_000, 8_500_001, 8_500_009,
    8_500_010, 8_500_011, 9_999_999, 10_000_000, 10_000_001, 15_000_000, 99_999_999]
  salaries.all fun s =>
    incomeAdjustmentDeduction1 s == specIncomeAdjustmentDeduction1 s

example : agreeIncomeAdjustmentDeduction1 = true := by decide

/-- 実装と独立定式が有限グリッド上で一致するか（列挙された点のみ；全称主張ではない）。
    十万境界・合計が十万ちょうど／超・端数を含む。 -/
def agreeIncomeAdjustmentDeduction2 : Bool :=
  let vals := [0, 1, 2, 50_000, 99_999, 100_000, 100_001, 200_000, 1_000_000]
  vals.all fun s =>
    vals.all fun p =>
      incomeAdjustmentDeduction2 s p == specIncomeAdjustmentDeduction2 s p

example : agreeIncomeAdjustmentDeduction2 = true := by decide

end JapanTaxLaw.IncomeAdjustmentDeduction
