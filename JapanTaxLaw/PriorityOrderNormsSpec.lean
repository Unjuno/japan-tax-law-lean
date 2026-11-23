/-\!
# PriorityOrderNormsSpec — 独立形式仕様

pinned 原文（先順位とする 45条片）から独立に読み取った仕様。実装を import しない。

優先順位は日付キーの辞書順比較。具体的な値・日付は NOT MODELLED。
-/
namespace JapanTaxLaw.PriorityOrderNormsSpec

inductive Rank where | first | tied | last deriving DecidableEq

def keyCompareSpec (a b : Nat) (ascending : Bool) : Rank :=
  if ascending then
    if a < b then .first else if b < a then .last else .tied
  else
    if b < a then .first else if a < b then .last else .tied

def priorityNilSpec : Rank := .tied

end JapanTaxLaw.PriorityOrderNormsSpec
