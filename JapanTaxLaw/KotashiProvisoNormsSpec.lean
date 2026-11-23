/-\!
# KotashiProvisoNormsSpec — 独立形式仕様

pinned 原文（但し書例外「但し」）から独立。実装を import しない。
-/
namespace JapanTaxLaw.KotashiProvisoNormsSpec

def ruleWithKotashiSpec (r e : Bool) : Bool := r && !e

end JapanTaxLaw.KotashiProvisoNormsSpec
