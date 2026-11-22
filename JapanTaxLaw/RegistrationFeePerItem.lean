import JapanTaxLaw.TaxFinance

/-
RegistrationFeePerItem.lean — 登録免許税法 第十四条（担保付社債がない場合の一件千五百円）

Pinned source (一次資料):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  SHA-256: 95240c3d9b384e58834cb30a3bee32470be86d7295d9544fe141f327f8adfa15

Needle (verbatim in scoped Article 14):
「この場合において、当該担保付社債の金額がないときは、当該登録免許税の課税標準及び税率は、当該登記又は登録に係る不動産等に関する権利の件数一件につき千五百円とする。」

Variable contract:
  items      : 不動産等に関する権利の件数 (Nat, 件)
  feePerItem : 千五百円 (1500 円) per item
  result     : 登録免許税 (Nat, 円)

Scope: ONLY the explicit per-item fee that applies when there is no secured
debenture amount. This article-14 rule is distinct from the 別表 (appendix table)
fees, which are modelled in OTHER modules.
-/

/-- 一件につき千五百円（¥1,500）。 -/
def feePerItem : Nat := 1500

/-- 件数 × 一件あたりの登録免許税。 -/
def feeForItems (items : Nat) : Nat := items * feePerItem

theorem feePerItem_is_1500 : feePerItem = 1500 := by rfl
theorem feeForItems_0 : feeForItems 0 = 0 := by decide
theorem feeForItems_1 : feeForItems 1 = 1500 := by decide
theorem feeForItems_2 : feeForItems 2 = 3000 := by decide
theorem feeForItems_10 : feeForItems 10 = 15000 := by decide
