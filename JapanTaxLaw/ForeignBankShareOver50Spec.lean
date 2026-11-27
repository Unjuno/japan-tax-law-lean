import JapanTaxLaw.ForeignBankShareOver50

/-! # ForeignBankShareOver50 spec — 50%超の独立定式 (law 332CO0000000043 / art.39の17)
「百分の五十」を 50/100 とし、「超える」を `100*r > 50*100` で判定する。 -/

namespace JapanTaxLaw.ForeignBankShareOver50

def specThresholdNum : Nat := 50
def specRateDen : Nat := 100

def specOver50 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specOver50 50 = false := by decide
example : specOver50 51 = true := by decide

def agreeForeignBankShareOver50 : Bool :=
  [0, 49, 50, 51, 100].all fun r => over50 r == specOver50 r

example : agreeForeignBankShareOver50 = true := by decide

end JapanTaxLaw.ForeignBankShareOver50
