/-\!
# SavingsClauseNormsSpec — 独立形式仕様

pinned 原文（経過措置「なおその効力を有する。」）から独立。実装を import しない。
具体的な規定・移行日は NOT MODELLED。
-/
namespace JapanTaxLaw.SavingsClauseNormsSpec

def inForceSpec (repealed saved : Bool) : Bool := if (!repealed || saved) then true else false

end JapanTaxLaw.SavingsClauseNormsSpec
