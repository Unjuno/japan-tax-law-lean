/-\!
# TransitionalHeadingsAndRefsSpec — 独立形式仕様

pinned 原文（経過措置見出し・かな範囲・項参照 8874条片）から独立に読み取った仕様。
実装を import しない。

見出しは構造宣言。かな範囲はイロハ順の区間 [lo,hi]。項参照と読替接続詞は
参照先/接続対象を外部が与える。実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.TransitionalHeadingsAndRefsSpec

def headingSpec : Prop := True
def rangeSpec (lo hi x : Nat) : Prop := lo <= x ∧ x <= hi
def paragraphSpec (t : Nat) : Nat := t
def connectorSpec (x : Nat) : Nat := x

end JapanTaxLaw.TransitionalHeadingsAndRefsSpec
