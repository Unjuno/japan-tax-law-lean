import JapanTaxLaw.TaxFinance

/-!
# DisabilityDeductionTiers — 地方税法 art.37（障害者一人につき1万円／特別障害者10万円）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「（ｉ）　（ｉｉ）に掲げる場合以外の場合　当該障害者一人につき一万円」／
      「（ｉｉ）　当該障害者が特別障害者である場合　当該特別障害者一人につき十万円」
Computation: 特別障害者なら 100,000 円、それ以外は 10,000 円（一人あたり）。
Scope: 障害者・特別障害者の認定と人数の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.DisabilityDeductionTiers

def standardPerPerson : Nat := 10_000
def specialPerPerson : Nat := 100_000

def perPerson (isSpecial : Bool) : Nat :=
  if isSpecial then specialPerPerson else standardPerPerson

def total (isSpecial : Bool) (persons : Nat) : Nat :=
  perPerson isSpecial * persons

example : perPerson false = 10_000 := by decide
example : perPerson true = 100_000 := by decide
example : total false 2 = 20_000 := by decide
example : total true 2 = 200_000 := by decide

end JapanTaxLaw.DisabilityDeductionTiers
