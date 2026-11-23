/-\!
# DelegatedCategoryAndPublicationNormsSpec — 独立形式仕様

pinned 原文（委任区分・告示）から独立。実装を import しない。
委任された具体的区分・公示対象内容は NOT MODELLED。
-/
namespace JapanTaxLaw.DelegatedCategoryAndPublicationNormsSpec

def delegatedCategorySpec (s d : Nat) : Prop := s != d
def publishesSpec (designated published : Bool) : Bool := designated

end JapanTaxLaw.DelegatedCategoryAndPublicationNormsSpec
