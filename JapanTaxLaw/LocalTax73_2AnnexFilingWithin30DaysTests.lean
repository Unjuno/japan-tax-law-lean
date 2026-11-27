import JapanTaxLaw.LocalTax73_2AnnexFilingWithin30DaysSpec

/- Kernel-decided boundary checks for 「この場合においては、主体構造部の取得者が納税通知書の交付を受けた日から三十日以内に、附帯設備に属する部分の取得者と協議の上、当該不動産取得税の課税標準となるべき価額のうち附帯設備に属する部分の取得者の所有に属する部分の価額を申し出たときは、その部分の価額に基づいて附帯設備に属する部分の取得者に不動産取得税を課するものとし、主体構造部の取得者に課した不動産取得税の税額から附帯設備の取得者に課した不動産取得税の税額に相当する額を減額するものとする。」. -/
namespace JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days

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

end JapanTaxLaw.LocalTax73_2AnnexFilingWithin30Days
