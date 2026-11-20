/-!
# DefaultBranchesSpec — 独立形式仕様

pinned 原文（「〜に掲げる場合以外の場合」23変形）から独立に読み取った仕様。
実装を import しない。

「列挙された場合以外」= 列挙数 n に対するケース c の補集合（n <= c）。
列挙された場合の実質内容は原文片にないため NOT MODELLED。
-/
namespace JapanTaxLaw.DefaultBranchesSpec

def otherSpec (n c : Nat) : Prop := n <= c

end JapanTaxLaw.DefaultBranchesSpec
