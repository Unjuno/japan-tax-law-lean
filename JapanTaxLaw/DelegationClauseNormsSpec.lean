/-\!
# DelegationClauseNormsSpec — 独立形式仕様

pinned 原文（委任規定「…で定める」）から独立。実装を import しない。
委任内容・他法令との関係は NOT MODELLED。
-/
namespace JapanTaxLaw.DelegationClauseNormsSpec

def delegatesSpec (source target subject : Nat) : Prop := source != target

end JapanTaxLaw.DelegationClauseNormsSpec
