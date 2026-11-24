import JapanTaxLaw.RateSettingNorms
import JapanTaxLaw.RateSettingNormsSpec

/-!
# RateSettingNormsTests — 税率設定
-/
namespace JapanTaxLaw.RateSettingNormsTests
open JapanTaxLaw.RateSettingNorms

theorem byrate_spec (b n d : Nat) : taxByRate b n d = JapanTaxLaw.RateSettingNormsSpec.taxByRateSpec b n d := by rfl
theorem perunit_spec (q ua : Nat) : taxPerUnit q ua = JapanTaxLaw.RateSettingNormsSpec.taxPerUnitSpec q ua := by rfl
example (n d : Nat) : taxByRate 0 n d = 0 := zero_base_zero_tax n d
example (b d : Nat) (h : 0 < d) : taxByRate b d d = b := rate_one_is_identity b d h
example (ua : Nat) : taxPerUnit 0 ua = 0 := per_unit_zero_quantity ua
example (q ua delta : Nat) : taxPerUnit q ua <= taxPerUnit (q + delta) ua := per_unit_monotone q ua delta
example (b n d : Nat) : taxByRate b n d >= 0 := rate_nonnegative b n d
example (q ua : Nat) : taxPerUnit q ua >= 0 := perunit_nonnegative q ua
example : rateSettingDeclared = true := rate_setting_is_declaration

end JapanTaxLaw.RateSettingNormsTests
