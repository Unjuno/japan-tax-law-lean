/-\!
# DelegationRefsAndWaiversSpec — 独立形式仕様

pinned 原文（委任・参照・免除・両罰の残り 1573条片）から独立に読み取った仕様。
実装を import しない。

委任・参照の内容は外部が与える。施行特例は trigger <= date で適用。
両罰は行為者と法人の刑の連言。免除は「やむを得ない事情」が認められた場合にのみ
書類添付要件を解除する。具体的な内容・日付・刑・理由は NOT MODELLED。
-/
namespace JapanTaxLaw.DelegationRefsAndWaiversSpec

def delegatedSpec (c : Nat) : Nat := c
def refSpec (t : Nat) : Nat := t
def appliesFromSpec (d t : Nat) : Prop := t <= d
def dualSpec (a c : Nat) : Prop := a > 0 ∧ c > 0
def documentSpec (recognizedReason : Bool) : Bool := !recognizedReason

end JapanTaxLaw.DelegationRefsAndWaiversSpec
