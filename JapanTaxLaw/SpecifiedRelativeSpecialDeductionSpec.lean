import JapanTaxLaw.SpecifiedRelativeSpecialDeduction

/-!
# SpecifiedRelativeSpecialDeductionSpec — 独立定式（所得税法 84の2）

Sources (pinned; identical to impl): law 340AC0000000033,
revision 340AC0000000033_20261001_507AC0000000070.

Independent restatements (different multiplication order / explicit bands):

  * specRound e = 100000 * ((e + 80000) / 100000) - 80000   (e >= 20000)
  * specDeduction uses an explicit 4-band match instead of nested ifs.

各 agree* は decide による有限点の一致確認であり、法的意味の等価証明ではない。
年齢・該当性・適用除外は NOT MODELLED / caller-established。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def specRelativeRound (excess : Money) : Money :=
  100_000 * ((excess + 80_000) / 100_000) - 80_000

def specRelativeDeduction (income : Money) : Money :=
  if income ≤ 850_000 then 630_000
  else if income ≤ 1_150_000 then 630_000 - specRelativeRound ((income - 840_001) * 2)
  else if income ≤ 1_200_000 then 60_000
  else 30_000

def agreeFloor : Bool := specialRelativeRound 20_000 == specRelativeRound 20_000
def agreeMid : Bool := specialRelativeRound 619_998 == specRelativeRound 619_998
def agreeBelow : Bool := specialRelativeRound 19_999 == specRelativeRound 19_999
def agreeAt850 : Bool := specifiedRelativeSpecialDeduction 850_000 == specRelativeDeduction 850_000
def agreeAbove850 : Bool := specifiedRelativeSpecialDeduction 850_001 == specRelativeDeduction 850_001
def agreeAt1150 : Bool := specifiedRelativeSpecialDeduction 1_150_000 == specRelativeDeduction 1_150_000
def agreeAbove1150 : Bool := specifiedRelativeSpecialDeduction 1_150_001 == specRelativeDeduction 1_150_001
def agreeOdd : Bool := specifiedRelativeSpecialDeduction 999_999 == specRelativeDeduction 999_999

example : agreeFloor = true := by decide
example : agreeMid = true := by decide
example : agreeBelow = true := by decide
example : agreeAt850 = true := by decide
example : agreeAbove850 = true := by decide
example : agreeAt1150 = true := by decide
example : agreeAbove1150 = true := by decide
example : agreeOdd = true := by decide

end JapanTaxLaw
