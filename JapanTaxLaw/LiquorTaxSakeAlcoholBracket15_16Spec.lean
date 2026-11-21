import JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16

/-!
# LiquorTaxSakeAlcoholBracket15_16Spec — independent spec for 酒税法 附則第三十八条(1)

Law id: 328AC0000000006 (酒税法, Act)
Revision: 328AC0000000006_20260525_506AC0000000052
Article: 附則第三十八条 （清酒に関する特例） — アルコール分 十五度以上十六度未満 → 五十七万六百円
Normative unit: NORM|20df6a4420603ab9709d60a910136e38180bd27752be45e45997a943ffa1f7c2

The implementation uses `15 ≤ degrees ∧ degrees < 16`. The independent spec uses
a negation/complement form `¬ degrees < 15 ∧ ¬ 16 ≤ degrees` — a genuinely
distinct formulation. The kernel proves equivalence for ALL degrees, axiom-free
via core Nat lemmas.

Boundaries: 15° qualifies (以上 inclusive); 16° fails (未満 exclusive).
The paired amount ¥570,600 is decoded by a separate rfl theorem.

Not modelled: transition period, new/old law comparison, other classes, other
bracket rows and other articles.
-/

namespace JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16

open JapanTaxLaw.TaxFinance

/-- Independent spec: complement (negation) form of the bracket. -/
def specInBracket (degrees : Nat) : Prop :=
  ¬ degrees < alcoholLowerInclusiveDegrees ∧ ¬ alcoholUpperExclusiveDegrees ≤ degrees

/-- Equivalence for all degrees. Universal, kernel-checked, axiom-free. -/
theorem agree_in_bracket (degrees : Nat) :
    inBracket degrees ↔ specInBracket degrees := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact ⟨Nat.not_lt_of_ge h.1, Nat.not_le_of_gt h.2⟩
  · intro h
    exact ⟨Nat.le_of_not_gt h.1, Nat.lt_of_not_ge h.2⟩

/-- 十五度 (15) qualifies (以上 inclusive). -/
theorem at_lower : inBracket 15 := by
  unfold inBracket alcoholLowerInclusiveDegrees alcoholUpperExclusiveDegrees
  decide

/-- 十六度 (16) does NOT qualify (未満 exclusive). -/
theorem at_upper : ¬ inBracket 16 := by
  unfold inBracket alcoholLowerInclusiveDegrees alcoholUpperExclusiveDegrees
  decide

/-- 五十七万六百円 = 570,600. -/
theorem amount_decoded : taxAmountYen = 570_600 := rfl

end JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16
