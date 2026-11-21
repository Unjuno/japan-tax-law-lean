import JapanTaxLaw.LocalTaxArt144_33FineTier2

/-!
# LocalTaxArt144_33FineTier2Spec — independent spec for 地方税法 第百四十四条の三十三(6)2

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第百四十四条の三十三(6)2 — 罰金 二億円以下 (¥200,000,000, inclusive)
Normative unit: NORM|64559fa702dfa55d1f28f910d47073c08c936b71fda9e0ef6b3d5695e66e741b

The implementation uses `fine ≤ maxFineYen`; the independent spec uses the
successor-strict form `fine < Nat.succ maxFineYen`. Kernel proves equivalence
for ALL fines, axiom-free via core Nat lemmas.

Boundary: ¥200,000,000 qualifies (以下 inclusive); ¥200,000,001 fails.
Not modelled: offense conditions, other fine tiers, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalTaxArt144_33FineTier2

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

/-- ¥200,000,000 qualifies (以下 inclusive). -/
theorem at_ceiling : withinFineLimit 200_000_000 := by
  unfold withinFineLimit maxFineYen
  decide

/-- ¥200,000,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinFineLimit 200_000_001 := by
  unfold withinFineLimit maxFineYen
  decide

end JapanTaxLaw.LocalTaxArt144_33FineTier2
