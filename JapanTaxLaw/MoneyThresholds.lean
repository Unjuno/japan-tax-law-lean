import JapanTaxLaw.TaxFinance

/-!
# MoneyThresholds — 50 の 金額閾値（〜円以上／〜円を超える）規定

Pinned eligibility provisions state a monetary threshold, e.g. 「取得価額が
七十万円以上のもの」 or 「費用の額が五十万円を超えること」. The implementation
tests `threshold ≤ amount` (or `threshold < amount`). The threshold value and
the surrounding eligibility logic are caller-established and NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.MoneyThresholds

def atLeast (amount threshold : Nat) : Bool := threshold ≤ amount
def exceeds (amount threshold : Nat) : Bool := threshold < amount

example : atLeast 700_000 700_000 = true := by decide
example : atLeast 699_999 700_000 = false := by decide
example : exceeds 500_000 500_000 = false := by decide
example : exceeds 500_001 500_000 = true := by decide

end JapanTaxLaw.MoneyThresholds
