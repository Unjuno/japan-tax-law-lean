import JapanTaxLaw.StampExchangeFee

/-!
# StampExchangeFee spec — 印紙税法施行規則 art.9 の独立整数定式
Sources (pinned): law 415M60000008069, revision 415M60000008069_20191001_501M60000008047.
Independent restatement: amount<10 → amount/2、それ以外 → 5×sheets。
-/

namespace JapanTaxLaw.StampExchangeFee

def specFee (sheets amount : Nat) : Nat :=
  if amount < 10 then amount / 2 else 5 * sheets

example : specFee 1 9 = 4 := by decide
example : specFee 1 10 = 5 := by decide

def agreeStampExchangeFee : Bool :=
  [ (1,0), (1,5), (1,9), (1,10), (3,10), (2,8), (5,100) ].all fun (s,a) =>
    exchangeFee s a == specFee s a

example : agreeStampExchangeFee = true := by decide

end JapanTaxLaw.StampExchangeFee
