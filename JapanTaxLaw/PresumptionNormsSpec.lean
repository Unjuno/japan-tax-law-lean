/-\!
# PresumptionNormsSpec — 独立形式仕様

pinned 原文（推定「…ものと推定する」）から独立。実装を import しない。
具体的な base/presumed 事実は NOT MODELLED。
-/
namespace JapanTaxLaw.PresumptionNormsSpec

def presumedSpec (base presumed : Prop) : Prop := base → presumed

end JapanTaxLaw.PresumptionNormsSpec
