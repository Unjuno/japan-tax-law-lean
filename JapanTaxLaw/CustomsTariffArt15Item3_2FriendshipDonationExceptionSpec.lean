import JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException

/-!
# CustomsTariffArt15Item3_2FriendshipDonationExceptionSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.15(1) EXCEPTION 「前三号に該当するものを除き、国際親善のため、国又は地方公共団体にその用に供するものとして寄贈される物品」.
Normative unit: NORM|d011e614a03497e2c28ed8b22911fe049188cc6a019accc9f787be24f45373bc

The implementation uses an equality plus a disequality; the spec states the
donee part as an equality to the public-body class, representationally
distinct. Equivalence is proved by cases in the kernel. Axiom-free; no
decide/simp/propext.

Not modelled: actual donation eligibility, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException

/-- Independent spec: item3_2 and a public-body donee. -/
def SpecQualifies (item : Item) (donee : Donee) : Prop :=
  item = Item.item3_2 /\ donee = Donee.stateOrLocalPublicBody

/-- The implementation and spec agree for the public-body donee. -/
theorem public_spec_agreement (item : Item) :
    qualifies item Donee.stateOrLocalPublicBody ↔ SpecQualifies item Donee.stateOrLocalPublicBody := by
  constructor
  · intro h
    constructor
    · exact h.1
    · rfl
  · intro h
    constructor
    · exact h.1
    · intro hd
      cases hd

/-- The implementation and spec agree for an other donee. -/
theorem other_spec_agreement (item : Item) :
    qualifies item Donee.other ↔ SpecQualifies item Donee.other := by
  constructor
  · intro h
    exact (h.2 rfl).elim
  · intro h
    cases h.2

end JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException
