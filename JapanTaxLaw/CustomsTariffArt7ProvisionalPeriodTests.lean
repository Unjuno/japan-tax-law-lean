import JapanTaxLaw.CustomsTariffArt7ProvisionalPeriodSpec

/-!
# CustomsTariffArt7ProvisionalPeriodTests — kernel-checked checks for 関税定率法 第七条(3)

Verifies the bounded date interval 「九十日前の日以後…指定がされた日の前日まで」:
offsetDays=90 (derived from the verbatim 九十日前), both boundaries inclusive
(以後 / まで), and universal agreement with the independent contrapositive
strict-inequality spec.
-/

namespace JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod

-- 九十 = 90 days (derived from the verbatim needle).
example : offsetDays = 90 := rfl

-- lowerBound / upperBound computation.
example : lowerBound 200 = 110 := rfl
example : upperBound 150 = 149 := rfl

-- Both boundaries inclusive, given a well-formed interval.
example (measure designation : Nat) (h : lowerBound measure ≤ upperBound designation) :
    inPeriod (lowerBound measure) (upperBound designation) (lowerBound measure) :=
  measure_day_in measure designation h

example (measure designation : Nat) (h : lowerBound measure ≤ upperBound designation) :
    inPeriod (lowerBound measure) (upperBound designation) (upperBound designation) :=
  designation_eve_in measure designation h

-- Concrete: measure=200 -> lo=110; designation=150 -> hi=149; 110 and 149 inside.
example : inPeriod 110 149 110 := ⟨Nat.le_refl _, Nat.le_of_lt (by decide : 110 < 149)⟩
example : inPeriod 110 149 149 := ⟨Nat.le_of_lt (by decide : 110 < 149), Nat.le_refl _⟩
example : ¬ inPeriod 110 149 150 := by
  intro h
  exact (Nat.not_lt_of_ge h.2) (by decide : 149 < 150)

-- Universal agreement with the independent spec.
example (lo hi t : Nat) : inPeriod lo hi t ↔ SpecInPeriod lo hi t :=
  agree_in_period lo hi t

end JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod
