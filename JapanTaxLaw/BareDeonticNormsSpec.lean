/-\!
# BareDeonticNormsSpec — 独立形式仕様

pinned 原文（なければならない／できる／できない）から独立。実装を import しない。
命題 P の実質的内容は NOT MODELLED。
-/
namespace JapanTaxLaw.BareDeonticNormsSpec

def RequiredSpec (P : Prop) : Prop := P
def PermittedSpec (P : Prop) : Prop := P
def ProhibitedSpec (P : Prop) : Prop := ¬ P

end JapanTaxLaw.BareDeonticNormsSpec
