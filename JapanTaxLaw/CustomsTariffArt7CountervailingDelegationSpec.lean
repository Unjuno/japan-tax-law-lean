import JapanTaxLaw.CustomsTariffArt7CountervailingDelegation

/-!
# CustomsTariffArt7CountervailingDelegationSpec — independent spec for 関税定率法 第七条(33)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第七条(33) — residual delegation: matters necessary for applying 相殺関税
         are prescribed by 政令; in-Act matters are not delegated.
Normative unit: NORM|e0b944b35e9349347a9ceecafce676e12456b363118f2bb1271a40efde92025b

The implementation is a function `determinedBy : Matter -> LegalSource`. The
independent spec states the delegation as a PROPOSITIONAL relation and proves the
function agrees for all matter classes. Kernel checks axiom-free by exhaustive
`cases` (no BEq, no Classical.choice). Not modelled: actual 政令 content.

Not modelled: actual Cabinet Order content, other articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7CountervailingDelegation

/-- Independent spec: delegation as a propositional matter/source relation. -/
def SpecDeterminedBy (m : Matter) (s : LegalSource) : Prop :=
  (m = Matter.inAct ∧ s = LegalSource.act) ∨
  (m = Matter.necessaryForApplication ∧ s = LegalSource.cabinetOrder)

/-- Universal agreement. Axiom-free by exhaustive cases. -/
theorem agree_determined_by (m : Matter) : SpecDeterminedBy m (determinedBy m) := by
  cases m <;> simp [determinedBy, SpecDeterminedBy]

/-- Residual ほか: in-Act matters are determined by the Act. -/
theorem in_act_by_act : SpecDeterminedBy Matter.inAct LegalSource.act := by
  unfold SpecDeterminedBy
  decide
/-- Necessary application matters are delegated to 政令. -/
theorem application_by_order :
    SpecDeterminedBy Matter.necessaryForApplication LegalSource.cabinetOrder := by
  unfold SpecDeterminedBy
  decide

end JapanTaxLaw.CustomsTariffArt7CountervailingDelegation
