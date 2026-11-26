import JapanTaxLaw.TaxFinance
import JapanTaxLaw.PeriodAllocation
import JapanTaxLaw.IntegerPercentRatesSpec
import JapanTaxLaw.MoneyCap

/-!
# PreconditionCounterexamples — モデル前提違反の境界例

These are NOT statutory rules. They document, in the kernel, the behaviour of
the formal models OUTSIDE their stated preconditions, so that a caller cannot
mistake a Lean convention for a legal effect. Each theorem states that the
precondition is necessary for the intended algebraic law.

- `perUnit` needs a positive period count; at 0 the quotient is a Lean convention.
- `percentNumerator` is a fraction over denominator 100; rates above 100 are outside the statute's percentage domain.
- `capAmount` with limit 0 returns 0; that is not a statutory exemption.

Not legal advice.
-/

namespace JapanTaxLaw.PreconditionCounterexamples

open JapanTaxLaw.PeriodAllocation
open JapanTaxLaw.IntegerPercentRates
open JapanTaxLaw.MoneyCap

-- Division by zero: Lean convention, no statutory meaning.
example : perUnit 500 0 = 0 := by decide

-- The complement law FAILS without p <= 100: this is the counterexample
-- showing why numerator_complement carries that hypothesis.
example : percentNumerator 200 101 + percentNumerator 200 (100 - 101) ≠ 100 * 200 := by
  decide

-- The complement law holds under the precondition.
example : percentNumerator 200 25 + percentNumerator 200 75 = 100 * 200 :=
  numerator_complement 200 25 (by decide)

-- Zero cap: kernel returns 0, which is not a statutory exemption.
example : capAmount 500 0 = 0 := by decide

-- Cap boundary: exactly at the limit, no reduction.
example : capAmount 500 500 = 500 := by decide

end JapanTaxLaw.PreconditionCounterexamples
