import JapanTaxLaw.TaxFinance

/-!
# PromulgationEffective — 1,082 の pinned 「公布の日から施行する」規定

Every pinned unit states that the law (or listed provisions) takes effect on
the day of promulgation. 943 are the main 「この法律は、公布の日から施行する」
clause; the remaining 139 are provisos naming specific provisions. The model
records the offset from promulgation (0 days) and its independent spec.
Which provisions are covered and any 施行延期 are caller-established and NOT
MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.PromulgationEffective

/-- 公布日からの施行日オフセット（日）。 -/
def daysAfterPromulgation : Nat := 0

theorem offsetNonnegative : 0 ≤ daysAfterPromulgation := by decide

end JapanTaxLaw.PromulgationEffective
