import JapanTaxLaw.TaxFinance

/-!
# BlueBusinessDeductAmount — 所得税法 art.3「青色事業専従者」控除額の年齢分岐

Sources (pinned): law `340AC0000000033`, revision `340AC0000000033_20261001_507AC0000000070`,
raw `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`.
原文逐語: 「二十二万五千円（当該青色事業専従者の年齢が二十歳未満である場合には、
二十一万七千五百円）」
Computation（金額の選択のみ。入力は年齢が20未満かどうか）:
  amount(under20) = if under20 then 217_500 else 225_000
Scope: 専従者要件・所得計算は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.BlueBusinessDeductAmount

def standardYen : Nat := 225_000
def under20Yen : Nat := 217_500

def amount (under20 : Bool) : Nat :=
  if under20 then under20Yen else standardYen

example : amount false = 225_000 := by decide
example : amount true = 217_500 := by decide

end JapanTaxLaw.BlueBusinessDeductAmount
