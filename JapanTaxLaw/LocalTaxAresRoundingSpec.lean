import JapanTaxLaw.LocalTaxAresRounding

/-!
# LocalTaxAresRoundingSpec — independent spec for 地方税法 art.180(3)

Law id: 325AC0000000226
Revision: 325AC0000000226_20261101_508AC0000000002
Statutory article: art. 180(3) (端数を百アールとみなす)
Normative unit: NORM|926a979408404763d53009242e359b92c26e5b2abb2ebada6c8ca095f50419db

The implementation uses an `if` on equality with zero. The spec is a structural
pattern match on Nat (`0 → 0`, successor → 100) — a deliberately different
formulation. The kernel proves equivalence for ALL Nat, not a finite sample.

The statutory constant 百アール = 100 is restated by this spec's OWN
`specFractionUnitAres` instead of reusing the implementation's `fractionUnitAres`;
the value is identical. Only the explicit `agree*` comparison / boundary layer
below references implementation definitions.

The statutory domain of the remainder is 0 ≤ r < 100; the theorem is stated
universally because it holds universally, and the legally meaningful subdomain
is recorded in the boundary theorems.

Not modelled: art.180(1) tax-base computation, other articles, 政令 details.
-/

namespace JapanTaxLaw.LocalTaxAresRounding

open JapanTaxLaw.TaxFinance

/-- Spec's own statutory constant: 百アール = 100 ares (art. 180(3)). -/
def specFractionUnitAres : Money := 100

/-- Spec: structural pattern match (zero → 0, any successor → 100). -/
def specDeemed : Money → Money
  | 0 => 0
  | _ + 1 => specFractionUnitAres

/-- Soundness/correspondence for every remainder. Universal, kernel-checked. -/
theorem agree_ares_rounding (remainder : Money) :
    deemedFraction remainder = specDeemed remainder := by
  cases remainder with
  | zero => rfl
  | succ n => simp [deemedFraction, specDeemed, fractionUnitAres, specFractionUnitAres]

/-- Boundary: no fraction yields zero. -/
theorem no_fraction_is_zero : deemedFraction 0 = 0 := rfl

/-- Boundary: the smallest positive fraction (< 100 ares) is deemed 100. -/
theorem smallest_fraction_is_unit : deemedFraction 1 = fractionUnitAres := by decide

/-- Boundary: the largest statutory fraction (99 ares) is deemed 100. -/
theorem largest_fraction_is_unit : deemedFraction 99 = fractionUnitAres := by decide

/-- The deemed fraction never exceeds one unit (within the statutory domain
    and, in fact, for every Nat). -/
theorem deemed_fraction_bounded (r : Money) : deemedFraction r ≤ fractionUnitAres := by
  unfold deemedFraction fractionUnitAres
  split <;> simp

/-- Finite smoke check only; `agree_ares_rounding` is the proof. -/
def agreeLocalTaxAresRounding : Bool :=
  [0, 1, 50, 99, 100].all fun n =>
    deemedFraction n == specDeemed n

example : agreeLocalTaxAresRounding = true := by decide

end JapanTaxLaw.LocalTaxAresRounding
