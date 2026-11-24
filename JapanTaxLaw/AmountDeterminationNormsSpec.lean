/-\!
# AmountDeterminationNormsSpec — 独立形式仕様

原文（金額の確定）から独立。実装を import しない。
-/
namespace JapanTaxLaw.AmountDeterminationNormsSpec

abbrev DeterminationSpec := Nat -> Nat

def determinedAmountSpec (d : DeterminationSpec) (k : Nat) : Nat := d k
def totalAmountSpec (a b : Nat) : Nat := a + b

end JapanTaxLaw.AmountDeterminationNormsSpec
