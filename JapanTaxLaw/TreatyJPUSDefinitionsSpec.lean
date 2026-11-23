/-\!
# TreatyJPUSDefinitionsSpec — 独立形式仕様

pinned 原文（日米租税条約 第三条、L3 別層）から独立に読み取った仕様。
実装を import しない。具体的な区分・領域は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSDefinitionsSpec

def personSpec (c : Nat) : Bool := c == 0 || c == 1 || c == 2

def inUSSpec (t : Nat) (excluded : List Nat) : Bool :=
  match excluded with
  | [] => true
  | x :: xs => if t == x then false else inUSSpec t xs

end JapanTaxLaw.TreatyJPUSDefinitionsSpec
