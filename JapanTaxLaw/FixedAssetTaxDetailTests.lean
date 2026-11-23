import JapanTaxLaw.FixedAssetTaxDetail
import JapanTaxLaw.FixedAssetTaxDetailSpec

/-!
# FixedAssetTaxDetailTests — 地方税法 第三百六十四条
-/
namespace JapanTaxLaw.FixedAssetTaxDetailTests
open JapanTaxLaw.FixedAssetTaxDetail

theorem detail_spec (l h : Bool) : detailRequired l h = JapanTaxLaw.FixedAssetTaxDetailSpec.detailRequiredSpec l h := by rfl
example : detailRequired true false = true := land_requires_detail
example : detailRequired false true = true := house_requires_detail
example : detailRequired false false = false := neither_no_detail
example : detailRequired true true = true := both_still_required
example : fixedAssetTaxDetailDeclared = true := fixed_asset_tax_detail_is_declaration

end JapanTaxLaw.FixedAssetTaxDetailTests
