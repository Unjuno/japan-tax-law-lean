import JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException

/-!
# DisasterTaxReliefOrderSupplArt2HokkaidoBureauExceptionSpec — independent spec

Law id: 322CO0000000268 (災害被害者租税減免法施行政令), revision from INVENTORY.
附則第二条 table cell EXCEPTION 「東北海運局長（山形県又は秋田県の区域に係る処分等又は申請等に係る場合を除く。）」.
Normative unit: NORM|483362ae8efa29996e865140eaba318b1901fc6c2e58af0a10161d9ec7695684

The implementation uses a Bool function; the spec states the excepted set as a Prop
disjunction, representationally distinct. Axiom-free by rfl/left/right/rcases.

Not modelled: substantive procedures, rest of the table, legal correctness.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException

/-- Independent spec: membership in the excepted prefecture areas. -/
def SpecExcluded (r : Region) : Prop :=
  r = Region.firstPrefecture ∨ r = Region.secondPrefecture

/-- The first listed prefecture satisfies the spec. -/
theorem spec_first : SpecExcluded Region.firstPrefecture := by left; rfl

/-- The second listed prefecture satisfies the spec. -/
theorem spec_second : SpecExcluded Region.secondPrefecture := by right; rfl

/-- Agreement at the first listed prefecture. -/
theorem agree_first :
    (isExcluded Region.firstPrefecture = true) ↔ SpecExcluded Region.firstPrefecture := by
  constructor
  · intro _h
    exact spec_first
  · intro _h
    rfl

/-- Agreement at an other region (not excepted). -/
theorem agree_other :
    (isExcluded Region.other = false) ↔ ¬ SpecExcluded Region.other := by
  constructor
  · intro _h hs
    rcases hs with h | h <;> cases h
  · intro _h
    rfl

end JapanTaxLaw.DisasterTaxReliefOrderSupplArt2HokkaidoBureauException
