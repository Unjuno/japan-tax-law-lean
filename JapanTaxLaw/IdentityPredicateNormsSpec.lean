/-\!
# IdentityPredicateNormsSpec — 独立形式仕様

pinned 原文（同一性述語 30条片）から独立に読み取った仕様。実装を import しない。

同一性は等価関係、差異はその否定。具体的な比較値は NOT MODELLED。
-/
namespace JapanTaxLaw.IdentityPredicateNormsSpec

def eqSpec (a b : Nat) : Bool := a == b

def neSpec (a b : Nat) : Bool := a != b

end JapanTaxLaw.IdentityPredicateNormsSpec
