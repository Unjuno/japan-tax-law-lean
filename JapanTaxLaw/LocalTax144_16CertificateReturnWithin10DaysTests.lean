import JapanTaxLaw.LocalTax144_16CertificateReturnWithin10DaysSpec

/- Kernel-decided boundary checks for 「第一項の証票の交付を受けた者は、軽油引取税の特別徴収の義務が消滅した場合又は事務所若しくは事業所を廃止した場合には、その消滅し、又は廃止した日から十日以内にその証票を道府県知事に返さなければならない。」. -/
namespace JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 11 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 9 = true := by decide  -- bool
example : inScopeBool 10 = true := by decide  -- bool
example : inScopeBool 11 = false := by decide  -- bool
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax144_16CertificateReturnWithin10Days
