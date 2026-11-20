import JapanTaxLaw.PerCapitaEqualRate

/-!
# PerCapitaEqualRateSpec — independent typed specification

Pinned source is identical to `PerCapitaEqualRate.lean` (art. 38 of 地方税法).

The statutory amount is restated as a plain `Nat` literal read independently
from 「千円」 = 1000; the multiplication order is commuted relative to the
implementation (`1000 * persons` vs `persons * standardRate`). Agreement is
checked on a finite grid by kernel `decide` and is NOT a universal claim.

All scope boundaries of the implementation apply here too.
-/

namespace JapanTaxLaw.PerCapitaEqualRate

/-- Independent restatement of 「千円」 (yen, Nat). -/
def specRateYen : Nat := 1000

/-- Independent restatement; multiplication order commuted. -/
def specChargeYen (persons : Nat) : Nat := 1000 * persons

example : specRateYen = 1000 := by decide
example : specChargeYen 0 = 0 := by decide
example : specChargeYen 1 = 1000 := by decide
example : specChargeYen 11 = 11_000 := by decide
example : specChargeYen 12 = 12_000 := by decide
example : specChargeYen 13 = 13_000 := by decide

/-- Kernel-decided agreement on the enumerated grid (finite, not universal). -/
def agreePerCapitaEqualRate : Bool :=
  let persons := [0, 1, 2, 11, 12, 13, 100]
  (standardRate == specRateYen) &&
    persons.all fun n => standardCharge n == specChargeYen n

example : agreePerCapitaEqualRate = true := by decide

end JapanTaxLaw.PerCapitaEqualRate
