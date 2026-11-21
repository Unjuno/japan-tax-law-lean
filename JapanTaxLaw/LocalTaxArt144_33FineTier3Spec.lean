import JapanTaxLaw.LocalTaxArt144_33FineTier3

/-!
# LocalTaxArt144_33FineTier3Spec — independent spec for 地方税法 第百四十四条の三十三(6)3

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第百四十四条の三十三(6)3 — 罰金 一億円以下 (¥100,000,000, inclusive)
Normative unit: NORM|0959740800d3f276a35a9b6893c69379d386135b93a0cda6a4a877fa425ae308

The implementation uses `fine ≤ maxFineYen`; the independent spec uses the
successor-strict form `fine < Nat.succ maxFineYen`. Kernel proves equivalence
for ALL fines, axiom-free via core Nat lemmas.

Boundary: ¥100,000,000 qualifies (以下 inclusive); ¥100,000,001 fails.
Not modelled: offense conditions, other fine tiers, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier3

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive ceiling. -/
def specWithinFineLimit (fine : Money) : Prop := fine < Nat.succ maxFineYen

/-- Equivalence for all fines. Universal, axiom-free. -/
theorem agree_fine_limit (fine : Money) :
    withinFineLimit fine ↔ specWithinFineLimit fine := by
  unfold withinFineLimit specWithinFineLimit
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- ¥100,000,000 qualifies (以下 inclusive). -/
theorem at_ceiling : withinFineLimit 100_000_000 := by
  unfold withinFineLimit maxFineYen
  decide

/-- ¥100,000,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinFineLimit 100_000_001 := by
  unfold withinFineLimit maxFineYen
  decide

end JapanTaxLaw.LocalTaxArt144_33FineTier3
