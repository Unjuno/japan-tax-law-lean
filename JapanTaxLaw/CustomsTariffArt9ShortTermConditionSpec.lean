import JapanTaxLaw.CustomsTariffArt9ShortTermCondition

/-!
# CustomsTariffArt9ShortTermConditionSpec — independent spec for 関税定率法 第九条(13)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第九条(13) — CONDITION 「過去五年以内に当該短期の措置に係る貨物について緊急措置が三回以上とられていない場合」:
         fewer than three emergency measures in the past five-year window.
Normative unit: NORM|295ccda6a0b3cf28951dffd64407d01984af6262dd2e744bd27833c6c2af1e52

The implementation is `conditionMet : Nat -> Bool` using the `<` comparison.
The independent spec states the same condition as the negated antonym of the
statute: `¬ (thresholdCount ≤ priorMeasures)` ("NOT three or more times"),
representationally distinct from the Bool `<` comparison and equivalent for all
inputs. Axiom-free proof from core Nat/decide lemmas (no decide-as-proof, no
simp/propext in the agreement theorem).

Not modelled: measure substance, goods scope, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt9ShortTermCondition

/-- Independent spec: NOT (threshold or more measures). -/
def SpecConditionMet (priorMeasures : Nat) : Prop :=
  ¬ (thresholdCount ≤ priorMeasures)

/-- Universal agreement, axiom-free via core Nat/decide lemmas. -/
theorem agree_condition (n : Nat) :
    (conditionMet n = true) ↔ SpecConditionMet n := by
  unfold conditionMet SpecConditionMet
  constructor
  · intro h
    exact Nat.not_le_of_lt (of_decide_eq_true h)
  · intro h
    exact decide_eq_true (Nat.lt_of_not_ge h)

end JapanTaxLaw.CustomsTariffArt9ShortTermCondition
