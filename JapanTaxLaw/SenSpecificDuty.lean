import JapanTaxLaw.TaxFinance

/-!
# SenSpecificDuty — 71 の 銭単位従量税額規定

Pinned 関税定率法 items state a specific-duty floor of 一平方メートルにつき
一円五二銭 (1 yen 52 sen = 152 sen per square metre). Nat yen cannot express
銭, so the rate is represented in sen and the duty in yen is
`area * senRate / 100`. The ad-valorem comparison and the tariff classification
are caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.SenSpecificDuty

/-- `area` 平方メートル × `senRate` 銭 / 100 = 円（小数点以下切り捨て）。 -/
def senDuty (area senRate : Nat) : Nat := area * senRate / 100

example : senDuty 1 152 = 1 := by decide
example : senDuty 100 152 = 152 := by decide
example : senDuty 0 152 = 0 := by decide

end JapanTaxLaw.SenSpecificDuty
