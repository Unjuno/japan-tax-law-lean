import JapanTaxLaw.TaxFinance

/-!
# LegalRatePresentValue — 相続税法施行令 art.12の4（法定利率による複利の計算で現価を算出するための割合）bounded L4 モデル

Sources (pinned):
  Law id: 325M50000040017
  Revision: 325M50000040017_20260901_506M60000040016
  Raw snapshot: data/raw/325M50000040017_20260901_506M60000040016.law.json
  Article Num 12_4, flat/normalized leaf text 159 chars, U+3000 count 0.

原文逐語:
  「法定利率に一を加えた数を配偶者居住権の存続年数で累乗して得た数をもつて
    一を除して得た割合（当該割合に小数点以下三位未満の端数があるときは、
    これを四捨五入する。）とする。」

Computation（原文逐語から導出）:
  割合 = 1 / (1 + r)^n（r = 法定利率、n = 存続年数）。
  小数点以下三位未満を四捨五入 → 1000 倍スケールで round half up:
    presentValuePerMille = round(1000 × den^n / (den+num)^n)

Scope: 法定利率 r と存続年数 n は caller-established。 symbiotic に
法23条の2第1項第2号イの存続年数の具体的算定は NOT MODELLED。
-/

namespace JapanTaxLaw.LegalRatePresentValue

open JapanTaxLaw.TaxFinance

/-- 現価割合を「小数点以下 3 位」の整数（per mille）で表す。
    r = num/den（den > 0）、n = 存続年数。 -/
def presentValuePerMille (num den n : Money) : Money :=
  if n = 0 then 1000 else
    let growth := (den + num) ^ n
    if growth = 0 then 0
    else (1000 * den ^ n + growth / 2) / growth

-- 法定利率 0% (num=0) → 割合 1.000 → 1000
example : presentValuePerMille 0 100 0 = 1000 := by decide
example : presentValuePerMille 0 100 5 = 1000 := by decide
-- growth = den+num, ratio = den/(den+num) = 100/110 → round(1000*100/110)=909
example : presentValuePerMille 10 100 1 = 909 := by decide
-- n=2: den^2=10000, growth=110^2=12100, 1000*10000/12100=826
example : presentValuePerMille 10 100 2 = 826 := by decide
-- num=0, n=1 → 1000
example : presentValuePerMille 0 10 1 = 1000 := by decide

theorem presentValuePerMille_zero_years (num den : Money) :
    presentValuePerMille num den 0 = 1000 := by
  unfold presentValuePerMille
  simp

end JapanTaxLaw.LegalRatePresentValue
