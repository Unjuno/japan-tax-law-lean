import JapanTaxLaw.TaxFinance

/-!
# RiceContentThreshold — 米含有量 30% 超（関税暫定措置法施行規則 art.7 §1）bounded L4 モデル

Sources (pinned):
  Law id: 344M50000040039
  Revision: 344M50000040039_20241215_505M60000040057
  Raw snapshot: data/raw/344M50000040039_20241215_505M60000040057.law.json
  Article Num 7, flat/normalized leaf text 1393 chars. Needles contain no U+3000.

原文逐語:
  「米の含有量が全重量の三〇％を超えるもの」

Computation（原文逐語から導出、数値閾値のみ）:
  三〇％ = 30% = 30/100
  exceedsRiceThreshold(rice, total) = rice*100 > total*30（厳密超え）

Scope / NOT MODELLED:
  - 関税率表の品目区分・他の含有量基準・重量認定方法は NOT MODELLED。
  - 本スライスは米含有量の数値閾値のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RiceContentThreshold

open JapanTaxLaw.TaxFinance

/-- 米含有量が全重量の 30% を厳密に超えるか。 -/
def exceedsRiceThreshold (rice : Nat) (total : Nat) : Bool := rice * 100 > total * 30

example : exceedsRiceThreshold 30 100 = false := by decide -- ちょうど30%は対象外
example : exceedsRiceThreshold 31 100 = true := by decide
example : exceedsRiceThreshold 29 100 = false := by decide
example : exceedsRiceThreshold 60 200 = false := by decide -- 30%ちょうど
example : exceedsRiceThreshold 61 200 = true := by decide

end JapanTaxLaw.RiceContentThreshold
