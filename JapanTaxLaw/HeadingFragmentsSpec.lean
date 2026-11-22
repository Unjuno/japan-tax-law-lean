/-\!
# HeadingFragmentsSpec — 独立形式仕様

pinned 原文（見出し片）から独立に読み取った仕様。実装を import しない。

見出しは全角括弧で囲まれ内側が非空（長さ3以上）。内容の規範は NOT MODELLED。
-/
namespace JapanTaxLaw.HeadingFragmentsSpec

def isParenthesizedSpec (s : String) : Bool :=
  let cs := s.toList
  cs.length >= 3 && cs.head? == some '（' && cs.getLast? == some '）'

end JapanTaxLaw.HeadingFragmentsSpec
