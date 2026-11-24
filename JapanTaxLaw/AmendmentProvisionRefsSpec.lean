/-\!
# AmendmentProvisionRefsSpec — 独立形式仕様

原文（改正規定の列挙）から独立。実装を import しない。
-/
namespace JapanTaxLaw.AmendmentProvisionRefsSpec

abbrev AmendListSpec := Nat × Nat × Nat

def emptyAmendSpec : AmendListSpec := (0, 0, 0)
def combineAmendSpec (a b : AmendListSpec) : AmendListSpec :=
  (a.1 + b.1, a.2.1 + b.2.1, a.2.2 + b.2.2)
def netChangeSpec (a : AmendListSpec) : Int := (a.1 : Int) - (a.2.1 : Int)

end JapanTaxLaw.AmendmentProvisionRefsSpec
