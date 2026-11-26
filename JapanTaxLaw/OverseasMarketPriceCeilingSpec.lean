import JapanTaxLaw.OverseasMarketPriceCeiling

/-!
# OverseasMarketPriceCeiling spec — independent restatement of the art.2_4 price ceiling
Sources (pinned): law 344M50000040016, revision 344M50000040016_20260401_508M60000040016, art. 2_4(2).
Normative id: NORM|00bb2915da9151a74e59bcebb3940b8cb7f27ba3b99efdfb8bcef1576f1a097c
Independent restatement: the ceiling is expressed as the negation of a
strict excess; the implementation uses a non-strict comparison. Kernel
agreement is decided on the listed grid, never assumed.
-/

namespace JapanTaxLaw.OverseasMarketPriceCeiling

def specWithinCeiling (overseasPrice : Nat) : Bool :=
  not (30000 < overseasPrice)

example : specWithinCeiling 30000 = true := by decide
example : specWithinCeiling 30001 = false := by decide

def agreeOverseasMarketPriceCeiling : Bool :=
  [0, 1, 29999, 30000, 30001, 60000].all fun n =>
    withinCeiling n == specWithinCeiling n

example : agreeOverseasMarketPriceCeiling = true := by decide

end JapanTaxLaw.OverseasMarketPriceCeiling
