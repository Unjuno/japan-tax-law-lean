import JapanTaxLaw.FilingRoute

/-!
# FilingRoute spec — 届出経由機関3種 の独立定式
Sources (pinned): law 328CO0000000028, revision 328CO0000000028_20220401_504CO0000000151.
Independent restatement: 経由 = {税務署長(0),国税局長(1),国税庁長官(2)}、その他(3) 対象外。
-/

namespace JapanTaxLaw.FilingRoute

def specAuthority (a : Nat) : Bool := a == 0 || a == 1 || a == 2

example : specAuthority 0 = true := by decide
example : specAuthority 2 = true := by decide
example : specAuthority 3 = false := by decide

def agreeFilingRoute : Bool :=
  [0, 1, 2, 3, 4].all fun a => isCompetentAuthority a == specAuthority a

example : agreeFilingRoute = true := by decide

end JapanTaxLaw.FilingRoute
