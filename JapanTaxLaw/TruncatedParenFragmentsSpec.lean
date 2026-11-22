/-\!
# TruncatedParenFragmentsSpec — 独立形式仕様

pinned 原文（括弧開始断片）から独立に読み取った仕様。実装を import しない。

括弧開始断片は先頭文字が全角「（」。内容の規範は NOT MODELLED。
-/
namespace JapanTaxLaw.TruncatedParenFragmentsSpec
def startsWithParenSpec (s : String) : Bool := if s.toList.head? == some '（' then true else false
end JapanTaxLaw.TruncatedParenFragmentsSpec
