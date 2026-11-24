import JapanTaxLaw.TaxFinance

/-!
# InvestigationExtensionSixMonths — 関税定率法 art. 7 extension ceiling

Sources (pinned):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json

Pinned 原文: 「ただし、特別の理由により必要があると認められる場合には、その期間を六月以内に限り延長することができる。」

Scoped claim: only the six-month upper bound on the extension of the
investigation period. The existence of 特別の理由, the length of the original
period and the decision to extend are caller-established facts.
-/

namespace JapanTaxLaw.InvestigationExtensionSixMonths

/-- Six months, as counted in whole months. -/
def maxExtensionMonths : Nat := 6

/-- Whether an extension of `months` whole months is within the ceiling. -/
def withinExtension (months : Nat) : Bool :=
  decide (months <= maxExtensionMonths)

theorem cap_value : maxExtensionMonths = 6 := rfl

end JapanTaxLaw.InvestigationExtensionSixMonths
