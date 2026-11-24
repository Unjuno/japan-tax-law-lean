/-\!
# DateSettingNormsSpec — 独立形式仕様

原文（期日・期間設定）から独立。実装を import しない。
-/
namespace JapanTaxLaw.DateSettingNormsSpec

def fixedDateSpec (ordinal : Nat) : Nat := ordinal
def byDeadlineSpec (day limit : Nat) : Bool := day <= limit
def expiryFromSpec (start duration : Nat) : Nat := start + duration

end JapanTaxLaw.DateSettingNormsSpec
