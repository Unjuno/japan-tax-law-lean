import JapanTaxLaw.TaxAccountantFineLimit

/-!
# TaxAccountantFineLimitSpec — independent spec for 税理士法 第六十一条(1)

Law id: 326AC1000000237 (税理士法, Act)
Revision: 326AC1000000237_20251001_505AC0000000053
Article: 第六十一条(1) — 百万円以下の罰金 (fine ≤ ¥1,000,000)
Normative unit: NORM|b184122a9d2a8592751ebeb1a6872fbc6be6328b78f6a6febe1119ff04f6dc67

The implementation uses `fine ≤ maxFineYen`. The independent spec uses
successor-strict membership `fine < Nat.succ maxFineYen` — a distinct
formulation. The kernel proves equivalence for ALL fines, axiom-free via core
Nat lemmas.

Boundary theorems: 1,000,000 qualifies (以下 inclusive); 1,000,001 fails.
The ¥1,000,000 constant is derived programmatically from the verbatim needle.

Not modelled: violation conditions (各号 / 第五十三条), other paragraphs and articles.
-/

namespace JapanTaxLaw.TaxAccountantFineLimit

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

/-- 百万円 (1,000,000) itself qualifies (以下 inclusive). -/
theorem at_ceiling : withinFineLimit 1_000_000 := by
  unfold withinFineLimit maxFineYen
  decide

/-- 1,000,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinFineLimit 1_000_001 := by
  unfold withinFineLimit maxFineYen
  decide

/-- Ceiling decoded from 百万円 = 1,000,000. -/
theorem ceiling_decoded : maxFineYen = 1_000_000 := rfl

end JapanTaxLaw.TaxAccountantFineLimit
