import JapanTaxLaw.LocalTaxCapitalOverFiveBillion

/-!
# LocalTaxCapitalOverFiveBillionSpec — independent spec for 地方税法 第五十二条(1)五

Law id: 325AC0000000226 (地方税法, Act)
Revision: 325AC0000000226_20261101_508AC0000000002
Article: 第五十二条(1)五 — 資本金等の額 五十億円を超える (strict > ¥5,000,000,000, no upper bound)
Normative unit: NORM|7ad4bd2c2491460ddfddc4cf486a3f14e5d327ee265c5435e097fb7417198ff4

The implementation uses `capitalThresholdYen < capital`. The independent spec
uses the inclusive-≤ complement `¬ capital ≤ capitalThresholdYen` — a distinct
formulation. The kernel proves equivalence for ALL capital, axiom-free via
core Nat lemmas.

Boundary theorems: exactly ¥5,000,000,000 fails (超える = strict); ¥5,000,000,001 qualifies.
No upper bound is modeled (faithful to source).

Not modelled: other categories (二/三/四), tax computation, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalTaxCapitalOverFiveBillion

open JapanTaxLaw.TaxFinance

/-- Independent spec: strict > expressed as not-≤. -/
def specExceedsCapitalThreshold (capital : Money) : Prop :=
  ¬ capital ≤ capitalThresholdYen

/-- Equivalence for all capital. Universal, kernel-checked, axiom-free. -/
theorem agree_exceeds_capital (capital : Money) :
    exceedsCapitalThreshold capital ↔ specExceedsCapitalThreshold capital := by
  unfold exceedsCapitalThreshold specExceedsCapitalThreshold
  exact Nat.not_le.symm

/-- Exactly ¥5,000,000,000 does NOT qualify (strict 超える). -/
theorem at_threshold : ¬ exceedsCapitalThreshold 5_000_000_000 := by
  unfold exceedsCapitalThreshold capitalThresholdYen
  decide

/-- ¥5,000,000,001 qualifies. -/
theorem above_threshold : exceedsCapitalThreshold 5_000_000_001 := by
  unfold exceedsCapitalThreshold capitalThresholdYen
  decide

end JapanTaxLaw.LocalTaxCapitalOverFiveBillion
