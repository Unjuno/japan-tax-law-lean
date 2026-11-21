import JapanTaxLaw.TaxFinance

/-!
# PowderCoefficientRounding — 粉末酒換算係数の端数計算（規則 art.7の8）bounded L4 モデル

Sources (pinned):
  Law id: 337M50000040026
  Revision: 337M50000040026_20250401_507M60000040034
  Raw snapshot: data/raw/337M50000040026_20250401_507M60000040034.law.json
  Article Num 7_8, flat/normalized leaf text 121 chars, U+3000 count 0.

原文逐語:
  「換算係数の算出は、…計算の過程において生ずる小数点以下第三位未満の端数及び
   当該計算により得られた換算係数の小数点以下第二位未満の端数を切り捨てて行う。」

Computation（原文逐語から導出、二段の端数処理）:
  値を「万分之一 (1/10000)」単位の自然数で表現する。
  - 計算途中: 小数点以下第三位未満（第四位以降）を切り捨て → 千分位 (1/1000) 単位に丸める:
      truncate3(x) = x / 10 * 10   （x は 1/10000 単位、10 単位 = 1/1000）
  - 最終結果: 小数点以下第二位未満（第三位以降）を切り捨て → 百分位 (1/100) 単位に丸める:
      truncate2(x) = x / 100 * 100 （100 単位 = 1/100）

Scope / NOT MODELLED:
  - 「同号に定める算式」そのもの（換算係数の算出式）は NOT MODELLED。
  - 本スライスは二段の端数処理（第三位未満・第二位未満の切捨て）のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PowderCoefficientRounding

open JapanTaxLaw.TaxFinance

/-- 計算途中の端数処理: 1/10000 単位を 1/1000 単位へ切捨て。 -/
def truncate3 (x : Nat) : Nat := x / 10 * 10

/-- 最終結果の端数処理: 1/10000 単位を 1/100 単位へ切捨て。 -/
def truncate2 (x : Nat) : Nat := x / 100 * 100

example : truncate3 12_345 = 12_340 := by decide
example : truncate3 12_349 = 12_340 := by decide
example : truncate2 12_345 = 12_300 := by decide
example : truncate2 12_999 = 12_900 := by decide
example : truncate2 10_000 = 10_000 := by decide

end JapanTaxLaw.PowderCoefficientRounding
