/-\!
# ShortLabelsAndTermsSpec — 独立形式仕様

pinned 原文（短いラベル・用語 1112条片）から独立に読み取った仕様。実装を import しない。

全角 Latin 文字は a=1 からの序数、ひらがなは五十音順の序数、構造用語は宣言として
のみ記録。実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.ShortLabelsAndTermsSpec

def latinSpec (n : Nat) : Nat := n
def kanaSpec (n : Nat) : Nat := n
def termSpec : Prop := True

end JapanTaxLaw.ShortLabelsAndTermsSpec
