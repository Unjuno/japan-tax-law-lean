import JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods

/-!
# CustomsTariffArt3_2ZeroRateAndExemptGoodsSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.3の2(2) item1 REFERENCE 「この法律その他関税に関する法律の規定により関税の率が無税とされている貨物及び関税が免除される貨物」.
Normative unit: NORM|3860b04f653665e60dc8012064fa44884eddeb064ba1d0724372454c2946bb5a

The implementation returns True/False per case; the spec states membership as
a Prop disequality from the unrelated class, representationally distinct.
Equivalence is proved by cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: actual goods lists, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods

/-- Independent spec: the class is not the unrelated class. -/
def SpecInScope (g : GoodClass) : Prop :=
  g ≠ GoodClass.other

/-- The implementation and spec agree. -/
theorem scope_spec_agreement (g : GoodClass) : inScope g ↔ SpecInScope g := by
  cases g with
  | zeroRate =>
      constructor
      · intro h
        intro h'
        cases h'
      · intro h
        trivial
  | exempt =>
      constructor
      · intro h
        intro h'
        cases h'
      · intro h
        trivial
  | other =>
      constructor
      · intro h
        cases h
      · intro h
        exact (h rfl).elim

end JapanTaxLaw.CustomsTariffArt3_2ZeroRateAndExemptGoods
