/-\!
# FixedAssetTaxDetailSpec — 独立形式仕様

地方税法第三百六十四条から独立。実装を import しない。
-/
namespace JapanTaxLaw.FixedAssetTaxDetailSpec

def detailRequiredSpec (l h : Bool) : Bool := l || h

end JapanTaxLaw.FixedAssetTaxDetailSpec
