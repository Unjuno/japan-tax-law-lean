import JapanTaxLaw.PublicityMatter

/-!
# PublicityMatter spec — 公示事項=指定日 の独立定式
Sources (pinned): law 341M50000040055, revision 341M50000040055_20260601_508M60000040016.
Independent restatement: 公示事項 = {指定日(0)}、その他(1) 対象外。
-/

namespace JapanTaxLaw.PublicityMatter

def specMatter (m : Nat) : Bool := m == 0

example : specMatter 0 = true := by decide
example : specMatter 1 = false := by decide

def agreePublicityMatter : Bool :=
  [0, 1, 2].all fun m => isPublicityMatter m == specMatter m

example : agreePublicityMatter = true := by decide

end JapanTaxLaw.PublicityMatter
