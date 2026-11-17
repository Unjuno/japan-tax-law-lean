import JapanTaxLaw.TaxCollectionNextBid

/-!
# TaxCollectionNextBid spec — 国税徴収法 art. 104の2

Pinned: law_id 334AC0000000147 / revision 334AC0000000147_20260525_506AC0000000052.
Independent restatement: 下限 = max(見積, 最高−保証金)、適格 = 最高未満かつ下限以上。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def specNextBidFloor (estimate highest deposit : Money) : Money :=
  if estimate ≤ highest - deposit then highest - deposit else estimate

def specNextBidEligible (estimate highest deposit bid : Money) : Bool :=
  decide (bid < highest && specNextBidFloor estimate highest deposit ≤ bid)

example : specNextBidFloor 1_000_000 2_000_000 200_000 = 1_800_000 := by decide
example : specNextBidEligible 1_000_000 2_000_000 200_000 1_900_000 = true := by decide
example : specNextBidEligible 1_000_000 2_000_000 200_000 2_000_000 = false := by decide

def agreeTaxCollectionNextBid : Bool :=
  [ (1_000_000, 2_000_000, 200_000),
    (1_900_000, 2_000_000, 200_000),
    (100_000, 200_000, 300_000),
    (0, 0, 0) ].all fun (e, h, d) =>
    nextBidFloor e h d == specNextBidFloor e h d
    && [0, 1, 1_700_000, 1_900_000, 2_000_000].all fun bid =>
      nextBidEligible e h d bid == specNextBidEligible e h d bid

example : agreeTaxCollectionNextBid = true := by decide

end JapanTaxLaw
