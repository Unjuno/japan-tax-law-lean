import JapanTaxLaw.DelegatedEnforcement3M

/-
# DelegatedEnforcement3MSpec — independent spec for 附則第一条（公布後三月以内）

Independently transcribed 「三月を超えない範囲内」 as the count cap
n <= 3, with its own specWindowMonths = 三 = 3 and its own decidable
specWithin. No implementation identifier appears in the spec* DEFINITIONS
below; only the two bridge theorems reference the implementation. Agreement
is checked in the Lean kernel with `unfold ... ; rfl`.

The exact cabinet-order enforcement date is NOT MODELLED (caller-established).
-/

namespace JapanTaxLaw.DelegatedEnforcement3M

/-- Independently typed statutory bound: 三 = 3 months. -/
def specWindowMonths : Nat := 3

/-- Independently typed 三月を超えない test (INCLUSIVE at 3). -/
def specWithin (n : Nat) : Bool :=
  decide (n <= specWindowMonths)

theorem agreeWindowMonths : windowMonths = specWindowMonths := by
  unfold windowMonths specWindowMonths
  rfl

theorem agreeWithin (n : Nat) : withinWindow n = specWithin n := by
  unfold withinWindow specWithin windowMonths specWindowMonths
  rfl

end JapanTaxLaw.DelegatedEnforcement3M
