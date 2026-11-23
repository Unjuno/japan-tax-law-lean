import JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading

/-!
# CustomsTariffArt19PrevPara5Or6ReadingSpec — independent spec 関税定率法 第十九条(8)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十九条(8) — READING 「前項の規定は、第五項又は第六項の規定を適用する場合について準用する。」: 前項 read in for 第五項 OR 第六項.
Normative unit: NORM|a0184c1fc0cb64c644aa5ef470ba11907d10add61cb7dfb49ce9901bd8f88e68

The implementation is a Prop-valued function `appliesViaReading` using a
disjunction of two constructor equalities. The independent spec states the same
rule as a Bool function `SpecAppliesBool` (true only for the two listed triggers),
representationally distinct from the Prop disjunction. Universal agreement is
proved by exhaustive cases with rfl/intro/rcases — no decide/simp/propext.

Not modelled: substantive content of 前項 / 第五項 / 第六項, trigger
establishment, other reading rules, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading

/-- Independent spec: Bool function true only for the two listed triggers. -/
def SpecAppliesBool (tr : Trigger) : Bool :=
  match tr with
  | Trigger.para5 => true
  | Trigger.para6 => true
  | Trigger.other => false

/-- Universal agreement between the Prop implementation and the Bool spec.
    Axiom-free by exhaustive cases with rfl/intro/rcases. -/
theorem agree_applies (tr : Trigger) (p : Provision) :
    appliesViaReading tr p ↔ SpecAppliesBool tr = true := by
  cases tr
  · constructor
    · intro _h
      rfl
    · intro _h
      left
      rfl
  · constructor
    · intro _h
      rfl
    · intro _h
      right
      rfl
  · constructor
    · intro h
      rcases h with h | h <;> cases h
    · intro h
      cases h

end JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading
