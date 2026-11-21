import JapanTaxLaw.TaxJudgeCount

/-!
# TaxJudgeCount spec — 国税審判官定数 の独立整数定式
Sources (pinned): law 345M50000040017, revision 345M50000040017_20260710_508M60000040048.
Independent restatement: 審判官=180, 副審判官=89。
-/

namespace JapanTaxLaw.TaxJudgeCount

def specJudge : Nat := 180
def specDeputy : Nat := 89

example : specJudge = 180 := by decide
example : specDeputy = 89 := by decide

def agreeTaxJudgeCount : Bool := judgeCount == specJudge && deputyJudgeCount == specDeputy

example : agreeTaxJudgeCount = true := by decide

end JapanTaxLaw.TaxJudgeCount
