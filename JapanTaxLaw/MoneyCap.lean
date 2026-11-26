import JapanTaxLaw.TaxFinance

/-!
# MoneyCap — 9 の 金額上限（〜円を超えるときは〜円とする）規定

Pinned 特別交付税 provisions cap a computed amount: 「額が一〇〇、〇〇〇、
〇〇〇円を超えるときは、一〇〇、〇〇〇、〇〇〇円とする」. The model returns
the smaller of the amount and the statutory cap. Nat yen. The amount
computation is caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.MoneyCap

def capAmount (amount limit : Nat) : Nat := min amount limit

example : capAmount 150_000_000 100_000_000 = 100_000_000 := by decide
example : capAmount 90_000_000 100_000_000 = 90_000_000 := by decide

end JapanTaxLaw.MoneyCap
