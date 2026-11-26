import JapanTaxLaw.ExcessFinanceGrant75Cap

/-!
# ExcessFinanceGrant75Cap spec — independent restatement of the art. 31 75%-with-cap rule
Sources (pinned): law 431AC0000000004, revision 431AC0000000004_20260401_508AC0000000002, art. 31(5)(4).
Normative id: NORM|329dfc7dbb7c019197e3e433ac1da86b5e41b6ce06202825fa1a54e2bd838e0a
Independent restatement: the 75/100 rate and the residual cap are expressed
with min and a guarded subtraction, whereas the implementation uses a
conditional comparison and saturating subtraction. Agreement is kernel-decided.
-/

namespace JapanTaxLaw.ExcessFinanceGrant75Cap

def specCappedGrant (baseGrant : Nat) (priorLimits : Nat) (excess : Nat) : Nat :=
  let raw := baseGrant * 75 / 100
  let residual := excess - (if priorLimits < excess then priorLimits else excess)
  if raw <= residual then raw else residual

example : specCappedGrant 100 0 1000 = 75 := by decide
example : specCappedGrant 100 40 100 = 60 := by decide

def agreeExcessFinanceGrant75Cap : Bool :=
  [(0,0,0), (1,0,0), (74,0,1000), (75,0,1000), (76,0,1000),
   (99,0,1000), (100,0,1000), (100,40,100), (100,40,200),
   (100,200,100)].all fun x =>
    cappedGrant x.1 x.2.1 x.2.2 == specCappedGrant x.1 x.2.1 x.2.2

example : agreeExcessFinanceGrant75Cap = true := by decide

end JapanTaxLaw.ExcessFinanceGrant75Cap
