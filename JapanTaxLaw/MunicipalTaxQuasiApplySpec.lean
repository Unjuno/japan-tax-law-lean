/-!
# MunicipalTaxQuasiApplySpec — 独立形式仕様

pinned 原文から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.MunicipalTaxQuasiApplySpec

/-- 原文の準用対象: 個人の市町村民税（区分コード 1）。 -/
def quasiScope (targetCategory : Nat) : Prop := targetCategory = 1

end JapanTaxLaw.MunicipalTaxQuasiApplySpec
