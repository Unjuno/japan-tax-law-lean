/-\!
# TreatyJPUSScopeSpec — 独立形式仕様（条約第一条）

pinned 原文（日米租税条約 第一条、L3 別層）から独立に読み取った仕様。
実装を import しない。具体的な居住事実・減免額は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSScopeSpec

def scopeSpec (residentJP residentUS : Bool) : Bool :=
  if residentJP then true else if residentUS then true else false

def reliefSpec (relief : Nat) : Nat := relief

end JapanTaxLaw.TreatyJPUSScopeSpec
