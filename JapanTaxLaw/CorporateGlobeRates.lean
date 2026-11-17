import JapanTaxLaw.TaxFinance

/-!
# CorporateGlobeRates — 法人税法 art. 82の13 / art. 82の21 / art. 145の8 GloBE 関連税率計算 (L4)

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340AC0000000034_20261001_508AC0000000012.law.json

Models three bounded 税率計算 of the 法人税法 (GloBE / 国際最低課税関連):

* 第八十二条の十三（国際最低課税残余額に対する法人税の税率）
  「内国法人に対して課する各対象会計年度の国際最低課税残余額に対する法人税の額は、
    各対象会計年度の内国法人に係る課税標準国際最低課税残余額に百分の九十・七の
    税率を乗じて計算した金額とする。」
  → tax = 課税標準国際最低課税残余額 × 907/1000（百分の九十・七 = 90.7%）。

* 第八十二条の二十一（国内最低課税額に対する法人税の税率）
  「内国法人に対して課する各対象会計年度の国内最低課税額に対する法人税の額は、
    各対象会計年度の内国法人に係る課税標準国内最低課税額に百分の七十五・三の
    税率を乗じて計算した金額とする。」
  → tax = 課税標準国内最低課税額 × 753/1000（百分の七十五・三 = 75.3%）。

* 第百四十五条の八（外国法人に係る国内最低課税額に対する法人税の税率）
  「外国法人に対して課する各対象会計年度の国内最低課税額に対する法人税の額は、
    各対象会計年度の外国法人に係る課税標準国内最低課税額に百分の七十五・三の
    税率を乗じて計算した金額とする。」
  → tax = 外国法人 課税標準国内最低課税額 × 753/1000（百分の七十五・三 = 75.3%）。

Scope & honest boundaries (overclaim 防止):

* 課税標準額（課税標準国際最低課税残余額 / 課税標準国内最低課税額）は
  **caller-established** とする。本モデルは「その額がどう算定されるか」を一切都合せず、
  与えられた金額に税率を乗じる算術のみを扱う。
* 内国法人 / 外国法人の別、対象会計年度の確定、国際最低課税残余額・国内最低課税額の
  算定（GloBE ルールそのもの）等の適用判定も **caller-established** とし、
  **Bool は式に入れない**。単純化のためこれらは 3 つの独立関数とする
  （art. 82の21 と art. 145の8 は税率算式が同一 753/1000 だが、納税者の別は
  doc-comment の範疇で区別する）。
* 端数処理は TaxRate.applyFloor（切り捨て）に委ねる。原文は「乗じて計算した金額」とし
  端数規定をこの条に持たないため、丸め規則の詳細は per-law business data として
  ここでは floor を採用したことを明示する。
* GloBE ルールによる国際最低課税額・国内最低課税額そのものの算定、他の法人税特例税率、
  申告・納付手続、および art. 82の5（国際最低課税額 90.7%）は **射程外**
  （後者は CorporateMiscRates.lean 側でモデル化済み）。

Pinned evidence in doc-comments only; all theorems here claim properties of
the model only, never of the real legal semantics (誠実性の原則 —
Pin ↔ 原文一致 is the trust boundary; interpretation is not guaranteed).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百分の九十・七 — art. 82の13 (90.7% = 907/1000). -/
def globeResidualRate : TaxRate := ⟨907, 1000, by decide⟩

/-- 百分の七十五・三 — art. 82の21 / art. 145の8 (75.3% = 753/1000). -/
def globeDomesticRate : TaxRate := ⟨753, 1000, by decide⟩

-- ==== positivity of the rate denominators (well-definedness) ====

theorem globeResidualRate_den_pos : 0 < globeResidualRate.den := by decide

theorem globeDomesticRate_den_pos : 0 < globeDomesticRate.den := by decide

-- ==== the three bounded tax computations ====

/-- 第八十二条の十三: 国際最低課税残余額に対する法人税額 =
    課税標準国際最低課税残余額 × 907/1000。課税標準額 `base` は caller-established。 -/
def internationalMinimumResidualTax (base : Money) : Money :=
  globeResidualRate.applyFloor base

/-- 第八十二条の二十一: 国内最低課税額に対する法人税額 =
    課税標準国内最低課税額 × 753/1000。課税標準額 `base` は caller-established。 -/
def domesticMinimumTax (base : Money) : Money :=
  globeDomesticRate.applyFloor base

