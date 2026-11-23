import JapanTaxLaw.TreatyAssetCeiling100KSpec

/-
# TreatyAssetCeiling100KTests — kernel-decided checks for 租税条約等実施特例法施行令 art.6-3(16)(3)

All checks are closed Nat/Bool expressions discharged by `rfl` / `by decide`,
or theorem applications. Coverage: the pinned value, zero, a small positive
input, both sides of the 十万円 ceiling, a Nat identity at the ceiling, and
impl/spec agreement at boundary points.
-/

namespace JapanTaxLaw.TreatyAssetCeiling100K

-- (a) pinned statutory value: 十万円 = 100,000.
example : assetCeiling = 100_000 := rfl

-- (b) zero and small positive amounts qualify.
example : withinAssetCeiling 0 = true := by decide
example : withinAssetCeiling 1 = true := by decide

-- (c) just below the ceiling qualifies.
example : withinAssetCeiling 99_999 = true := by decide

-- (d) 以下 is inclusive: exactly 十万円 qualifies.
example : withinAssetCeiling 100_000 = true := by decide

-- (e) one yen above the ceiling fails.
example : withinAssetCeiling 100_001 = false := by decide

-- (f) Nat identity / saturation at the ceiling.
example : 100_000 + 0 = 100_000 := by decide

-- (g) kernel-decided impl/spec agreement at boundary points.
example : withinAssetCeiling 100_000 = specWithinAsset 100_000 := by decide
example : withinAssetCeiling 100_001 = specWithinAsset 100_001 := by decide
example : withinAssetCeiling 0 = specWithinAsset 0 := by decide

-- (h) universal theorem applied to an arbitrary amount.
example (x : Nat) : withinAssetCeiling x = specWithinAsset x := agree_asset_ceiling x

-- (i) independent spec constant is the same statutory value.
example : specAssetCeiling = 100_000 := rfl

end JapanTaxLaw.TreatyAssetCeiling100K
