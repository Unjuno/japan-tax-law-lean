import JapanTaxLaw.TaxFinance

/-!
# ShareRatioOverHalf — 持分の割合 50% 超（租税条約実施特例法 art.16の12 §6）bounded L4 モデル

Sources (pinned):
  Law id: 344M50000048001
  Revision: 344M50000048001_20260601_508M60000048004
  Raw snapshot: data/raw/344M50000048001_20260601_508M60000048004.law.json
  Article Num 16_12 §6, flat/normalized leaf text 7905 chars. Needles contain no U+3000.

原文逐語:
  「当該他の組合の組合財産に対する持分の割合が百分の五十を超える場合における当該持分」

Computation（原文逐語から導出、数値閾値のみ）:
  百分の五十 = 50% = 50/100
  exceedsHalf(share, total) = share*100 > total*50（厳密超え、50% ちょうどは対象外）

Scope / NOT MODELLED:
  - 「組合財産」「持分」の定義・他の号（株式・受益権）の閾値は NOT MODELLED。
  - 当該持分の具体的な算定・適用場面は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ShareRatioOverHalf

open JapanTaxLaw.TaxFinance

/-- 持分の割合が 50% を厳密に超えるか。 -/
def exceedsHalf (share : Nat) (total : Nat) : Bool := share * 100 > total * 50

example : exceedsHalf 50 100 = false := by decide -- ちょうど50%は対象外
example : exceedsHalf 51 100 = true := by decide
example : exceedsHalf 49 100 = false := by decide
example : exceedsHalf 100 200 = false := by decide -- 50%ちょうど
example : exceedsHalf 101 200 = true := by decide

end JapanTaxLaw.ShareRatioOverHalf