/-- 第百四十五条の八: 外国法人の国内最低課税額に対する法人税額 =
    課税標準国内最低課税額 × 753/1000。課税標準額 `base` は caller-established。 -/
def foreignDomesticMinimumTax (base : Money) : Money :=
  globeDomesticRate.applyFloor base

-- ==== model properties (no performance of the law is claimed) ====

/-- art. 82の13: the computed amount is monotone in the caller-established base. -/
theorem internationalMinimumResidualTax_mono {a b : Money} (h : a ≤ b) :
    internationalMinimumResidualTax a ≤ internationalMinimumResidualTax b := by
  simp [internationalMinimumResidualTax, globeResidualRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 907 h)

/-- art. 82の21: the computed amount is monotone in the caller-established base. -/
theorem domesticMinimumTax_mono {a b : Money} (h : a ≤ b) :
    domesticMinimumTax a ≤ domesticMinimumTax b := by
  simp [domesticMinimumTax, globeDomesticRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 753 h)

/-- art. 145の8: the computed amount is monotone in the caller-established base. -/
theorem foreignDomesticMinimumTax_mono {a b : Money} (h : a ≤ b) :
    foreignDomesticMinimumTax a ≤ foreignDomesticMinimumTax b := by
  simp [foreignDomesticMinimumTax, globeDomesticRate, TaxRate.applyFloor]
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 753 h)

-- ==== positivity smoke: a positive multiple of the denominator gives a positive tax ====

theorem internationalMinimumResidualTax_pos (n : Nat) (h : 0 < n) :
    0 < internationalMinimumResidualTax (n * 1000) := by
  simp [internationalMinimumResidualTax, globeResidualRate, TaxRate.applyFloor]
  have h1 : 1 ≤ n := Nat.succ_le_of_lt h
  have h1000 : 1000 ≤ n * 1000 := by
    simpa using (Nat.mul_le_mul_right 1000 h1)
  exact Nat.le_trans h1000 (Nat.le_mul_of_pos_right (n * 1000) (by decide : 0 < 907))

theorem domesticMinimumTax_pos (n : Nat) (h : 0 < n) :
    0 < domesticMinimumTax (n * 1000) := by
  simp [domesticMinimumTax, globeDomesticRate, TaxRate.applyFloor]
  have h1 : 1 ≤ n := Nat.succ_le_of_lt h
  have h1000 : 1000 ≤ n * 1000 := by
    simpa using (Nat.mul_le_mul_right 1000 h1)
  exact Nat.le_trans h1000 (Nat.le_mul_of_pos_right (n * 1000) (by decide : 0 < 753))

theorem foreignDomesticMinimumTax_pos (n : Nat) (h : 0 < n) :
    0 < foreignDomesticMinimumTax (n * 1000) := by
  simp [foreignDomesticMinimumTax, globeDomesticRate, TaxRate.applyFloor]
  have h1 : 1 ≤ n := Nat.succ_le_of_lt h
  have h1000 : 1000 ≤ n * 1000 := by
    simpa using (Nat.mul_le_mul_right 1000 h1)
  exact Nat.le_trans h1000 (Nat.le_mul_of_pos_right (n * 1000) (by decide : 0 < 753))

-- ==== kernel-decided smoke checks ====

example : internationalMinimumResidualTax 0 = 0 := by decide
example : internationalMinimumResidualTax 1 = 0 := by decide
example : internationalMinimumResidualTax 999 = 906 := by decide
example : internationalMinimumResidualTax 1000 = 907 := by decide
example : internationalMinimumResidualTax 100_000 = 90_700 := by decide
example : internationalMinimumResidualTax 1_000_000 = 907_000 := by decide

example : domesticMinimumTax 0 = 0 := by decide
example : domesticMinimumTax 1 = 0 := by decide
example : domesticMinimumTax 999 = 752 := by decide
example : domesticMinimumTax 1000 = 753 := by decide
example : domesticMinimumTax 100_000 = 75_300 := by decide
example : domesticMinimumTax 1_000_000 = 753_000 := by decide

example : foreignDomesticMinimumTax 0 = 0 := by decide
example : foreignDomesticMinimumTax 1 = 0 := by decide
example : foreignDomesticMinimumTax 999 = 752 := by decide
example : foreignDomesticMinimumTax 1000 = 753 := by decide
example : foreignDomesticMinimumTax 100_000 = 75_300 := by decide
example : foreignDomesticMinimumTax 1_000_000 = 753_000 := by decide

end JapanTaxLaw
