import JapanTaxLaw.InheritanceTaxArt6RefundReadingSpec

/-!
# InheritanceTaxArt6RefundReadingTests — kernel-checked checks

Verifies READING 「前項の規定は、定期金給付契約について返還金その他これに準ずるものの取得があつた場合について準用する。」: refund case applies, other does not.
-/

namespace JapanTaxLaw.InheritanceTaxArt6RefundReading

example : applies Case.refundAcquisition := refund_applies
example : ¬ applies Case.other := other_not_applies
example : applies Case.refundAcquisition ∨ ¬ applies Case.other := applies_decidable
example : SpecApplies Case.refundAcquisition := refund_spec_agreement
example : ¬ SpecApplies Case.other := other_spec_agreement

end JapanTaxLaw.InheritanceTaxArt6RefundReading
