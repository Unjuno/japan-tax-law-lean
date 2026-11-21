import JapanTaxLaw.LocalTaxArt803AdministrativeFine

/-!
# LocalTaxArt803AdministrativeFineSpec — independent spec for 地方税法 第八百三条

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第八百三条 — 過料 十万円以下 (¥100,000, inclusive, administrative fine)
Normative unit: NORM|7b8ad3cf00fe6bc2ee7c9a071318722612356de6b823cf0fbaecdb1cab531ea3

The implementation uses `fine ≤ maxAdministrativeFineYen`; the independent
spec uses the successor-strict form `fine < Nat.succ maxAdministrativeFineYen`.
Kernel proves equivalence for ALL fines, axiom-free via core Nat lemmas.

Boundary: ¥100,000 qualifies (以下 inclusive); ¥100,001 fails.
Not modelled: violation condition (第七百六十七条第二項), sentencing, other articles.
-/

namespace JapanTaxLaw.LocalTaxArt803AdministrativeFine

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive ceiling. -/
def specWithinFineLimit (fine : Money) : Prop := fine < Nat.succ maxAdministrativeFineYen

/-- Equivalence for all fines. Universal, axiom-free. -/
theorem agree_fine_limit (fine : Money) :
    withinFineLimit fine ↔ specWithinFineLimit fine := by
  unfold withinFineLimit specWithinFineLimit
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- ¥100,000 qualifies (以下 inclusive). -/
theorem at_ceiling : withinFineLimit 100_000 := by
  unfold withinFineLimit maxAdministrativeFineYen
  decide

/-- ¥100,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinFineLimit 100_001 := by
  unfold withinFineLimit maxAdministrativeFineYen
  decide

end JapanTaxLaw.LocalTaxArt803AdministrativeFine
