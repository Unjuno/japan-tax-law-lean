/-\!
# LapseOfEffectNormsSpec — 独立形式仕様

pinned 原文（効力喪失「…効力を失う。」）から独立。実装を import しない。
-/
namespace JapanTaxLaw.LapseOfEffectNormsSpec

def inEffectSpec (triggered : Bool) : Bool := if triggered then false else true
def rightLostSpec (triggered : Bool) : Bool := triggered

end JapanTaxLaw.LapseOfEffectNormsSpec
