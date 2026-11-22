import JapanTaxLaw.CustomsTariffArt7InvestigationDeadlineSpec

/-!
# CustomsTariffArt7InvestigationDeadlineTests — kernel-checked checks for 関税定率法 第七条(31)

Verifies the one-year investigation deadline: completion at the deadline (inclusive
以内) qualifies, after the deadline does not; universal agreement with the
contrapositive strict-inequality independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt7InvestigationDeadline

-- 一年 = 1 year (derived from the verbatim needle).
example : yearCount = 1 := rfl

-- Boundary: completion exactly at deadline qualifies (以内 inclusive).
example (oneYearDays request : Nat) :
    withinDeadline oneYearDays request (request + yearCount * oneYearDays) :=
  at_deadline oneYearDays request

-- After the deadline does not qualify.
example (oneYearDays request : Nat) :
    ¬ withinDeadline oneYearDays request (request + yearCount * oneYearDays + 1) :=
  after_deadline oneYearDays request

-- Concrete: oneYearDays=365, request=100 -> deadline=465 inclusive, 466 fails.
example : withinDeadline 365 100 465 := at_deadline 365 100
example : ¬ withinDeadline 365 100 466 := after_deadline 365 100

-- Universal agreement with the independent contrapositive strict-inequality spec.
example (oneYearDays request completion : Nat) :
    withinDeadline oneYearDays request completion ↔
      SpecWithinDeadline oneYearDays request completion :=
  agree_within_deadline oneYearDays request completion

end JapanTaxLaw.CustomsTariffArt7InvestigationDeadline
