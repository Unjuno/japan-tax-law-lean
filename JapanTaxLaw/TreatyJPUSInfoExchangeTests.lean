import JapanTaxLaw.TreatyJPUSInfoExchange
import JapanTaxLaw.TreatyJPUSInfoExchangeSpec

/-!
# TreatyJPUSInfoExchangeTests — 第二十六条（情報交換）
-/
namespace JapanTaxLaw.TreatyJPUSInfoExchangeTests
open JapanTaxLaw.TreatyJPUSInfoExchange

theorem disclose_spec (p : Bool) : mayDisclose p = JapanTaxLaw.TreatyJPUSInfoExchangeSpec.mayDiscloseSpec p := by rfl
theorem duty_spec (o : Bool) : noDutyToProvide o = JapanTaxLaw.TreatyJPUSInfoExchangeSpec.noDutyToProvideSpec o := by rfl
example : exchangeUnbounded = true := exchange_not_limited_by_scope
example : mayDisclose true = true := tax_purpose_may_disclose
example : mayDisclose false = false := unrelated_purpose_no_disclose
example : noDutyToProvide false = true := unobtainable_no_duty
example : noDutyToProvide true = false := obtainable_has_duty
example : infoExchangeDeclared = true := info_exchange_is_declaration

end JapanTaxLaw.TreatyJPUSInfoExchangeTests
