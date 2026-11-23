/-\!
# TreatyJPUSArtistesAthletesSpec — 独立形式仕様

条約第十六条の原文から独立。実装を import しない。
具体的な金額・契約・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSArtistesAthletesSpec

def sourceTaxIfExceeds10000Spec (g : Nat) : Bool := if 10000 < g then true else false
def attributionExceptionSpec (a d : Bool) : Bool := a && !d

end JapanTaxLaw.TreatyJPUSArtistesAthletesSpec
