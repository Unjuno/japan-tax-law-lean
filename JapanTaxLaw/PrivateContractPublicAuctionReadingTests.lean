import JapanTaxLaw.PrivateContractPublicAuctionReadingSpec

/-
# PrivateContractPublicAuctionReadingTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.PrivateContractPublicAuctionReading

example : asPublicAuction 0 = 1 := by decide
example : asPublicAuction 1 = 1 := by decide
example : asPublicAuction 2 = 2 := by decide
example : asPublicAuction 3 = 3 := by decide
example : specAsPublicAuction 0 = 1 := by decide
example : specAsPublicAuction 1 = 1 := by decide
example : asPublicAuction 0 = specAsPublicAuction 0 := by decide
example : asPublicAuction 1 = specAsPublicAuction 1 := by decide
example (x : Nat) : asPublicAuction x = specAsPublicAuction x := agree_as_public_auction x
example : asPublicAuction 9 = specAsPublicAuction 9 := agree_as_public_auction 9

end JapanTaxLaw.PrivateContractPublicAuctionReading
