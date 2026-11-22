import JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition

/-!
# CustomsTariffArt12MiningEmergencyConditionSpec — independent spec 関税定率法 第十二条(1)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第十二条(1) — CONDITION 「凶作の場合又は天災、事変その他の緊急の場合において必要があるとき。」.
Normative unit: NORM|87b9f966c634326085c0f7d1a57c6e1e84993c717043f092084c05da4d7e4fe8

The implementation is `appliesTo : Case -> Bool`. The independent spec states
the same as a propositional equality `c = enumerated`, representationally
distinct from the Bool function, equivalent for both constructors. Axiom-free
via explicit cases/constructor/rfl (no simp/propext).

Not modelled: substantive treatment, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition

def SpecEnumerated (c : Case) : Prop := c = Case.enumerated

theorem agree_applies (c : Case) : (appliesTo c = true) ↔ SpecEnumerated c := by
  cases c
  · constructor
    · intro _h; rfl
    · intro _h; rfl
  · constructor
    · intro h; cases h
    · intro h; cases h

end JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition
