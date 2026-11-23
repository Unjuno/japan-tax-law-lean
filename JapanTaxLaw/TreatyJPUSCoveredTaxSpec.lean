/-\!
# TreatyJPUSCoveredTaxSpec — 独立形式仕様

pinned 原文（日米租税条約 第二条、L3 別層）から独立に読み取った仕様。
実装を import しない。具体的な租税識別子は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSCoveredTaxSpec

def memberSpec (tax : Nat) (listed : List Nat) : Bool :=
  match listed with
  | [] => false
  | x :: xs => tax == x || memberSpec tax xs

def appliesSpec (listed successor : Bool) : Bool :=
  if listed then true else if successor then true else false

end JapanTaxLaw.TreatyJPUSCoveredTaxSpec
