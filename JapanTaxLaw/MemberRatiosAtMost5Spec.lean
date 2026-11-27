import JapanTaxLaw.MemberRatiosAtMost5

/-! # MemberRatiosAtMost5 spec — 両割合5%以下の独立定式 (law 340CO0000000097 / art.155の32)
分母100を揃えた交差乗算で両方の条件を再記述する。 -/

namespace JapanTaxLaw.MemberRatiosAtMost5

def specThresholdNum : Nat := 5
def specRateDen : Nat := 100

def specBothAtMost5 (a b : Nat) : Bool :=
  specRateDen * a <= specThresholdNum * specRateDen &&
  specRateDen * b <= specThresholdNum * specRateDen

example : specBothAtMost5 5 5 = true := by decide
example : specBothAtMost5 5 6 = false := by decide

def agreeMemberRatiosAtMost5 : Bool :=
  [(0,0),(4,5),(5,5),(5,6),(6,5),(6,6),(100,100)].all fun ab =>
    bothAtMost5 ab.1 ab.2 == specBothAtMost5 ab.1 ab.2

example : agreeMemberRatiosAtMost5 = true := by decide

end JapanTaxLaw.MemberRatiosAtMost5
