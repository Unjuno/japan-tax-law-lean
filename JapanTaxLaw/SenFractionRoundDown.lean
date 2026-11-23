import JapanTaxLaw.TaxFinance

/-!
# SenFractionRoundDown — 一銭未満の端数切り捨て（たばこ税法施行規則 art.4 §2）bounded L4 モデル

Sources (pinned):
  Law id: 360M50000040001
  Revision: 360M50000040001_20240401_506M60000040021
  Raw snapshot: data/raw/360M50000040001_20240401_506M60000040021.law.json
  Article Num 4 §2, flat/normalized leaf text 393 chars. Needles contain no U+3000.

原文逐語（第2項）:
  「前項の計算に関し、同項各号に掲げる金額に一銭未満の端数がある場合には、その端数を切り捨てるものとする。」

Computation（原文逐語から導出、端数処理のみ）:
  1 円 = 100 銭。金額を銭単位で表すと、一銭未満の端数 = 銭の 1 未満の部分。
  円単位の金額 amountYen に対し、一銭未満を切り捨て:
    roundDownToSen(senHundredths) = senHundredths / 10 * 10  （0.1 銭単位入力を 1 銭単位へ切捨て）

Scope / NOT MODELLED:
  - 第1項の金額の計算方法・割合・他所の端数処理は NOT MODELLED。
  - 銭の定義・通貨単位の法的扱いは NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SenFractionRoundDown

open JapanTaxLaw.TaxFinance

/-- 0.1 銭単位の値を 1 銭単位へ切り捨て（一銭未満の端数を捨てる）。 -/
def roundDownToSen (tenthsOfSen : Nat) : Nat := tenthsOfSen / 10 * 10

example : roundDownToSen 0 = 0 := by decide
example : roundDownToSen 9 = 0 := by decide   -- 0.9銭 → 0銭
example : roundDownToSen 10 = 10 := by decide -- 1.0銭 → 1銭
example : roundDownToSen 15 = 10 := by decide -- 1.5銭 → 1銭
example : roundDownToSen 105 = 100 := by decide

end JapanTaxLaw.SenFractionRoundDown
