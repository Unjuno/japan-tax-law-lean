import JapanTaxLaw.RegistrationFeePerItem

/-
RegistrationFeePerItemSpec.lean — independent Nat restatement of the article-14
per-item registration tax (no secured debenture amount => 千五百円 per item).

Pinned source (一次資料):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  SHA-256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15

Needle (verbatim in scoped Article 14):
「この場合において、当該担保付社債の金額がないときは、当該登録免許税の課税標準及び税率は、当該登記又は登録に係る不動産等に関する権利の件数一件につき千五百円とする。」

This spec defines its own spec* constants and does NOT reuse implementation
identifiers inside those definitions (the bridges below are separate theorems).
-/

/-- Spec: 一件につき千五百円（¥1,500）。 -/
def specFee : Nat := 1500

/-- Spec: 件数 × 一件あたり。 -/
def specFeeFor (items : Nat) : Nat := items * specFee

theorem agreeFee : feePerItem = specFee := by unfold feePerItem specFee; rfl

theorem agreeFeeFor (items : Nat) : feeForItems items = specFeeFor items := by
  unfold feeForItems specFeeFor feePerItem specFee
  rfl
