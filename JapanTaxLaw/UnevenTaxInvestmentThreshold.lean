import JapanTaxLaw.TaxFinance

/-!
# UnevenTaxInvestmentThreshold — 不均一課税の適用設備投資額基準（半島振興法措置省令 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 407M50000008016
  Revision: 407M50000008016_20250401_507M60000008028
  Raw snapshot: data/raw/407M50000008016_20250401_507M60000008028.law.json
  Article Num 1 一, flat/normalized leaf text 1429 chars. Needles contain no U+3000.

原文逐語（第1号 イ の金額基準）:
  「五百万円（租税特別措置法施行令…第二十八条の九第十項第一号に規定する資本金の額等が
   千万円超五千万円以下である法人にあっては千万円とし、資本金の額等が五千万円超である
   法人にあっては二千万円とする。）以上のもの」

Computation（原文逐語から導出、資本金別の閾値のみ、単位: 万円）:
  investmentThreshold(capitalManYen) =
    if capitalManYen > 5000 then 2000       （資本金5千万超 → 2千万）
    else if capitalManYen > 1000 then 1000  （資本金1千万超5千万以下 → 1千万）
    else 500                                 （それ以外 → 5百万）

Scope / NOT MODELLED:
  - 法第十七条の事業区分（第一号・第五号等）・設備の定義は NOT MODELLED。
  - 投資額の算定方法・不均一課税の適用効果は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.UnevenTaxInvestmentThreshold

open JapanTaxLaw.TaxFinance

/-- 資本金（万円）別の投資額基準（万円）。 -/
def investmentThreshold (capitalManYen : Nat) : Nat :=
  if capitalManYen > 5000 then 2000
  else if capitalManYen > 1000 then 1000
  else 500

example : investmentThreshold 1000 = 500 := by decide  -- 1千万ちょうど→5百万
example : investmentThreshold 1001 = 1000 := by decide -- 1千万超→1千万
example : investmentThreshold 5000 = 1000 := by decide -- 5千万ちょうど→1千万
example : investmentThreshold 5001 = 2000 := by decide -- 5千万超→2千万

end JapanTaxLaw.UnevenTaxInvestmentThreshold
