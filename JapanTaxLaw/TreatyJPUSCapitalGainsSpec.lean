/-\!
# TreatyJPUSCapitalGainsSpec — 独立形式仕様

条約第十三条の原文から独立。実装を import しない。
具体的な財産・金額・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSCapitalGainsSpec

def gainsTaxableInSourceSpec (immovable : Bool) : Bool := immovable
def isImmovableSpec (art6 share usRPI : Bool) : Bool := art6 || share || usRPI

end JapanTaxLaw.TreatyJPUSCapitalGainsSpec
