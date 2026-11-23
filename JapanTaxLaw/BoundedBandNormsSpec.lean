/-\!
# BoundedBandNormsSpec — 独立形式仕様

pinned 原文（区分帯）から独立。実装を import しない。具体的な境界値は NOT MODELLED。
-/
namespace JapanTaxLaw.BoundedBandNormsSpec

def atMostSpec (v u : Nat) : Bool := if v <= u then true else false
def inBandSpec (v lo hi : Nat) : Bool := if lo < v && v <= hi then true else false

end JapanTaxLaw.BoundedBandNormsSpec
