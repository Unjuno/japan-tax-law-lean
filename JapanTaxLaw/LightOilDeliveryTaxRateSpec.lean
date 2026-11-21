import JapanTaxLaw.LightOilDeliveryTaxRate

/-!
# LightOilDeliveryTaxRateSpec — independent spec for 地方税法 第百四十四条の十

Law id: 325AC0000000226 (地方税法, Act), revision 325AC0000000226_20261101_508AC0000000002
Article: 第百四十四条の十 — 軽油引取税 ¥15,000 per kilolitre
Normative unit: NORM|1f1e4ed103a791c1b9d4b42f6e04fe784e392a84286e09d3396eba710c8773e2

The implementation uses multiplication `rate * kilolitres`. The independent
spec accumulates ¥15,000 by repeated addition via `Nat.rec` over kilolitres —
a genuinely distinct formulation. The kernel proves agreement for ALL counts
by induction, axiom-free via core Nat lemmas.

Not modelled: fractional kilolitres, exemptions, tax base, other paragraphs/articles.
-/

namespace JapanTaxLaw.LightOilDeliveryTaxRate

open JapanTaxLaw.TaxFinance

/-- Independent spec: ¥15,000 accumulated once per kilolitre. -/
def specTaxYen (kilolitres : Money) : Money :=
  Nat.rec 0 (fun _ acc => acc + rateYenPerKilolitre) kilolitres

/-- rate * k equals k accumulations of rate. Axiom-free induction. -/
theorem mul_eq_accumulate (k : Money) :
    rateYenPerKilolitre * k = Nat.rec 0 (fun _ acc => acc + rateYenPerKilolitre) k := by
  induction k with
  | zero => rfl
  | succ k ih =>
      rw [Nat.mul_succ, ih]

/-- Implementation and spec agree for all kilolitres. -/
theorem agree_tax (kilolitres : Money) :
    taxYen kilolitres = specTaxYen kilolitres := by
  unfold taxYen specTaxYen
  exact mul_eq_accumulate kilolitres

end JapanTaxLaw.LightOilDeliveryTaxRate
