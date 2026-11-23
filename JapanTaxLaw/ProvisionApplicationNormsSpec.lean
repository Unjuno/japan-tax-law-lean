/-\!
# ProvisionApplicationNormsSpec — 独立形式仕様

pinned 原文（規定適用「準用する」「適用する」）から独立。実装を import しない。
適用される実質的内容は NOT MODELLED。
-/
namespace JapanTaxLaw.ProvisionApplicationNormsSpec

def appliesSpec (p s : Nat) : Prop := p = s
def mutatisSpec (s t : Nat) : Prop := s != t

end JapanTaxLaw.ProvisionApplicationNormsSpec
