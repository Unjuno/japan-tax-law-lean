import JapanTaxLaw.OkinawaExamPass

/-!
# OkinawaExamPass spec — 沖縄特例試験 合格基準 の独立整数定式
Sources (pinned): law 347M50000040044, revision 347M50000040044_19740711_349M50000040044.
Independent restatement: 総点数の 60% 以上、各科目 満点の 40% 未満でない。
-/

namespace JapanTaxLaw.OkinawaExamPass

def specMeets (total score : Nat) : Bool := score * 100 >= total * 60
def specBelow (full score : Nat) : Bool := score * 100 < full * 40

example : specMeets 100 60 = true := by decide
example : specBelow 100 39 = true := by decide

def agreeOkinawaExamPass : Bool :=
  [ (100,0), (100,39), (100,40), (100,59), (100,60), (100,100), (1000,600) ].all fun (t,s) =>
    meetsTotalThreshold t s == specMeets t s
  && [ (100,0), (100,39), (100,40), (100,100) ].all fun (f,s) =>
    belowSubjectFloor f s == specBelow f s

example : agreeOkinawaExamPass = true := by decide

end JapanTaxLaw.OkinawaExamPass
