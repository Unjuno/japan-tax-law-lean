/-!
# TransitionalDelegationAndPriorPenalty — 経過措置の委任と罰則の従前

694 units with two §3 norm structures:

A) 経過措置の政令委任 (572 units, four spelling variants):
   「この附則に規定するもののほか、この法律の施行に関し必要な経過措置は、
     政令で定める。」 (and に定める/に伴い variants)
   → the statute DELEGATES transitional measures to cabinet order; the delegated
     content is caller-supplied and NOT MODELLED. All four variants express the
     same delegation; kernel-equality recorded.

B) 施行前行為の罰則 (122 units):
   「この法律の施行前にした行為に対する罰則の適用については、なお従前の例による。」
   → for acts before enforcement, the OLD penalty law applies; otherwise NEW.
   Formalized as a temporal switch with boundary at the enforcement date.

No delegated content, penalty amounts, or legal adequacy is modelled.
-/
namespace JapanTaxLaw.TransitionalDelegationAndPriorPenalty

-- ── A) 経過措置の政令委任 ────────────────────────────────────────────
/-- 委任の記録（内容は呼出側が与え、ここでは NOT MODELLED）。 -/
def delegTransitional (content : Nat) : Nat := content

theorem delegation_is_identity (content : Nat) : delegTransitional content = content := by rfl

/- 四つの文言変形は同じ委任構造（拡張的に同一）。 -/
namespace V1
def delegate := JapanTaxLaw.TransitionalDelegationAndPriorPenalty.delegTransitional
end V1
namespace V2
def delegate := JapanTaxLaw.TransitionalDelegationAndPriorPenalty.delegTransitional
end V2
namespace V3
def delegate := JapanTaxLaw.TransitionalDelegationAndPriorPenalty.delegTransitional
end V3
namespace V4
def delegate := JapanTaxLaw.TransitionalDelegationAndPriorPenalty.delegTransitional
end V4

theorem all_delegation_variants (c : Nat) :
    V1.delegate c = V2.delegate c ∧ V1.delegate c = V3.delegate c ∧
    V1.delegate c = V4.delegate c := by
  simp [V1.delegate, V2.delegate, V3.delegate, V4.delegate]

-- ── B) 施行前行為の罰則（時間的適用） ─────────────────────────────────
/-- 0 = 旧法（従前の例）, 1 = 新法。 -/
def applicablePenaltyLaw (actDate enforcement : Nat) : Nat :=
  if actDate < enforcement then 0 else 1

theorem before_enforcement (d e : Nat) (h : d < e) : applicablePenaltyLaw d e = 0 := by
  simp [applicablePenaltyLaw, h]

theorem at_or_after_enforcement (d e : Nat) (h : e <= d) : applicablePenaltyLaw d e = 1 := by
  simp [applicablePenaltyLaw, h]

theorem old_new_exclusive (d e : Nat) :
    ¬ (applicablePenaltyLaw d e = 0 ∧ applicablePenaltyLaw d e = 1) := by
  by_cases h : d < e <;> simp [applicablePenaltyLaw, h]

theorem old_new_exhaustive (d e : Nat) :
    applicablePenaltyLaw d e = 0 ∨ applicablePenaltyLaw d e = 1 := by
  by_cases h : d < e <;> simp [applicablePenaltyLaw, h]

theorem boundary_at_enforcement (e : Nat) :
    applicablePenaltyLaw (e - 1) e = 0 ∨ e = 0 := by
  by_cases h : e = 0
  · exact Or.inr h
  · left
    have hlt : e - 1 < e := by omega
    exact before_enforcement (e - 1) e hlt

end JapanTaxLaw.TransitionalDelegationAndPriorPenalty
