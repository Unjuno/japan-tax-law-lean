import JapanTaxLaw.TaxFinance

/-!
# InsuranceRevenueLevyBase — 収入割の課税標準（個人保険の収入金額、地方税法 art.72の24の2 §2 一）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 72_24_2 §2 一, flat/normalized leaf text 1916 chars. Needles contain no U+3000.

原文逐語（第2項 一号）:
  「個人保険（…貯蓄保険以外のものにあつては、各事業年度の収入保険料…
    に百分の二十四を乗じて得た金額」

Computation（原文逐語から導出、乗算と端数処理、率 24%=24/100）:
  levyBase(incomePremiumYen) = incomePremiumYen * 24 / 100（収入保険料 × 24%、
  1 円未満切捨てを Nat 整数除算で表現）

Scope / NOT MODELLED:
  - 貯蓄保険(7%)・団体保険(16%)・団体年金保険(5%)・電気/ガス供給業は NOT MODELLED。
  - 再保険料の控除・「政令で定める」金額・端数処理の法的根拠は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.InsuranceRevenueLevyBase

open JapanTaxLaw.TaxFinance

/-- 収入割の課税標準 = 収入保険料 × 24%（1円未満切捨て）。 -/
def levyBase (incomePremiumYen : Money) : Money := incomePremiumYen * 24 / 100

example : levyBase 0 = 0 := by decide
example : levyBase 100 = 24 := by decide
example : levyBase 10000 = 2400 := by decide
example : levyBase 1 = 0 := by decide   -- 0.24円 → 0円（切捨て）
example : levyBase 1000000 = 240000 := by decide

end JapanTaxLaw.InsuranceRevenueLevyBase
