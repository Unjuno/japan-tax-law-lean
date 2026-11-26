import JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationExceptionSpec

/-!
# CustomsTariffArt15Item3_2FriendshipDonationExceptionTests — kernel-checked checks

Verifies EXCEPTION 「前三号に該当するものを除き、国際親善のため、国又は地方公共団体にその用に供するものとして寄贈される物品」: item3_2 qualifies, first three excluded.
-/

namespace JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException

example : qualifies Item.item3_2 Donee.stateOrLocalPublicBody := item3_2_public_qualifies
example : ¬ qualifies Item.item1 Donee.stateOrLocalPublicBody := item1_excluded
example : ¬ qualifies Item.item2 Donee.stateOrLocalPublicBody := item2_excluded
example : ¬ qualifies Item.item3 Donee.stateOrLocalPublicBody := item3_excluded
example : ¬ qualifies Item.item3_2 Donee.other := other_donee_rejected
example : qualifies Item.item3_2 Donee.stateOrLocalPublicBody ↔ SpecQualifies Item.item3_2 Donee.stateOrLocalPublicBody := public_spec_agreement Item.item3_2

end JapanTaxLaw.CustomsTariffArt15Item3_2FriendshipDonationException
