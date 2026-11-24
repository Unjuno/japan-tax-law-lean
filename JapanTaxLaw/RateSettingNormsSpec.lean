/-\!
# RateSettingNormsSpec — 独立形式仕様

原文（税率設定）から独立。実装を import しない。
-/
namespace JapanTaxLaw.RateSettingNormsSpec

def taxByRateSpec (base num den : Nat) : Nat := base * num / den
def taxPerUnitSpec (quantity unitAmount : Nat) : Nat := quantity * unitAmount

end JapanTaxLaw.RateSettingNormsSpec
