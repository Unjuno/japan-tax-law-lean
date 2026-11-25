import JapanTaxLaw.TaxFinance

/-!
# MonthProration — 21 の 月数按分規定

Pinned units compute an annual amount prorated by the number of months:
`annual * months / den`, with den ∈ {12, 24, 36, 48, 60, 180}.
The eligibility and the exact `annual` amount are caller-established and
NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.MonthProration

def prorate (annual months den : Nat) : Nat := annual * months / den

def prorate12 (annual months : Nat) : Nat := prorate annual months 12
def prorate24 (annual months : Nat) : Nat := prorate annual months 24
def prorate36 (annual months : Nat) : Nat := prorate annual months 36
def prorate48 (annual months : Nat) : Nat := prorate annual months 48
def prorate60 (annual months : Nat) : Nat := prorate annual months 60
def prorate180 (annual months : Nat) : Nat := prorate annual months 180

example : prorate12 1_200_000 5 = 500_000 := by decide
example : prorate24 1_200_000 5 = 250_000 := by decide
example : prorate60 1_200_000 5 = 100_000 := by decide
example : prorate180 1_200_000 5 = 33_333 := by decide

end JapanTaxLaw.MonthProration
