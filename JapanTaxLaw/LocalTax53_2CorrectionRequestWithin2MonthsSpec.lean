import JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months

/-
# LocalTax53_2CorrectionRequestWithin2MonthsSpec — independent spec for 地方税法 Num 53_2/1

Needle 「前条第一項、第二項又は第三十四項の申告書を提出した法人は、当該申告書に係る法人税割額の計算の基礎となつた法人税の額について国の税務官署の更正を受けたことに伴い当該申告書に係る法人税割額の課税標準となる法人税額又は法人税割額が過大となる場合には、国の税務官署が当該更正の通知をした日から二月以内に限り、総務省令の定めるところにより、道府県知事に対し、当該法人税額又は法人税割額につき、更正の請求をすることができる。」.
The implementation uses `months <= 2`; this independent spec states the
statutory INCLUSIVE boundary as `months <= 2`, built from statutory literals only with
no implementation identifier. Universal axiom-free bridge.
「以上」/「以下」/「以内」 are INCLUSIVE: the threshold itself qualifies.
-/
namespace JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months

open JapanTaxLaw.TaxFinance

def specInScope (months : Nat) : Prop := months <= 2

theorem agree_scope (months : Nat) : inScope months ↔ specInScope months := by
  unfold inScope specInScope
  rfl
end JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months
