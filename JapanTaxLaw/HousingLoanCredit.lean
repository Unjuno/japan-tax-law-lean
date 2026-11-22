import JapanTaxLaw.TaxFinance

/-!
# HousingLoanCredit — 住宅借入金等特別税額控除額の特例（租税特別措置法 art.16 §1）bounded L4 モデル

Sources (pinned):
  Law id: 407AC0000000011
  Revision: 407AC0000000011_20200401_502AC0000000008
  Raw snapshot: data/raw/407AC0000000011_20200401_502AC0000000008.law.json
  Article Num 16 §1, flat/normalized leaf text 3832 chars, U+3000 count 0.

原文逐語（§1 各号）:
  一 再建住宅借入金等の合計額が千万円以下 → 合計額の二パーセント
  二 千万円超二千万円以下 → 千万円を超える金額の一パーセント + 二十万円
  三 二千万円超 → 二千万円を超える金額（上限千万円）の〇・五パーセント + 三十万円
  端数: 百円未満の端数を切り捨てる。

Computation（原文逐語から導出、千分率で厳密表現 + 百円切捨て）:
  band1 (b <= 10,000,000): b * 20 / 1000        -- 2%
  band2 (10M < b <= 20M): (b-10M)*10/1000 + 200000   -- 1% + 200,000
  band3 (b > 20M): min(b-20M, 10M)*5/1000 + 300000   -- 0.5% + 300,000
  round100(x) = x / 100 * 100

Scope / NOT MODELLED:
  - 阪神・淡路大震災の被害認定・居住年の要件・選択手続は NOT MODELLED。
  - §2（二以上の居住年）・§3 は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.HousingLoanCredit

open JapanTaxLaw.TaxFinance

/-- 百円未満を切り捨て。 -/
def round100 (x : Money) : Money := x / 100 * 100

/-- 再建住宅借入金等の合計額に対する特別税額控除額。 -/
def creditYen (balance : Money) : Money :=
  let raw :=
    if balance <= 10_000_000 then balance * 20 / 1000
    else if balance <= 20_000_000 then (balance - 10_000_000) * 10 / 1000 + 200_000
    else (if balance - 20_000_000 <= 10_000_000 then balance - 20_000_000 else 10_000_000) * 5 / 1000 + 300_000
  round100 raw

example : creditYen 10_000_000 = 200_000 := by decide
example : creditYen 5_000_000 = 100_000 := by decide
example : creditYen 20_000_000 = 300_000 := by decide
example : creditYen 15_000_000 = 250_000 := by decide
example : creditYen 30_000_000 = 350_000 := by decide

end JapanTaxLaw.HousingLoanCredit
