import JapanTaxLaw.TaxFinance

/-!
# StampExchangeFee — 印紙税法施行規則 art.9（交換手数料）bounded L4 モデル

Sources (pinned):
  Law id: 415M60000008069
  Revision: 415M60000008069_20191001_501M60000008047
  Raw snapshot: data/raw/data/raw/415M60000008069_20191001_501M60000008047.law.json
  Article Num 9, flat/normalized leaf text 179 chars, U+3000 count 0.

原文逐語:
  「印紙の交換手数料の額は、交換の請求に係るもの一枚につき五円とする。ただし、
   交換の請求に係る印紙に表された金額が十円に満たないものである場合には、
   印紙に表された金額（請求に係るものが二枚以上のときは、その合計額）の半額
   （その額に一円未満の端数があるときは、その端数を切り捨てた額）とする。」

Computation（原文逐語から導出、数値スライスのみ）:
  perSheetYen = 5（一枚につき五円）
  smallAmountThreshold = 10（十円に満たない = amount < 10）
  halfFloor(amount) = amount / 2（一円未満切捨て = 自然数除算）
  exchangeFee(n, totalAmount):
    if amount < 10 then halfFloor(totalAmount) else 5 * n

Scope / NOT MODELLED:
  - 印紙の交換請求の具体認定、二枚以上の合計額の算定手続は NOT MODELLED。
  - 「半額」の一円未満切捨ては自然数除算として表現（法的解釈は未確定）。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.StampExchangeFee

open JapanTaxLaw.TaxFinance

/-- 一枚あたりの交換手数料 = 五円。 -/
def perSheetYen : Money := 5
/-- 少額区分の閾値 = 十円に満たない。 -/
def smallThresholdYen : Money := 10

/-- 少額印紙の半額（一円未満切捨て）。 -/
def halfFloor (amount : Money) : Money := amount / 2

/-- 交換手数料。amount<10 なら半額、それ以外は 5×枚数。 -/
def exchangeFee (sheets : Nat) (amount : Money) : Money :=
  if amount < smallThresholdYen then halfFloor amount else perSheetYen * sheets

example : perSheetYen = 5 := by decide
example : smallThresholdYen = 10 := by decide
example : halfFloor 9 = 4 := by decide
example : exchangeFee 1 9 = 4 := by decide
example : exchangeFee 1 10 = 5 := by decide
example : exchangeFee 3 10 = 15 := by decide

end JapanTaxLaw.StampExchangeFee
