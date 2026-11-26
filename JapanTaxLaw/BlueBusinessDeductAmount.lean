import JapanTaxLaw.TaxFinance

/-!
# BlueBusinessDeductAmount — 所得税法 art.3「青色事業専従者」控除額の年齢分岐

Sources (pinned): law `340AC0000000033`, revision `340AC0000000033_20261001_507AC0000000070`,
raw `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`.
原文逐語: 「二十二万五千円（当該青色事業専従者の年齢が二十歳未満である場合には、
二十一万七千五百円）」
Computation（金額と年齢境界の選択のみ。入力は年齢（歳））:
  amount(age) = if age < 20 then 217_500 else 225_000（「未満」なので 20 は通常額）
Scope: 専従者要件・所得計算は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.BlueBusinessDeductAmount

def ageThreshold : Nat := 20
def standardYen : Nat := 225_000
def under20Yen : Nat := 217_500

def amount (age : Nat) : Nat :=
  if age < ageThreshold then under20Yen else standardYen

example : amount 19 = 217_500 := by decide
example : amount 20 = 225_000 := by decide
example : amount 21 = 225_000 := by decide

end JapanTaxLaw.BlueBusinessDeductAmount
