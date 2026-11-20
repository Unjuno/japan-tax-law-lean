/-!
# PerItemEnforcementDatesSpec — 独立形式仕様

pinned 原文（各号に定める日から施行する、二変形）から独立に読み取った仕様。
実装を import しない。

「次の各号に掲げる規定」に該当する号は当該号に定める日、
該当しない号は既定日。各号の日付・号数・既定日は原文片にないため NOT MODELLED。
-/
namespace JapanTaxLaw.PerItemEnforcementDatesSpec

def listedSpec (item count : Nat) : Prop := item < count

def effectiveSpec (item count : Nat) (dates : Nat → Nat) (fallback : Nat) : Nat :=
  if item < count then dates item else fallback

end JapanTaxLaw.PerItemEnforcementDatesSpec
