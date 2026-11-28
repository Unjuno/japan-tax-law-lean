import JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2MonthsSpec

/- Kernel-decided boundary checks for 「前条第一項、第二項又は第三十四項の申告書を提出した法人は、当該申告書に係る法人税割額の計算の基礎となつた法人税の額について国の税務官署の更正を受けたことに伴い当該申告書に係る法人税割額の課税標準となる法人税額又は法人税割額が過大となる場合には、国の税務官署が当該更正の通知をした日から二月以内に限り、総務省令の定めるところにより、道府県知事に対し、当該法人税額又は法人税割額につき、更正の請求をすることができる。」. -/
namespace JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 1 = true := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 3 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 2 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 3 := by unfold inScope; decide  -- outside (Prop)
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (months : Nat) : inScope months ↔ specInScope months := agree_scope months

end JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months
