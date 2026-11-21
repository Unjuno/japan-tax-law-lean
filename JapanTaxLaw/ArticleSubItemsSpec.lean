/-\!
# ArticleSubItemsSpec — 独立形式仕様

pinned 原文（条の枝番号 4025条片）から独立に読み取った仕様。実装を import しない。

「第X条のY」は（条番号 X, 枝番号 Y）の序数対。ラベルは構造宣言としてのみ記録。
条の実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.ArticleSubItemsSpec

def subItemSpec (a b : Nat) : Nat × Nat := (a, b)
def labelSpec : Prop := True

end JapanTaxLaw.ArticleSubItemsSpec
