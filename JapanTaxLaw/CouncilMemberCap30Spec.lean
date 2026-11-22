import JapanTaxLaw.CouncilMemberCap30

/-
# CouncilMemberCap30Spec — independent spec for 税制調査会組織規則 第一条

Independently transcribed 「委員三十人以内」 as the count cap n <= 30,
with its own specCap = 三十 = 30 and its own decidable test specWithin.
No implementation identifier appears in the spec* DEFINITIONS below; only
the two bridge theorems reference the implementation. Agreement is checked
in the Lean kernel with `unfold ... ; rfl`.
-/

namespace JapanTaxLaw.CouncilMemberCap30

/-- Independently typed statutory cap: 三十 = 30. -/
def specCap : Nat := 30

/-- Independently typed 三十人以内 test (INCLUSIVE at 30). -/
def specWithin (n : Nat) : Bool :=
  decide (n <= specCap)

theorem agreeCap : memberCap = specCap := by unfold memberCap specCap; rfl
theorem agreeWithin (n : Nat) : withinMemberCap n = specWithin n := by
  unfold withinMemberCap specWithin memberCap specCap
  rfl

end JapanTaxLaw.CouncilMemberCap30
