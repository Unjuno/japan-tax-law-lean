import JapanTaxLaw.TaxFinance

/-!
# RateReading20To10 — 租税特別措置法 art.37の3「百分の二十」を「百分の十」と読み替える
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「第一項各号中「百分の二十」とあるのは、「百分の十」とする。」
Computation: read(rate) = if rate == 20 then 10 else rate（100分率の分子を置換）。
Scope: 他の号・適用条件は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.RateReading20To10

def sourceNum : Nat := 20
def replacementNum : Nat := 10

def readRate (rate : Nat) : Nat :=
  if rate == sourceNum then replacementNum else rate

example : readRate 20 = 10 := by decide
example : readRate 10 = 10 := by decide
example : readRate 25 = 25 := by decide

end JapanTaxLaw.RateReading20To10
