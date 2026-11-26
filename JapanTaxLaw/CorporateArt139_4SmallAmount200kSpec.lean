import JapanTaxLaw.CorporateArt139_4SmallAmount200k

/-!
# CorporateArt139_4SmallAmount200kSpec — independent typed specification

Pinned source identical to the implementation module (法人税法施行令 art. 139の4).
The cap is restated as a plain `Nat` literal read independently from 「二十万」
and the comparison is expressed in the complementary form (200,000 ≤ amount)
so the spec does not reuse the implementation's `<` predicate.
未満 is exclusive; the boundary 200,000 is false.
-/

namespace JapanTaxLaw.CorporateArt139_4SmallAmount200k

/-- Independent restatement of 「二十万」 (yen). -/
def specCap : Nat := 200000

/-- Independent formulation: not (200,000 ≤ amount). -/
def specIsSmall (amount : Nat) : Bool :=
  if 200000 <= amount then false else true

example : specCap = 200000 := by decide
example : specIsSmall 0 = true := by decide
example : specIsSmall 199_999 = true := by decide
example : specIsSmall 200_000 = false := by decide
example : specIsSmall 200_001 = false := by decide
example : specIsSmall 1_000_000 = false := by decide

/-- Kernel-decided agreement on an enumerated grid (finite, not universal). -/
def agreeCorporateArt139_4SmallAmount200k : Bool :=
  let amounts := [0, 1, 199_999, 200_000, 200_001, 1_000_000]
  (amountCap == specCap) &&
    amounts.all fun a => isSmall a == specIsSmall a

example : agreeCorporateArt139_4SmallAmount200k = true := by decide

end JapanTaxLaw.CorporateArt139_4SmallAmount200k
