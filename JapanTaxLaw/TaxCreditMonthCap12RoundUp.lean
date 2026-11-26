import JapanTaxLaw.TaxFinance

/-!
# TaxCreditMonthCap12RoundUp — 租税特別措置法 art. 8_5（月数 十二月超は十二月・一月未満端数は一月）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「第一項第一号の月数は、暦に従つて計算し、十二月を超えるときは十二月とし、一月に満たない端数を生じたときはこれを一月とする。」

Scoped claim: only the 月数 十二月超は十二月・一月未満端数は一月 numeric condition; other conditions are caller-established.
-/

namespace JapanTaxLaw.TaxCreditMonthCap12RoundUp

def monthFloor : Nat := 1
def monthCeiling : Nat := 12

def cappedMonths (x : Nat) : Nat :=
  if x < monthFloor then monthFloor else if monthCeiling < x then monthCeiling else x

theorem constants : monthFloor = 1 ∧ monthCeiling = 12 := by
  constructor <;> rfl

end JapanTaxLaw.TaxCreditMonthCap12RoundUp
