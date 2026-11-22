import JapanTaxLaw.RegistrationFeePerItem
import JapanTaxLaw.RegistrationFeePerItemSpec

/-
RegistrationFeePerItemTests.lean — kernel-decided smoke tests for the article-14
per-item registration tax (no secured debenture amount => 千五百円 per item).

Pinned source (一次資料):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  SHA-256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15

Needle (verbatim in scoped Article 14):
「この場合において、当該担保付社債の金額がないときは、当該登録免許税の課税標準及び税率は、当該登記又は登録に係る不動産等に関する権利の件数一件につき千五百円とする。」

Every example below is closed by kernel `decide`; no theorem names are used as
proofs. Boundary grid: 0, small inputs, and L-1 / L / L+1 for L = 1500.
-/

example : feePerItem = 1500 := by decide

example : feeForItems 0 = 0 := by decide
example : feeForItems 1 = 1500 := by decide
example : feeForItems 2 = 3000 := by decide
example : feeForItems 10 = 15000 := by decide
example : feeForItems 100 = 150000 := by decide

-- 千五百円 (L = 1500) の直前・完全一致・直後
example : feeForItems 1499 = 2248500 := by decide
example : feeForItems 1500 = 2250000 := by decide
example : feeForItems 1501 = 2251500 := by decide

example : specFee = 1500 := by decide
example : feePerItem = specFee := by decide
example : feeForItems 0 = specFeeFor 0 := by decide
example : feeForItems 1 = specFeeFor 1 := by decide
example : feeForItems 100 = specFeeFor 100 := by decide
example : feeForItems 1501 = specFeeFor 1501 := by decide
