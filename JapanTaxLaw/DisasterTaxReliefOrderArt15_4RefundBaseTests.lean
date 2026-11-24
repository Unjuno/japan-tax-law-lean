import JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBaseSpec

/-!
# DisasterTaxReliefOrderArt15_4RefundBaseTests — kernel-checked checks

Verifies EFFECT 「還付を受けようとする自動車重量税の額に相当する金額」: base amount equals the tax amount sought to be refunded.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase

example (a : Nat) : refundBaseAmount a = a := base_equals_tax_amount a
example : refundBaseAmount 0 = 0 := zero_tax_zero_base
example (a : Nat) : SpecRefundBase a (refundBaseAmount a) := implementation_satisfies_spec a

end JapanTaxLaw.DisasterTaxReliefOrderArt15_4RefundBase
