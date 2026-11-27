import JapanTaxLaw.ForeignRelatedCorpTaxRate20

/-! # ForeignRelatedCorpTaxRate20 spec — 20%以上の独立定式 (law 332AC0000000026 / art.40の7)
「百分の二十」を 20/100 とし、「以上」を `100*r >= 20*100` で判定する。 -/

namespace JapanTaxLaw.ForeignRelatedCorpTaxRate20

def specThresholdNum : Nat := 20
def specRateDen : Nat := 100

def specAtLeast20 (rate : Nat) : Bool :=
  specRateDen * rate >= specThresholdNum * specRateDen

example : specAtLeast20 19 = false := by decide
example : specAtLeast20 20 = true := by decide

def agreeForeignRelatedCorpTaxRate20 : Bool :=
  [0, 19, 20, 21, 50, 100].all fun r => atLeast20 r == specAtLeast20 r

example : agreeForeignRelatedCorpTaxRate20 = true := by decide

end JapanTaxLaw.ForeignRelatedCorpTaxRate20
