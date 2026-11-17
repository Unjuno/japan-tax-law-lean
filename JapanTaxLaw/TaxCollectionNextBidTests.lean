import JapanTaxLaw.TaxCollectionNextBid

/-!
# TaxCollectionNextBid tests — 国税徴収法 art. 104の2 smoke checks

Pinned: law_id 334AC0000000147 / revision 334AC0000000147_20260525_506AC0000000052.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

example : nextBidFloor 1_000_000 2_000_000 200_000 = 1_800_000 := by decide
example : nextBidFloor 1_900_000 2_000_000 200_000 = 1_900_000 := by decide
example : nextBidFloor 100_000 200_000 300_000 = 100_000 := by decide  -- saturating
example : nextBidEligible 1_000_000 2_000_000 200_000 1_900_000 = true := by decide
example : nextBidEligible 1_000_000 2_000_000 200_000 1_800_000 = true := by decide
example : nextBidEligible 1_000_000 2_000_000 200_000 1_700_000 = false := by decide
example : nextBidEligible 1_000_000 2_000_000 200_000 2_000_000 = false := by decide
example : nextBidEligible 0 0 0 0 = false := by decide

end JapanTaxLaw
