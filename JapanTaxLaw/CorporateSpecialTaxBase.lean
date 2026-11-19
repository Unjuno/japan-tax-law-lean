import JapanTaxLaw.TaxFinance

/-!
# CorporateSpecialTaxBase — 法人特別税法 art.9（各課税事業年度の法人特別税の課税標準）bounded L4 モデル

Sources (pinned):
  Law id: 404AC0000000015
  Revision: 404AC0000000015_20010401_413AC0000000006
  Raw snapshot: data/raw/404AC0000000015_20010401_413AC0000000006.law.json
  Article Num 9, flat/normalized leaf text 568 chars, U+3000 count 0.

原文逐語（pinned 本文から一字も変えず抽出）:
  「法人特別税の課税標準は、各課税事業年度の課税標準法人税額とする。」
  「各課税事業年度の課税標準法人税額は、各課税事業年度の基準法人税額から年四百万円を
    控除した残額とする。」
  「課税事業年度が一年に満たない法人...同項中「年四百万円」とあるのは、
    「四百万円を十二で除し、これに当該課税事業年度の月数を乗じて計算した金額」とする。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  annualDeduction = 4,000,000
  fullYear: 課税標準法人税額 = 基準法人税額 − 4,000,000（saturating）
  partialYear(months): 控除額 = (4,000,000 / 12) × months（除算先行・切り捨て）
 課税標準 = 課税標準法人税額

Scope & honest boundaries:
  * 基準法人税額・月数は caller-established。
  * 第4項（最後の課税事業年度の按分）、第5項（月数の暦計算・1月未満切り上げ）、
    第七条第二項各号の区分は NOT MODELLED。
-/

namespace JapanTaxLaw.CorporateSpecialTaxBase

open JapanTaxLaw.TaxFinance

/-- 年控除額 = 四百万円。 -/
def annualDeduction : Money := 4_000_000

/-- 一年分の課税標準法人税額 = 基準法人税額 − 四百万円（saturating）。 -/
def standardTaxBase (base : Money) : Money :=
  if annualDeduction ≤ base then base - annualDeduction else 0

/-- 一年に満たない場合の控除額 = 四百万円÷12×月数（除算先行・切り捨て）。 -/
def partialDeduction (months : Money) : Money :=
  (annualDeduction / 12) * months

/-- 一年に満たない場合の課税標準法人税額。 -/
def partialTaxBase (base months : Money) : Money :=
  let ded := partialDeduction months
  if ded ≤ base then base - ded else 0

-- ==== verified facts (model properties only) ====

example : annualDeduction = 4_000_000 := by decide
/-- 基準 1000万 → 課税標準 600万。 -/
example : standardTaxBase 10_000_000 = 6_000_000 := by decide
/-- 基準 < 400万 → 0（saturating）。 -/
example : standardTaxBase 3_000_000 = 0 := by decide
example : standardTaxBase 4_000_000 = 0 := by decide
/-- 部分期間: 6 ヶ月 → 4,000,000/12*6 = 333333*6 = 1,999,998。 -/
example : partialDeduction 6 = 1_999_998 := by decide
example : partialTaxBase 10_000_000 6 = 8_000_002 := by decide
/-- 月数 12 でも月割りを使うと 3,999,996（厳密な 400万と異なる点を明示）。 -/
example : partialDeduction 12 = 3_999_996 := by decide

theorem standardTaxBase_le (base : Money) : standardTaxBase base ≤ base := by
  unfold standardTaxBase
  by_cases h : annualDeduction ≤ base
  · rw [ite_eq_left h]; exact Nat.sub_le _ _
  · rw [ite_eq_right h]; exact Nat.zero_le _

theorem partialTaxBase_le (base months : Money) : partialTaxBase base months ≤ base := by
  unfold partialTaxBase
  by_cases h : partialDeduction months ≤ base
  · rw [ite_eq_left h]; exact Nat.sub_le _ _
  · rw [ite_eq_right h]; exact Nat.zero_le _

end JapanTaxLaw.CorporateSpecialTaxBase
