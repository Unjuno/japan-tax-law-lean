import JapanTaxLaw.CustomsTariffArt14ProvisoReading

/-!
# CustomsTariffArt14ProvisoReadingSpec — independent spec for 関税定率法 第十四条(1) Item 11

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十四条(1) — READING 「この場合においては、前号ただし書の規定を準用する。」:
         the preceding item's proviso is read into the present case.
Normative unit: NORM|1808965ba8548637956b182cc69e43ba66f490beb0479b631d44d6e9f3f15544

The implementation is `appliesViaReading : Case -> Bool` and `readSourceFor`.
The independent spec states the same cross-reference as propositional
equalities (`c = item11` and `readSourceFor c = precedingProviso`),
representationally distinct from the Bool function and equivalent for both
constructors. Axiom-free via rfl/cases.

Not modelled: proviso substance, Item 11 substance, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt14ProvisoReading

/-- Independent spec: the case is Item 11. -/
def SpecTrigger (c : Case) : Prop := c = Case.item11

/-- Independent spec: the read-in source is the preceding proviso. -/
def SpecReadsProviso (c : Case) : Prop :=
  readSourceFor c = ReadSource.precedingProviso

/-- Universal agreement (axiom-free, no simp/propext). -/
theorem agree_reading (c : Case) : (appliesViaReading c = true) ↔ SpecTrigger c := by
  cases c
  · constructor
    · intro _h
      rfl
    · intro _h
      rfl
  · constructor
    · intro h
      cases h
    · intro h
      cases h

/-- Universal source agreement (axiom-free, no simp/propext). -/
theorem agree_source (c : Case) : SpecReadsProviso c ↔ c = Case.item11 := by
  cases c
  · constructor
    · intro _h
      rfl
    · intro _h
      rfl
  · constructor
    · intro h
      cases h
    · intro h
      cases h

end JapanTaxLaw.CustomsTariffArt14ProvisoReading
