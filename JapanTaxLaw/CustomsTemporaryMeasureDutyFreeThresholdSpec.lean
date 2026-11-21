import JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold

/-!
# CustomsTemporaryMeasureDutyFreeThresholdSpec — independent spec for 関税暫定措置法施行令 第二十七条(1)2

Law id: 335CO0000000069 (関税暫定措置法施行令, CabinetOrder)
Revision: 335CO0000000069_20260401_508CO0000000085
Article: 第二十七条(1)2 — 課税価格の総額 二十万円以下 (¥200,000, inclusive)
Normative unit: NORM|47db57ba8db05d493e7e01968a4971d23ac9e1b03d347102d9459e0d272b05eb

The implementation uses `price ≤ dutyFreePriceCeilingYen`. The independent spec
uses successor-strict membership `price < Nat.succ dutyFreePriceCeilingYen` — a
distinct formulation. The kernel proves equivalence for ALL prices, axiom-free
via core Nat lemmas.

Boundary theorems: 200,000 qualifies (以下 inclusive); 200,001 fails.

Not modelled: preceding-item exclusion, tax procedure, other items/paragraphs
and other articles.
-/

namespace JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive ceiling. -/
def specWithinDutyFreeThreshold (price : Money) : Prop :=
  price < Nat.succ dutyFreePriceCeilingYen

/-- Equivalence for all prices. Universal, kernel-checked, axiom-free. -/
theorem agree_duty_free_threshold (price : Money) :
    withinDutyFreeThreshold price ↔ specWithinDutyFreeThreshold price := by
  unfold withinDutyFreeThreshold specWithinDutyFreeThreshold
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- 二十万円 (200,000) itself qualifies (以下 inclusive). -/
theorem at_ceiling : withinDutyFreeThreshold 200_000 := by
  unfold withinDutyFreeThreshold dutyFreePriceCeilingYen
  decide

/-- 200,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinDutyFreeThreshold 200_001 := by
  unfold withinDutyFreeThreshold dutyFreePriceCeilingYen
  decide

end JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold
