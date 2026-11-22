import JapanTaxLaw.TaxFinance

/-!
# EligibleDependentAge70 — 所得税法 art. 2（控除対象扶養親族の年齢七十歳以上）

Sources (pinned):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Pinned 原文: 「控除対象扶養親族のうち、年齢七十歳以上の者をいう。」

Scoped claim: only the age-70 threshold for 控除対象扶養親族; the dependency status itself is caller-established.
-/

namespace JapanTaxLaw.EligibleDependentAge70

def eligibleAge : Nat := 70

def isEligibleDependent (age : Nat) : Bool :=
  decide (70 <= age)

theorem threshold_value : eligibleAge = 70 := rfl

end JapanTaxLaw.EligibleDependentAge70
