import JapanTaxLaw.PatentTransferRatio

/-!
# PatentTransferRatio spec — independent restatement of the art.21_17_2 ratio
Sources (pinned): law 332M50000040015, revision 332M50000040015_20261101_507M60000040026, art. 21_17_2(2).
Normative id: NORM|4eac22eb12ef2a7a84f5379a5e149609fa458fcb98279c2c09fc0f7a9a53e4ed
Independent restatement: the multiplication by (count-1)/count is decomposed
into whole and remainder parts; the implementation uses a single guarded
multiplication/division. Kernel agreement is decided, never assumed.
-/

namespace JapanTaxLaw.PatentTransferRatio

def specRatioAdjusted (amount : Nat) (count : Nat) : Nat :=
  if count = 0 then 0 else
    let whole := (amount / count) * (count - 1)
    let rest := (amount % count) * (count - 1) / count
    whole + rest

example : specRatioAdjusted 100 2 = 50 := by decide
example : specRatioAdjusted 100 4 = 75 := by decide

def agreePatentTransferRatio : Bool :=
  [(0,0), (1,0), (100,0), (100,1), (100,2), (100,3),
   (100,4), (101,2), (101,4)].all fun x =>
    ratioAdjusted x.1 x.2 == specRatioAdjusted x.1 x.2

example : agreePatentTransferRatio = true := by decide

end JapanTaxLaw.PatentTransferRatio
