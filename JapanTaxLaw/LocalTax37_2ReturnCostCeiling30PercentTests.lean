import JapanTaxLaw.LocalTax37_2ReturnCostCeiling30PercentSpec

/- Kernel-decided boundary checks for 「都道府県等が個別の第一号寄附金の受領に伴い提供する返礼品等の調達に要する費用の額として総務大臣が定めるところにより算定した額が、いずれも当該都道府県等が受領する当該第一号寄附金の額の百分の三十に相当する金額以下であること。」. -/
namespace JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 29 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 30 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 31 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 29 = true := by decide  -- bool
example : inScopeBool 30 = true := by decide  -- bool
example : inScopeBool 31 = false := by decide  -- bool
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax37_2ReturnCostCeiling30Percent
