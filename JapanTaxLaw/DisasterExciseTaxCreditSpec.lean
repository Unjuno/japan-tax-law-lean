import JapanTaxLaw.DisasterExciseTaxCredit

/-!
# DisasterExciseTaxCredit spec — independent restatement of the art. 7 excise-tax credit
Sources (pinned): law 322AC0000000175, revision 322AC0000000175_20220101_503AC0000000011, art. 7(1).
Normative id: NORM|d595659fb5709f6f1f3a41fb663587388f803cd980d1ede371062ebb1f215def
Independent restatement: the credit is the residual of the excise tax after
compensation when a disaster loss occurred, written with an explicit
non-positive guard; application to a later tax due is the residual after the
credit, also guarded. The implementation uses min and conditional subtraction;
agreement is kernel-decided, not assumed.
-/

namespace JapanTaxLaw.DisasterExciseTaxCredit

def specCredit (taxAmount : Nat) (offset : Nat) (disasterLoss : Bool) : Nat :=
  if !disasterLoss then 0 else if taxAmount <= offset then 0 else taxAmount - offset

def specApplied (taxDueAfter : Nat) (credit : Nat) : Nat :=
  if taxDueAfter <= credit then 0 else taxDueAfter - credit

example : specCredit 100 40 true = 60 := by decide
example : specApplied 50 60 = 0 := by decide

def agreeDisasterExciseTaxCredit : Bool :=
  [(0,0,true), (1,0,true), (100,0,false), (100,40,true),
   (100,100,true), (100,150,true), (50,60,true), (0,10,false)].all fun x =>
    disasterCredit x.1 x.2.1 x.2.2 == specCredit x.1 x.2.1 x.2.2 &&
    appliedCredit x.1 x.2.1 == specApplied x.1 x.2.1

example : agreeDisasterExciseTaxCredit = true := by decide

end JapanTaxLaw.DisasterExciseTaxCredit
