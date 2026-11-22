/-\!
# ShortLabelFragmentsSpec — 独立形式仕様

pinned 原文（短いラベル片）から独立に読み取った仕様。実装を import しない。

短いラベル片は非空かつ長さ6以下。内容の規範は NOT MODELLED。
-/
namespace JapanTaxLaw.ShortLabelFragmentsSpec

def isShortLabelSpec (s : String) : Bool :=
  s.toList.length > 0 && s.toList.length <= 6

end JapanTaxLaw.ShortLabelFragmentsSpec
