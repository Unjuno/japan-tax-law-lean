import JapanTaxLaw.AuctionDepositValuation

/-!
# AuctionDepositValuation spec — 国税徴収法施行令 art.42の5 の独立整数定式

Sources (pinned): law 334CO0000000329, revision 334CO0000000329_20260525_507CO0000000244.
Independent restatement: 「五十万円」= 500,000.
-/

namespace JapanTaxLaw.AuctionDepositValuation

def specThreshold : Nat := 500_000
example : specThreshold = 500_000 := by decide

def agreeAuctionDepositValuation : Bool := threshold == specThreshold
example : agreeAuctionDepositValuation = true := by decide

end JapanTaxLaw.AuctionDepositValuation
