/-\!
# ScopeMembershipNormsSpec — 独立形式仕様

pinned 原文（範囲帰属）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ScopeMembershipNormsSpec

def inScopeSpec (a s : Nat) : Prop := a = s
def notInScopeSpec (a s : Nat) : Prop := ¬ a = s

end JapanTaxLaw.ScopeMembershipNormsSpec
