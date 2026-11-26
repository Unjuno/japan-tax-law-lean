import JapanTaxLaw.TaxFinance

/-!
# IntegerPercentRates — 36 の 整数パーセント率 規定

Pinned provisions apply an integer percent rate to an amount:
「百分の五の標準税率によって定めた率を乗じて得た金額」,
「金額に百分の五を乗じて得た額」.
The exact fraction is represented by its numerator `amount * p` over the fixed
denominator 100 (`amount` in yen, `p` a percentage in [0,100]).
Any rounding to yen is a separate, caller-established rule and is NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.IntegerPercentRates

def percentNumerator (amount p : Nat) : Nat := amount * p

example : percentNumerator 1000 5 = 5000 := by decide
example : percentNumerator 1000 20 = 20000 := by decide

end JapanTaxLaw.IntegerPercentRates
