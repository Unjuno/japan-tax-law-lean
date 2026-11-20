import JapanTaxLaw.BondedAreaKinds

/-!
# BondedAreaKindsSpec — independent spec for 関税法 art.29（保税地域五種）

Law id: 329AC0000000061 (関税法)
Revision: 329AC0000000061_20260601_508AC0000000005
Statutory article: art.29(1) — 保税地域は五種とする
Normative unit: NORM|82181433a122f927ffe22c13314bc4aa5d5b3e8df17fd13c98f2a46c498b47b0

The implementation records the statutory count as a literal `kindCount = 5`
and lists the five kinds in `allKinds`. The independent spec derives the count
from the LIST (`allKinds.length`) rather than the literal — a genuinely distinct
formulation. The kernel proves they agree, that the list has no duplicates, and
that it is exhaustive over all constructors (a universal proof over the finite
type, not a sample).

Not modelled: the substantive definitions of each bonded area, other paragraphs,
政令 details.
-/

namespace JapanTaxLaw.BondedAreaKinds

/-- Independent spec: count derived from the enumeration length, not the literal. -/
def specKindCount : Nat := allKinds.length

/-- The literal statutory count agrees with the derived enumeration length. -/
theorem agree_kind_count : kindCount = specKindCount := by
  unfold kindCount specKindCount allKinds
  rfl

/-- The enumeration has no duplicates. -/
theorem all_kinds_nodup : allKinds.Nodup := by
  simp [allKinds]

/-- The enumeration is exhaustive over every constructor (universal). -/
theorem all_kinds_exhaustive (k : BondedAreaKind) : k ∈ allKinds := by
  cases k <;> simp [allKinds]

/-- Cardinality boundary: the statutory count is exactly five. -/
theorem kind_count_is_five : kindCount = 5 := rfl

end JapanTaxLaw.BondedAreaKinds
