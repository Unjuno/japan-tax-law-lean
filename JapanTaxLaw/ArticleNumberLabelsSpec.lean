/-\!
# ArticleNumberLabelsSpec — 独立形式仕様

pinned 原文（条番号ラベル 27338条片）から独立に読み取った仕様。実装を import しない。

「第」+漢数字+「条」は条番号の序数 Nat を与える。ラベルは構造宣言としてのみ記録。
条の実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.ArticleNumberLabelsSpec

def articleOrdinalSpec (n : Nat) : Nat := n
def labelSpec : Prop := True

end JapanTaxLaw.ArticleNumberLabelsSpec
