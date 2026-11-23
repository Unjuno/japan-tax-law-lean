/-\!
# TreatyJPUSMutualAgreementSpec — 独立形式仕様

条約第二十五条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSMutualAgreementSpec

def withinThreeYearsSpec (y : Nat) : Bool := if y <= 3 then true else false
def agreementImplementedSpec (a tb : Bool) : Bool := a

end JapanTaxLaw.TreatyJPUSMutualAgreementSpec
