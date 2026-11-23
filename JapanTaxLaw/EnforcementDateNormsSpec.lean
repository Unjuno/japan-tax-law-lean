/-\!
# EnforcementDateNormsSpec — 独立形式仕様

pinned 原文（施行日「…から施行する。」）から独立。実装を import しない。
具体的な日付値は NOT MODELLED。
-/
namespace JapanTaxLaw.EnforcementDateNormsSpec

def isEffectiveSpec (now d : Nat) : Bool := if d <= now then true else false

end JapanTaxLaw.EnforcementDateNormsSpec
