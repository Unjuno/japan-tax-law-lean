import JapanTaxLaw.LocalTaxArt144_33FineTier1

/-!
# LocalTaxArt144_33FineTier1Spec — independent spec for 地方税法 第百四十四条の三十三(6)1

Law id: 325AC0000000226 (地方税法, Act)
Revision: 325AC0000000226_20261101_508AC0000000002
Article: 第百四十四条の三十三(6)1 — 罰金 三億円以下 (fine ≤ ¥300,000,000)
Normative unit: NORM|042d10f4f42521d77cc2888f4ef79647deb304ffc5dbcb5e0f0a2440c4d35ce1

The implementation uses `fine ≤ maxFineYen`. The independent spec uses the
successor-strict form `fine < Nat.succ maxFineYen` — a distinct formulation.
The kernel proves equivalence for ALL fines, axiom-free via core Nat lemmas.

Boundary: ¥300,000,000 qualifies (以下 inclusive); ¥300,000,001 fails.

Not modelled: offense conditions, other fine tiers, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier1

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive ceiling. -/
def specWithinFineLimit (fine : Money) : Prop :=
  fine < Nat.succ maxFineYen

/-- Equivalence for all fines. Universal, kernel-checked, axiom-free. -/
theorem agree_fine_limit (fine : Money) :
    withinFineLimit fine ↔ specWithinFineLimit fine := by
  unfold withinFineLimit specWithinFineLimit
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- ¥300,000,000 qualifies (以下 inclusive). -/
theorem at_ceiling : withinFineLimit 300_000_000 := by
  unfold withinFineLimit maxFineYen
  decide

/-- ¥300,000,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinFineLimit 300_000_001 := by
  unfold withinFineLimit maxFineYen
  decide

end JapanTaxLaw.LocalTaxArt144_33FineTier1
