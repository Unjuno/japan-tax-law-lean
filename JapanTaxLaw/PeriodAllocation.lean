import JapanTaxLaw.TaxFinance

/-!
# PeriodAllocation — 23 の 期間数・人数による割り算 規定

Pinned provisions allocate an amount across a count of periods or persons:
「不足税額をその決定があつた日までの納期の数で除して得た額」,
「税額をそれぞれの延納期間に相当する年数で除して計算した金額」,
「…を事業専従者の数に一を加えた数で除して得た金額」.
The implementation returns the integer quotient `amount / count` (Nat yen).
The count is a positive number of periods/persons supplied by the caller;
`amount`, the count, and any surrounding multiplication/rounding are NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.PeriodAllocation

def perUnit (amount count : Nat) : Nat := amount / count

example : perUnit 1200 4 = 300 := by decide
example : perUnit 1201 4 = 300 := by decide
example : perUnit 5 1 = 5 := by decide
example : perUnit 0 4 = 0 := by decide

end JapanTaxLaw.PeriodAllocation
