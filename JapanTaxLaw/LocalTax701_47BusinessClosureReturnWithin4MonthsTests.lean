import JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4MonthsSpec

/- Kernel-decided boundary checks for 「事業所等において個人が行う事業に対して課する事業所税の納税義務者は、その年の翌年三月十五日までに（年の中途において事業を廃止した場合には、当該事業の廃止の日から一月以内（当該事業の廃止が納税義務者の死亡によるときは、四月以内）に）、個人に係る課税期間に係る事業所税の課税標準額及び税額その他必要な事項を記載した総務省令で定める様式による申告書を当該事業所等所在の指定都市等の長に提出するとともに、その申告した税額を当該指定都市等に納付しなければならない。」. -/
namespace JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 3 = true := by decide  -- threshold_below
example : inScopeBool 4 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 5 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 4 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 5 := by unfold inScope; decide  -- outside (Prop)
example : inScope 4 ↔ specInScope 4 := agree_scope 4
example (months : Nat) : inScope months ↔ specInScope months := agree_scope months

end JapanTaxLaw.LocalTax701_47BusinessClosureReturnWithin4Months
