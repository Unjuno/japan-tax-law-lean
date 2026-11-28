import JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusiveSpec

/- Kernel-decided boundary checks for 「当該契約に基づくイに定める個人に対する年金の支払は、当該年金の受取人の年齢が六十歳に達した日以後の日で当該契約で定める日以後十年以上の期間又は当該受取人が生存している期間にわたつて定期に行うものであることその他の政令で定める要件」. -/
namespace JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 9 = false := by decide  -- threshold_below
example : inScopeBool 10 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 11 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 10 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 9 := by unfold inScope; decide  -- outside (Prop)
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (years : Nat) : inScope years ↔ specInScope years := agree_scope years

end JapanTaxLaw.LocalTax314_2_7AnnuityAtLeast10YearsInclusive
