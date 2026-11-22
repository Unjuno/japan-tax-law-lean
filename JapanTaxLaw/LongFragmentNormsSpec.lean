/-\!
# LongFragmentNormsSpec — 独立形式仕様

pinned 原文（長い未解決断片）から独立に読み取った仕様。実装を import しない。

長い断片は長さが6より大きい（if 形式の独立表現）。内容の規範は NOT MODELLED。
-/
namespace JapanTaxLaw.LongFragmentNormsSpec

def isLongSpec (s : String) : Bool := if 6 < s.length then true else false

end JapanTaxLaw.LongFragmentNormsSpec
