/-\!
# OccurrenceDateRefsSpec — 独立形式仕様

原文（発生日の参照）から独立。実装を import しない。
-/
namespace JapanTaxLaw.OccurrenceDateRefsSpec

abbrev OccurrenceMapSpec := Nat -> Nat

def occurrenceDateSpec (m : OccurrenceMapSpec) (e : Nat) : Nat := m e
def datesOrderedSpec (d1 d2 : Nat) : Bool := d1 <= d2
def onOrAfterSpec (day boundary : Nat) : Bool := boundary <= day

end JapanTaxLaw.OccurrenceDateRefsSpec
