import JapanTaxLaw.TaxFinance

/-!
# PerPersonDeduction — 8 の 一人当たり加算控除規定

Pinned provisions compute a deduction as a base amount plus a fixed amount per
eligible person: 「一万円に当該控除対象配偶者等一人につき一万円を加算した
金額」. `base`, `count` and `amount` are Nat yen / person count.
Eligibility of each person is caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.PerPersonDeduction

def perPersonDeduction (base count amount : Nat) : Nat := base + count * amount

example : perPersonDeduction 10_000 0 10_000 = 10_000 := by decide
example : perPersonDeduction 10_000 3 10_000 = 40_000 := by decide
example : perPersonDeduction 30_000 2 30_000 = 90_000 := by decide

end JapanTaxLaw.PerPersonDeduction
