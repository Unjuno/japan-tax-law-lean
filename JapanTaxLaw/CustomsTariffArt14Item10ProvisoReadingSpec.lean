import JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading

/-!
# CustomsTariffArt14Item10ProvisoReadingSpec — independent spec 関税定率法 第十四条(1) Item 14

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十四条(1) — READING 「この場合においては、第十号ただし書の規定を準用する。」:
         the proviso of Item 10 is read into the case of Item 14.
Normative unit: NORM|490be20c34299cb9ee5c87382e21241fd3926621fe4583fabc1dd631efcecddb

The implementation is `appliesViaReading` and `readSourceFor`. The independent
spec states the same cross-reference as propositional equalities,
representationally distinct from the Bool/inductive functions. Agreement
theorems are axiom-free via explicit cases/constructor/rfl (no simp/propext).

Not modelled: item substance, proviso substance, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading

/-- Independent spec: the case is Item 14. -/
def SpecTrigger (c : Case) : Prop := c = Case.item14

/-- Independent spec: the read-in source is Item 10's proviso. -/
def SpecReadsItem10 (c : Case) : Prop :=
  readSourceFor c = ReadSource.item10Proviso

theorem agree_reading (c : Case) : (appliesViaReading c = true) ↔ SpecTrigger c := by
  cases c
  · constructor
    · intro _h; rfl
    · intro _h; rfl
  · constructor
    · intro h; cases h
    · intro h; cases h

theorem agree_source (c : Case) : SpecReadsItem10 c ↔ c = Case.item14 := by
  cases c
  · constructor
    · intro _h; rfl
    · intro _h; rfl
  · constructor
    · intro h; cases h
    · intro h; cases h

end JapanTaxLaw.CustomsTariffArt14Item10ProvisoReading
