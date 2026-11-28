import JapanTaxLaw.LocalTax37_2DonationUsageAtLeast60PercentSpec

/- Kernel-decided boundary checks for 「都道府県等が指定対象期間において受領する第一号寄附金の額の合計額から当該指定対象期間における第一号寄附金の募集に要する費用の額として総務大臣が定めるところにより算定した額を控除して得た額（ロにおいて「寄附金活用可能額」という。）が、当該指定対象期間において受領する第一号寄附金の額の合計額の百分の六十に相当する金額以上であること。」. -/
namespace JapanTaxLaw.LocalTax37_2DonationUsageAtLeast60Percent

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input / threshold_below
example : inScopeBool 59 = false := by decide  -- threshold_below
example : inScopeBool 60 = true := by decide  -- threshold_at (INCLUSIVE)
example : inScopeBool 61 = true := by decide  -- threshold_above
example : inScope 60 := by unfold inScope; decide  -- threshold_at (Prop, INCLUSIVE)
example : ¬ inScope 59 := by unfold inScope; decide  -- threshold_below (Prop)
example : inScope 61 ↔ specInScope 61 := agree_scope 61
example (percent : Nat) : inScope percent ↔ specInScope percent := agree_scope percent

end JapanTaxLaw.LocalTax37_2DonationUsageAtLeast60Percent
