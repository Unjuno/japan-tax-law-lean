import JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect

/-!
# CustomsTariffArt8_2AntiDumpingCircumventionEffectSpec — independent spec 関税定率法 第八条の二

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条の二 caption — EFFECT 「（不当廉売関税の課税の回避のために第三国から輸入される貨物等に対して課する関税）」.
Normative unit: NORM|8789ee655212d701703263bc001c3736ef358b2ecfcbb3cd68bb4a181dd709bd

The implementation is a Bool function `withinEffect`. The independent spec
states the same effect scope as a PROPOSITIONAL conjunction of origin and
purpose, representationally distinct. Universal agreement is proved by exhaustive
cases with rfl/cases — no decide/simp/propext/Classical.choice.

Not modelled: operative article text, anti-dumping determinations, duty
computation, 等 extensions, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect

/-- Independent spec: the effect scope as a propositional predicate. -/
def SpecWithinEffect (o : ImportOrigin) (p : Purpose) : Prop :=
  o = ImportOrigin.thirdCountry ∧ p = Purpose.avoidAntiDumping

/-- Universal agreement between the Bool implementation and the spec.
    Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_within_effect (o : ImportOrigin) (p : Purpose) :
    (withinEffect o p = true) ↔ SpecWithinEffect o p := by
  cases o
  · cases p
    · constructor
      · intro _h
        exact ⟨rfl, rfl⟩
      · intro _h
        rfl
    · constructor
      · intro h
        cases h
      · intro h
        cases h.2
  · constructor
    · intro h
      cases h
    · intro h
      cases h.1

end JapanTaxLaw.CustomsTariffArt8_2AntiDumpingCircumventionEffect
