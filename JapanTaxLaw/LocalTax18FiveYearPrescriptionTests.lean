import JapanTaxLaw.LocalTax18FiveYearPrescriptionSpec

/- Kernel-decided boundary checks for 「地方団体の徴収金の徴収を目的とする地方団体の権利（以下この款において「地方税の徴収権」という。）は、法定納期限（次の各号に掲げる地方団体の徴収金については、それぞれ当該各号に定める日）の翌日から起算して五年間行使しないことによつて、時効により消滅する。」. -/
namespace JapanTaxLaw.LocalTax18FiveYearPrescription

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input / threshold_below
example : inScopeBool 4 = false := by decide  -- threshold_below
example : inScopeBool 5 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 6 = true := by decide  -- threshold_above
example : inScope 5 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 4 := by unfold inScope; decide  -- threshold_below (Prop)
example : inScope 6 ↔ specInScope 6 := agree_scope 6
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax18FiveYearPrescription
