import JapanTaxLaw.GolfCourseUseTaxStandardRate

/-!
# GolfCourseUseTaxStandardRateSpec — independent spec for 地方税法 第七十六条(1)

Law id: 325AC0000000226 (地方税法, Act)
Revision: 325AC0000000226_20261101_508AC0000000002
Article: 第七十六条(1) — ゴルフ場利用税の標準税率, 一人一日につき八百円
Normative unit: NORM|f345a99128087aed87634e8963422db557c8f7daa6b17adec119fe0aceb3cdfa

The implementation uses multiplication `800 * people * days`. The independent
spec accumulates ¥800 by repeated addition via `Nat.rec` over `people * days`
units (person-days) — a genuinely distinct formulation. The kernel proves they
agree for ALL people/days by induction (no axioms).

Not modelled: tax base, rate-setting procedure, exemptions, local rate variation,
other paragraphs and other articles. 標準税率 is a benchmark rate, not asserted
as the actual municipal rate.
-/

namespace JapanTaxLaw.GolfCourseUseTaxStandardRate

open JapanTaxLaw.TaxFinance

/-- Independent spec: ¥800 accumulated once per person-day (repeated addition). -/
def specTaxYen (people : Money) (days : Money) : Money :=
  Nat.rec 0 (fun _ acc => acc + standardRateYenPerPersonPerDay) (people * days)

/-- 800 * k equals k accumulations of 800. Axiom-free induction. -/
theorem mul_eq_accumulate (k : Money) :
    standardRateYenPerPersonPerDay * k =
      Nat.rec 0 (fun _ acc => acc + standardRateYenPerPersonPerDay) k := by
  induction k with
  | zero => rfl
  | succ k ih =>
      rw [Nat.mul_succ, ih]

/-- Implementation and independent spec agree for all people/days. -/
theorem agree_standard_tax (people : Money) (days : Money) :
    standardTaxYen people days = specTaxYen people days := by
  unfold standardTaxYen specTaxYen
  exact mul_eq_accumulate (people * days)

end JapanTaxLaw.GolfCourseUseTaxStandardRate
