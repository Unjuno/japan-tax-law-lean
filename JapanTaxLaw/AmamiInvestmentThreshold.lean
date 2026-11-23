import JapanTaxLaw.TaxFinance

/-!
# AmamiInvestmentThreshold — 奄美群島 不均一課税の投資額基準（措置省令 art.1）bounded L4 モデル

Sources (pinned):
  Law id: 411M50000008014
  Revision: 411M50000008014_20240401_506M60000008035
  Raw snapshot: data/raw/411M50000008014_20240401_506M60000008035.law.json
  Article Num 1 （１）, flat/normalized leaf text 1549 chars. Needles contain no U+3000.

原文逐語（第1号 （１） の金額基準）:
  「五百万円（租税特別措置法施行令…資本金の額等が五千万円超一億円以下である法人にあっては
   千万円とし、資本金の額等が一億円超である法人にあっては二千万円とする。）以上のもの」

Computation（原文逐語から導出、資本金別の閾値のみ、単位: 万円）:
  investmentThreshold(capitalManYen) =
    if capitalManYen > 10000 then 2000       （資本金1億超 → 2千万）
    else if capitalManYen > 5000 then 1000   （資本金5千万超1億以下 → 1千万）
    else 500                                  （それ以外 → 5百万）

Scope / NOT MODELLED:
  - 法第三十八条の事業区分（第一号イ/ホ等）・（２）以降の事業区分は NOT MODELLED。
  - 投資額の算定方法・課税免除・不均一課税の適用効果は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.AmamiInvestmentThreshold

open JapanTaxLaw.TaxFinance

/-- 資本金（万円）別の投資額基準（万円）。 -/
def investmentThreshold (capitalManYen : Nat) : Nat :=
  if capitalManYen > 10000 then 2000
  else if capitalManYen > 5000 then 1000
  else 500

example : investmentThreshold 5000 = 500 := by decide  -- 5千万ちょうど→5百万
example : investmentThreshold 5001 = 1000 := by decide -- 5千万超→1千万
example : investmentThreshold 10000 = 1000 := by decide -- 1億ちょうど→1千万
example : investmentThreshold 10001 = 2000 := by decide -- 1億超→2千万

end JapanTaxLaw.AmamiInvestmentThreshold
