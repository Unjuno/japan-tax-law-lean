import JapanTaxLaw.DelinquencyCostNet

/-!
# DelinquencyCostNet spec — independent restatement of the art.22 net miscellaneous income
Sources (pinned): law 329CO0000000051, revision 329CO0000000051_20260401_508CO0000000085, art. 22(1).
Normative id: NORM|430e94d648017dcbea837b0f4a3edd6e3c20e5d00a1451c39d898a61bbb9cc61
Independent restatement: the residual is expressed with an explicit
non-positive guard and subtraction; the implementation adds both receipts
first and then compares. Kernel agreement is decided, never assumed.
-/

namespace JapanTaxLaw.DelinquencyCostNet

def specNet (collected : Nat) (refundCollected : Nat) (paid : Nat) : Nat :=
  let total := collected + refundCollected
  if total <= paid then 0 else total - paid

example : specNet 100 40 60 = 80 := by decide
example : specNet 100 40 140 = 0 := by decide

def agreeDelinquencyCostNet : Bool :=
  [(0,0,0), (1,0,0), (100,0,0), (100,40,0), (100,40,60),
   (100,40,140), (100,40,200), (0,100,100)].all fun x =>
    netMiscIncome x.1 x.2.1 x.2.2 == specNet x.1 x.2.1 x.2.2

example : agreeDelinquencyCostNet = true := by decide

end JapanTaxLaw.DelinquencyCostNet
