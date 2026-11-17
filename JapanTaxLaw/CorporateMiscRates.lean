import JapanTaxLaw.TaxFinance

/-!
# CorporateMiscRates — 法人税法 art. 87 / art. 82の5 / art. 145の12 税率計算 (L4)

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340AC0000000034_20261001_508AC0000000012.law.json

Models three bounded 税率計算 of the 法人税法:

* 第八十七条（退職年金等積立金に対する法人税の税率）
  「内国法人に対して課する退職年金等積立金に対する法人税の額は、
    各事業年度の退職年金等積立金の額に百分の一の税率を乗じて計算した金額とする。」
  → tax = 退職年金等積立金の額 × 1/100。

* 第八十二条の五（国際最低課税額に対する法人税の税率）
  「内国法人に対して課する各対象会計年度の国際最低課税額に対する法人税の額は、
    各対象会計年度の課税標準国際最低課税額に百分の九十・七の税率を乗じて
    計算した金額とする。」
  → tax = 課税標準国際最低課税額 × 907/1000（百分の九十・七 = 90.7%）。

* 第百四十五条の十二（外国法人に係る退職年金等積立金に対する法人税の税率）
  「外国法人に対して課する退職年金等積立金に対する法人税の額は、
    各事業年度の退職年金等積立金の額に百分の一の税率を乗じて計算した金額とする。」
  → tax = 外国法人退職年金積立金 × 1/100。

Scope & honest boundaries (overclaim 防止):

* 課税標準額（各事業年度の退職年金等積立金の額 / 各対象会計年度の
  課税標準国際最低課税額）は **caller-established** とする。本モデルは
  「その額がどう算定されるか」を一切都合せず、与えられた金額に税率を乗じる
  算術のみを扱う。
* 内国法人 / 外国法人の別、対象会計年度・事業年度の確定、積立金の存在判定
  等の適用判定も **caller-established** とし、**Bool は式に入れない**。
  単純化のため these three are three separate functions（art. 87 と art. 145の12 は
  税率算式が同一 1/100 だが、納税者の別は doc-comment の範疇で区別する）。
* 端数処理は TaxRate.applyFloor（切り捨て）に委ねる。原文は「乗じて計算した
  金額」とし端数規定をこの条に持たないため、丸め規則の詳細は per-law
  business data としてここでは floor を採用したことを明示する。
* art. 82の5 の国際最低課税額そのものの算定（GloBE ルール）、他の法人税
  特例税率、および申告・納付手続は **射程外**。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics (誠実性の原則 —
Pin ↔ 原文一致 is the trust boundary; interpretation is not guaranteed).
-/ 

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百分の一 — art. 87 / art. 145の12 (1%). -/
def pensionReserveRate : TaxRate := ⟨1, 100, by decide⟩

/-- 百分の九十・七 — art. 82の5 (90.7% = 907/1000). -/
def internationalMinimumTaxRate : TaxRate := ⟨907, 1000, by decide⟩

-- ==== positivity of the rate denominators (well-definedness) ====

theorem pensionReserveRate_den_pos : 0 < pensionReserveRate.den := by decide

theorem internationalMinimumTaxRate_den_pos : 0 < internationalMinimumTaxRate.den := by decide

-- ==== the three bounded tax computations ====

/-- 第八十七条: 退職年金等積立金に対する法人税額 = 積立金の額 × 1/100.
    課税標準額 `reserve` は caller-established。 -/
def retirementPensionReserveTax (reserve : Money) : Money :=
  pensionReserveRate.applyFloor reserve

/-- 第八十二条の五: 国際最低課税額に対する法人税額 =
    課税標準国際最低課税額 × 907/1000。課税標準額 `base` は caller-established。 -/
def internationalMinimumTax (base : Money) : Money :=
  internationalMinimumTaxRate.applyFloor base

/-- 第百四十五条の十二: 外国法人の退職年金等積立金に対する法人税額 =
    積立金の額 × 1/100。課税標準額 `reserve` は caller-established。 -/
def foreignPensionReserveTax (reserve : Money) : Money :=
  pensionReserveRate.applyFloor reserve

-- ==== model properties (no performance of the law is claimed) ====

/-- art. 87: the computed amount is monotone in the caller-established base. -/
theorem retirementPensionReserveTax_mono {a b : Money} (h : a ≤ b) :
    retirementPensionReserveTax a ≤ retirementPensionReserveTax b := by
  simp [retirementPensionReserveTax, pensionReserveRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right h

/-- art. 82の5: the computed amount is monotone in the caller-established base. -/
theorem internationalMinimumTax_mono {a b : Money} (h : a ≤ b) :
    internationalMinimumTax a ≤ internationalMinimumTax b := by
  simp [internationalMinimumTax, internationalMinimumTaxRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 907 h)

/-- art. 145の12: the computed amount is monotone in the caller-established base. -/
theorem foreignPensionReserveTax_mono {a b : Money} (h : a ≤ b) :
    foreignPensionReserveTax a ≤ foreignPensionReserveTax b := by
  simp [foreignPensionReserveTax, pensionReserveRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right h

-- ==== positivity smoke: a positive multiple of the denominator gives a positive tax ====

theorem retirementPensionReserveTax_pos (n : Nat) (h : 0 < n) :
    0 < retirementPensionReserveTax (n * 100) := by
  simp [retirementPensionReserveTax, pensionReserveRate, TaxRate.applyFloor]
  exact h

theorem internationalMinimumTax_pos (n : Nat) (h : 0 < n) :
    0 < internationalMinimumTax (n * 1000) := by
  simp [internationalMinimumTax, internationalMinimumTaxRate, TaxRate.applyFloor]
  have h1 : 1 ≤ n := Nat.succ_le_of_lt h
  have h1000 : 1000 ≤ n * 1000 := by
    simpa using (Nat.mul_le_mul_right 1000 h1)
  exact Nat.le_trans h1000 (Nat.le_mul_of_pos_right (n * 1000) (by decide : 0 < 907))

theorem foreignPensionReserveTax_pos (n : Nat) (h : 0 < n) :
    0 < foreignPensionReserveTax (n * 100) := by
  simp [foreignPensionReserveTax, pensionReserveRate, TaxRate.applyFloor]
  exact h

-- ==== kernel-decided smoke checks ====

example : retirementPensionReserveTax 0 = 0 := by decide
example : retirementPensionReserveTax 100 = 1 := by decide
example : retirementPensionReserveTax 1000 = 10 := by decide

example : internationalMinimumTax 0 = 0 := by decide
example : internationalMinimumTax 1 = 0 := by decide
example : internationalMinimumTax 1000 = 907 := by decide
example : internationalMinimumTax 100_000 = 90_700 := by decide

example : foreignPensionReserveTax 0 = 0 := by decide
example : foreignPensionReserveTax 100 = 1 := by decide
example : foreignPensionReserveTax 1000 = 10 := by decide

end JapanTaxLaw
