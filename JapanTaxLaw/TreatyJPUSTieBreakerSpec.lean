/-\!
# TreatyJPUSTieBreakerSpec — 独立形式仕様

pinned 原文（日米租税条約 第四条３、L3 別層）から独立に読み取った仕様。
実装を import しない。具体的な居住事実は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSTieBreakerSpec

inductive State where | jp | us deriving DecidableEq

def firstSome (xs : List (Option State)) : Option State :=
  match xs with
  | [] => none
  | some s :: _ => some s
  | none :: rest => firstSome rest

def dualSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.TreatyJPUSTieBreakerSpec
