import JapanTaxLaw.TaxFinance

/-!
# CourseHoursThreshold — 法人税法施行規則 art. 7（六十時間以上の授業時間数）

Sources (pinned):

  Law id: 340M50000040012
  Revision: 340M50000040012_20261001_505M60000040013
  Raw snapshot: data/raw/340M50000040012_20261001_505M60000040013.law.json

Pinned 原文: 「六十時間以上」

Scoped claim: only the 60-hour annual course-hours threshold comparison.
Which courses qualify and the other conditions in art. 7 are caller-established.
-/

namespace JapanTaxLaw.CourseHoursThreshold

def annualHoursThreshold : Nat := 60

def meetsAnnualHours (hours : Nat) : Bool :=
  decide (annualHoursThreshold <= hours)

theorem threshold_value : annualHoursThreshold = 60 := rfl

end JapanTaxLaw.CourseHoursThreshold
