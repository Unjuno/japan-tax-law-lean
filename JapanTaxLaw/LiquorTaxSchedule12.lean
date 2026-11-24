import JapanTaxLaw.TaxFinance

/-!
# LiquorTaxSchedule12 — 酒税法 art. 23（酒税額 十二万円＋十二度超一度ごとに一万円加算）

Sources (pinned):

  Law id: 328AC0000000006
  Revision: 328AC0000000006_20260525_506AC0000000052
  Raw snapshot: data/raw/328AC0000000006_20260525_506AC0000000052.law.json

Pinned 原文: 「十二万円（アルコール分が十三度以上のものにあつては、十二万円にアルコール分が十二度を超える一度ごとに一万円を加えた金額）」

Scoped claim: only the linear schedule: base amount + increment for each unit
above the statutory threshold. `x : Nat` is 酒税額 十二万円＋十二度超一度ごとに一万円加算. Domain Nat; unit 円.
-/

namespace JapanTaxLaw.LiquorTaxSchedule12

def baseAmount : Nat := 120000
def perUnit : Nat := 10000
def threshold : Nat := 12

def amount (x : Nat) : Nat :=
  baseAmount + perUnit * (x - threshold)

theorem constants : baseAmount = 120000 ∧ perUnit = 10000 ∧ threshold = 12 := by
  constructor
  · rfl
  constructor <;> rfl

end JapanTaxLaw.LiquorTaxSchedule12
