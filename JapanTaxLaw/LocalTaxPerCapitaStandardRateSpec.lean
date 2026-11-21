import JapanTaxLaw.LocalTaxPerCapitaStandardRate

/-!
# LocalTaxPerCapitaStandardRateSpec — independent spec for 地方税法 第三百十条

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第三百十条 — 個人の均等割 standard rate ¥3,000
Normative unit: NORM|6c043582d2da5058b6951c3490ea577d84a5afd9b21669f9a8c4c5d579a77f5e

The implementation uses multiplication `rate * persons`. The independent spec
accumulates ¥3,000 by repeated addition via `Nat.rec` over persons — a distinct
formulation. Kernel proves agreement for ALL counts by induction, axiom-free.

Not modelled: local rate variation, tax base, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalTaxPerCapitaStandardRate

open JapanTaxLaw.TaxFinance

/-- Independent spec: ¥3,000 accumulated once per person. -/
def specTaxYen (persons : Money) : Money :=
  Nat.rec 0 (fun _ acc => acc + standardRateYen) persons

/-- rate * k equals k accumulations of rate. Axiom-free induction. -/
theorem mul_eq_accumulate (k : Money) :
    standardRateYen * k = Nat.rec 0 (fun _ acc => acc + standardRateYen) k := by
  induction k with
  | zero => rfl
  | succ k ih =>
      rw [Nat.mul_succ, ih]

/-- Implementation and spec agree for all persons. -/
theorem agree_tax (persons : Money) :
    standardTaxYen persons = specTaxYen persons := by
  unfold standardTaxYen specTaxYen
  exact mul_eq_accumulate persons

end JapanTaxLaw.LocalTaxPerCapitaStandardRate
