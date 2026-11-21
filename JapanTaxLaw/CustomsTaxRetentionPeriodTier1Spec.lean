import JapanTaxLaw.CustomsTaxRetentionPeriodTier1

/-!
# CustomsTaxRetentionPeriodTier1Spec — independent spec for 酒税法 附則第八条(3)1

Law id: 328AC0000000006 (酒税法, Act), revision 328AC0000000006_20260525_506AC0000000052
Article: 附則第八条(3)1 — tax amount ≤ ¥100,000 → 2-month retention
Normative unit: NORM|bc51dc849add02245a14da178b3e8f3c6bbe070e2bd6da1783e7593c20b8c4cb

The implementation uses `tax ≤ taxAmountCeilingYen`. The independent spec uses
the successor-strict form `tax < Nat.succ taxAmountCeilingYen` — a distinct
formulation. Kernel proves equivalence for ALL taxes, axiom-free.

Also proves the retention period decodes correctly (2 months).

Boundary: ¥100,000 qualifies (以下 inclusive); ¥100,001 fails.

Not modelled: other tiers, retention procedure, rest of 附則, other articles.
-/

namespace JapanTaxLaw.CustomsTaxRetentionPeriodTier1

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive ceiling. -/
def specWithinTier (tax : Money) : Prop := tax < Nat.succ taxAmountCeilingYen

/-- Equivalence for all taxes. Universal, axiom-free. -/
theorem agree_within_tier (tax : Money) : withinTier tax ↔ specWithinTier tax := by
  unfold withinTier specWithinTier
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- ¥100,000 qualifies (以下 inclusive). -/
theorem at_ceiling : withinTier 100_000 := by
  unfold withinTier taxAmountCeilingYen
  decide

/-- ¥100,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinTier 100_001 := by
  unfold withinTier taxAmountCeilingYen
  decide

/-- The retention period decodes correctly (二月 = 2 months). -/
theorem period_decoded : retentionMonths = 2 := rfl

end JapanTaxLaw.CustomsTaxRetentionPeriodTier1
