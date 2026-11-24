import JapanTaxLaw.TreasuryCollectionNet

/-!
# TreasuryCollectionNet spec — independent restatement of the art. 14 net amount
Sources (pinned): law 329AC0000000036, revision 329AC0000000036_20240101_431AC0000000003, art. 14(1).
Normative id: NORM|fb11fb27038e069e40cf5a7335a457a5e159a7acf4f6c409f65a67d3b31a8a1b
Independent restatement: the amount is the residual of receipts after
refunds, written with an explicit non-positive guard; the implementation
uses min and conditional subtraction. Agreement on the kernel-decided grid
is checked, not assumed.
-/

namespace JapanTaxLaw.TreasuryCollectionNet

def specNetAmount (collected : Nat) (refunds : Nat) : Nat :=
  if collected <= refunds then 0 else collected - refunds

example : specNetAmount 100 40 = 60 := by decide
example : specNetAmount 100 150 = 0 := by decide

def agreeTreasuryCollectionNet : Bool :=
  [(0,0), (1,0), (100,0), (100,40), (100,100), (100,150)].all fun x =>
    netCollection x.1 x.2 true == specNetAmount x.1 x.2

example : agreeTreasuryCollectionNet = true := by decide

end JapanTaxLaw.TreasuryCollectionNet
