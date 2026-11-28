import JapanTaxLaw.TaxFinance

/-
# LocalTax53_2CorrectionRequestWithin2Months — pinned clause 「前条第一項、第二項又は第三十四項の申告書を提出した法人は、当該申告書に係る法人税割額の計算の基礎となつた法人税の額について国の税務官署の更正を受けたことに伴い当該申告書に係る法人税割額の課税標準となる法人税額又は法人税割額が過大となる場合には、国の税務官署が当該更正の通知をした日から二月以内に限り、総務省令の定めるところにより、道府県知事に対し、当該法人税額又は法人税割額につき、更正の請求をすることができる。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 53_2, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|332bac36974d6e18bccffbaddc64ffaa2c47dc8156c9908f763a4aa4ee2e5bc8.
原文逐語: 「前条第一項、第二項又は第三十四項の申告書を提出した法人は、当該申告書に係る法人税割額の計算の基礎となつた法人税の額について国の税務官署の更正を受けたことに伴い当該申告書に係る法人税割額の課税標準となる法人税額又は法人税割額が過大となる場合には、国の税務官署が当該更正の通知をした日から二月以内に限り、総務省令の定めるところにより、道府県知事に対し、当該法人税額又は法人税割額につき、更正の請求をすることができる。」
Scope: ONLY the 更正の通知をした日から二月以内 (months <= 2) INCLUSIVE ceiling for the 更正の請求. 法人税額の過大となる要件・国の税務官署の更正・総務省令の定め・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months

open JapanTaxLaw.TaxFinance

/-- 「前条第一項、第二項又は第三十四項の申告書を提出した法人は、当該申告書に係る法人税割額の計算の基礎となつた法人税の額について国の税務官署の更正を受けたことに伴い当該申告書に係る法人税割額の課税標準となる法人税額又は法人税割額が過大となる場合には、国の税務官署が当該更正の通知をした日から二月以内に限り、総務省令の定めるところにより、道府県知事に対し、当該法人税額又は法人税割額につき、更正の請求をすることができる。」 — statutory threshold literal (2); INCLUSIVE boundary. -/
def inScope (months : Nat) : Prop := months <= 2

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (months : Nat) : Bool := decide (months <= 2)

end JapanTaxLaw.LocalTax53_2CorrectionRequestWithin2Months
