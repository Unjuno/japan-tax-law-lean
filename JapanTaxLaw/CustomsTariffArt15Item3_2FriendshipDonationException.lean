import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt15Item3_2FriendshipDonationException — EXCEPTION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|d011e614a03497e2c28ed8b22911fe049188cc6a019accc9f787be24f45373bc
  Source path: LawBody[1]/MainProvision/MainProvision[28]/Article:15/Article#15/Paragraph#1/Item#3_2/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前三号に該当するものを除き、国際親善のため、国又は地方公共団体にその用に供するものとして寄贈される物品」

Norm kind: EXCEPTION (with CONDITION aspect) — goods donated to the State or a
local public body for international friendship qualify, except goods falling
under the preceding three items. The computable slice models the item
selection with the three-item carve-out and the donee-class selection.
The statutory quote above is byte-verbatim from the pinned source; English
prose here is descriptive only.

Variable contract (meaning / domain / type):
  Item : Type — item1, item2, item3 (excluded), item3_2, other.
  Donee : Type — stateOrLocalPublicBody, other.
  qualifies : Item -> Donee -> Prop — item3_2 with a public-body donee.
  No numeric amount/rate applies (structural classification). Actual donation
  eligibility and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException

/-- Items under Article 15(1); the first three are carved out. -/
inductive Item : Type
  | item1 : Item
  | item2 : Item
  | item3 : Item
  | item3_2 : Item
  | other : Item

/-- The donee classes relevant to the item. -/
inductive Donee : Type
  | stateOrLocalPublicBody : Donee
  | other : Donee

/-- The qualifying case: item3_2 with a public-body donee. -/
def qualifies (item : Item) (donee : Donee) : Prop :=
  item = Item.item3_2 /\ donee ≠ Donee.other

/-- Item3_2 with a public-body donee qualifies. -/
theorem item3_2_public_qualifies : qualifies Item.item3_2 Donee.stateOrLocalPublicBody := by
  unfold qualifies
  constructor
  · rfl
  · intro h
    cases h

/-- The first carved-out item does not qualify. -/
theorem item1_excluded : ¬ qualifies Item.item1 Donee.stateOrLocalPublicBody := by
  unfold qualifies
  intro h
  cases h.1

/-- The second carved-out item does not qualify. -/
theorem item2_excluded : ¬ qualifies Item.item2 Donee.stateOrLocalPublicBody := by
  unfold qualifies
  intro h
  cases h.1

/-- The third carved-out item does not qualify. -/
theorem item3_excluded : ¬ qualifies Item.item3 Donee.stateOrLocalPublicBody := by
  unfold qualifies
  intro h
  cases h.1

/-- A non-public donee does not qualify. -/
theorem other_donee_rejected : ¬ qualifies Item.item3_2 Donee.other := by
  unfold qualifies
  intro h
  exact h.2 rfl

end JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException
