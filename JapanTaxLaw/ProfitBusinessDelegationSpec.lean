/-!
# ProfitBusinessDelegationSpec — 独立形式仕様

pinned 原文から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.ProfitBusinessDelegationSpec

/-- 原文の委任先（政令）の区分コード。 -/
def specCabinetOrder : Nat := 1

/-- 原文は範囲を自ら定めず、政令に委任する。 -/
def specScopeFixedByAct : Prop := False

end JapanTaxLaw.ProfitBusinessDelegationSpec
