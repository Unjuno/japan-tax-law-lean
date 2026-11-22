import JapanTaxLaw.CustomsTariffArt17DutyExemptionReading

/-!
# CustomsTariffArt17DutyExemptionReadingSpec — independent spec 関税定率法 第十七条(2)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十七条(2) — READING 「第十三条第三項の規定は、前項の規定により関税を免除する場合について準用する。」: Article 13(3) is read into the duty-exemption case.
Normative unit: NORM|760484ebb1fe349e9ed493fddb34acc8ef4aace8f5092589dfcf179c2f827d25

The implementation is `appliesViaReading` and `readSourceFor`. The independent
spec states the same cross-reference as propositional equalities,
representationally distinct from the Bool/inductive functions. Agreement
theorems are axiom-free via explicit cases/constructor/rfl (no simp/propext).

Not modelled: Article 13(3) substance, exemption substance, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt17DutyExemptionReading

def SpecTrigger (c : Case) : Prop := c = Case.dutyExempted

def SpecReadsArticle13 (c : Case) : Prop :=
  readSourceFor c = ReadSource.article13Para3

theorem agree_reading (c : Case) : (appliesViaReading c = true) ↔ SpecTrigger c := by
  cases c
  · constructor
    · intro _h; rfl
    · intro _h; rfl
  · constructor
    · intro h; cases h
    · intro h; cases h

theorem agree_source (c : Case) : SpecReadsArticle13 c ↔ c = Case.dutyExempted := by
  cases c
  · constructor
    · intro _h; rfl
    · intro _h; rfl
  · constructor
    · intro h; cases h
    · intro h; cases h

end JapanTaxLaw.CustomsTariffArt17DutyExemptionReading
