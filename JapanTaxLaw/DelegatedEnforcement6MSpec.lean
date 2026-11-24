import JapanTaxLaw.DelegatedEnforcement6M

/-
# DelegatedEnforcement6MSpec — independent spec for 附則第一条（公布後六月以内）

Independently transcribed 「六月を超えない範囲内」 as the count cap
n <= 6, with its own specWindowMonths = 六 = 6 and its own decidable
specWithin. No implementation identifier appears in the spec* DEFINITIONS
below; only the two bridge theorems reference the implementation. Agreement
is checked in the Lean kernel with `unfold ... ; rfl`.

The exact cabinet-order enforcement date (施行日) is NOT MODELLED
(caller-established).
-/

namespace JapanTaxLaw.DelegatedEnforcement6M

/-- Independently typed statutory bound: 六 = 6 months. -/
def specWindowMonths : Nat := 6

/-- Independently typed 六月を超えない test (INCLUSIVE at 6). -/
def specWithin (n : Nat) : Bool :=
  decide (n <= specWindowMonths)

theorem agreeWindowMonths : windowMonths = specWindowMonths := by
  unfold windowMonths specWindowMonths
  rfl

theorem agreeWithin (n : Nat) : withinWindow n = specWithin n := by
  unfold withinWindow specWithin windowMonths specWindowMonths
  rfl

end JapanTaxLaw.DelegatedEnforcement6M
