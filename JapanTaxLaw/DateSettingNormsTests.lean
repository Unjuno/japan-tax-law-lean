import JapanTaxLaw.DateSettingNorms
import JapanTaxLaw.DateSettingNormsSpec

/-!
# DateSettingNormsTests — 期日・期間設定
-/
namespace JapanTaxLaw.DateSettingNormsTests
open JapanTaxLaw.DateSettingNorms

theorem fixed_spec (d : DayOrd) : fixedDate d = JapanTaxLaw.DateSettingNormsSpec.fixedDateSpec d := by rfl
theorem deadline_spec (d l : DayOrd) : byDeadline d l = JapanTaxLaw.DateSettingNormsSpec.byDeadlineSpec d l := by rfl
theorem expiry_spec (s d : DayOrd) : expiryFrom s d = JapanTaxLaw.DateSettingNormsSpec.expiryFromSpec s d := by rfl
example (d : DayOrd) : fixedDate d = d := fixed_date_identity d
example (d : Duration) : d >= 0 := duration_nonnegative d
example (l : DayOrd) : byDeadline l l = true := deadline_inclusive l
example (l : DayOrd) : byDeadline (l + 1) l = false := deadline_after l
example (d l delta : DayOrd) (h : d <= l) : byDeadline d (l + delta) = true := deadline_monotone d l delta h
example (s d : DayOrd) : s <= expiryFrom s d := expiry_at_least_start s d
example (s : DayOrd) : expiryFrom s 0 = s := expiry_zero_duration s
example : dateSettingDeclared = true := date_setting_is_declaration

end JapanTaxLaw.DateSettingNormsTests
