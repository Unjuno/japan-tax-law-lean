import JapanTaxLaw.RegistryRealEstateFeesP1C

/-!
# RegistryRealEstateFeesP1C spec — independent integer restatement of
     登録免許税法 別表第一（一）区分（十一）〜（十五）

Sources (pinned; identical to RegistryRealEstateFeesP1C.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the 割合型 / 定額型 amounts as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper or its rate
constants:

  割合型 — 税額 = 課税標準 × X / 1000 (floor), with X transcribed verbatim:
    （十一）イ4 ロ2 ／（十二）イ2 ロ(1)2 ロ(2)2 ロ(3)10 ハ(1)5 ハ(2)1
    ハ(3)1 ハ(4)5 ニ1 ホ(1)2 ホ(2)1（債権金額基準）ホ(3)1 ヘ(1)2 ヘ(2)1
  定額型 — 一個／一件あたり:
    十二ト1000 十三イ1000 十三ロ1000 十四1000 十五1000 ／ 十五二十個超一件20000

The 課税標準 / 個数 / 件数 is caller-established in both the implementation
and this spec; no eligibility Bool enters any formula. （十五）の二十個超は
caller-established（両方の定数を定義し、適用判定は式に入れない）。

Scope boundaries identical to the implementation（区分（一）〜（十）は
NOT YET COVERED）。
-/

namespace JapanTaxLaw.RegistryRealEstateFeesP1C

open JapanTaxLaw.TaxFinance

-- ==== 割合型: 独立整数定式（impl の TaxRate / applyFloor を再利用しない） ====

/-- Spec, （十一）イ: 価額 × 4 / 1000. -/
def specInheritanceSeparationOwnershipFee (base : Money) : Money := (base * 4) / 1000
/-- Spec, （十一）ロ: 価額 × 2 / 1000. -/
def specInheritanceSeparationOtherFee (base : Money) : Money := (base * 2) / 1000
/-- Spec, （十二）イ: 価額 × 2 / 1000. -/
def specProvisionalOwnershipPreservationFee (base : Money) : Money := (base * 2) / 1000
/-- Spec, （十二）ロ（１）: 価額 × 2 / 1000. -/
def specProvisionalTransferInheritanceMergerFee (base : Money) : Money := (base * 2) / 1000
/-- Spec, （十二）ロ（２）: 価額 × 2 / 1000. -/
def specProvisionalTransferCoOwnershipDivisionFee (base : Money) : Money := (base * 2) / 1000
/-- Spec, （十二）ロ（３）: 価額 × 10 / 1000. -/
def specProvisionalTransferOtherFee (base : Money) : Money := (base * 10) / 1000
/-- Spec, （十二）ハ（１）: 価額 × 5 / 1000. -/
def specProvisionalSettingLeaseFee (base : Money) : Money := (base * 5) / 1000
/-- Spec, （十二）ハ（２）: 価額 × 1 / 1000. -/
def specProvisionalInheritanceMergerTransferFee (base : Money) : Money := (base * 1) / 1000
/-- Spec, （十二）ハ（３）: 価額 × 1 / 1000. -/
def specProvisionalCoOwnershipDivisionTransferFee (base : Money) : Money := (base * 1) / 1000
/-- Spec, （十二）ハ（４）: 価額 × 5 / 1000. -/
def specProvisionalOtherTransferFee (base : Money) : Money := (base * 5) / 1000
/-- Spec, （十二）ニ: 価額 × 1 / 1000. -/
def specProvisionalSpouseResidenceRightFee (base : Money) : Money := (base * 1) / 1000
/-- Spec, （十二）ホ（１）: 価額 × 2 / 1000. -/
def specProvisionalTrustOwnershipFee (base : Money) : Money := (base * 2) / 1000
/-- Spec, （十二）ホ（２）: 債権金額／極度金額 × 1 / 1000. -/
def specProvisionalTrustLienFee (base : Money) : Money := (base * 1) / 1000
/-- Spec, （十二）ホ（３）: 価額 × 1 / 1000. -/
def specProvisionalTrustOtherRightFee (base : Money) : Money := (base * 1) / 1000
/-- Spec, （十二）ヘ（１）: 価額 × 2 / 1000. -/
def specProvisionalSeparationOwnershipFee (base : Money) : Money := (base * 2) / 1000
/-- Spec, （十二）ヘ（２）: 価額 × 1 / 1000. -/
def specProvisionalSeparationOtherFee (base : Money) : Money := (base * 1) / 1000

-- ==== 定額型: 独立定数 ====

/-- Spec, （十二）ト 一個 ¥1,000. -/
def specProvisionalOtherPerItemFee : Money := 1_000
/-- Spec, （十三）イ 一個 ¥1,000. -/
def specDisplayChangeParcelPerItemFee : Money := 1_000
/-- Spec, （十三）ロ 一個 ¥1,000. -/
def specDisplayChangeMergerPerItemFee : Money := 1_000
/-- Spec, （十四）一個 ¥1,000. -/
def specAdditionalRegistrationPerItemFee : Money := 1_000
/-- Spec, （十五）一個 ¥1,000. -/
def specCancellationPerItemFee : Money := 1_000
/-- Spec, （十五）二十個超 一件 ¥20,000. -/
def specCancellationOver20PerCaseFee : Money := 20_000

-- ==== 独立定式の kernel-decide smoke（base = 1000 → 額 = X） ====

example : specInheritanceSeparationOwnershipFee 1000 = 4 := by decide
example : specInheritanceSeparationOtherFee 1000 = 2 := by decide
example : specProvisionalOwnershipPreservationFee 1000 = 2 := by decide
example : specProvisionalTransferInheritanceMergerFee 1000 = 2 := by decide
example : specProvisionalTransferCoOwnershipDivisionFee 1000 = 2 := by decide
example : specProvisionalTransferOtherFee 1000 = 10 := by decide
example : specProvisionalSettingLeaseFee 1000 = 5 := by decide
example : specProvisionalInheritanceMergerTransferFee 1000 = 1 := by decide
example : specProvisionalCoOwnershipDivisionTransferFee 1000 = 1 := by decide
example : specProvisionalOtherTransferFee 1000 = 5 := by decide
example : specProvisionalSpouseResidenceRightFee 1000 = 1 := by decide
example : specProvisionalTrustOwnershipFee 1000 = 2 := by decide
example : specProvisionalTrustLienFee 1000 = 1 := by decide
example : specProvisionalTrustOtherRightFee 1000 = 1 := by decide
example : specProvisionalSeparationOwnershipFee 1000 = 2 := by decide
example : specProvisionalSeparationOtherFee 1000 = 1 := by decide

example : specProvisionalOtherPerItemFee = 1_000 := by decide
example : specDisplayChangeParcelPerItemFee = 1_000 := by decide
example : specDisplayChangeMergerPerItemFee = 1_000 := by decide
example : specAdditionalRegistrationPerItemFee = 1_000 := by decide
example : specCancellationPerItemFee = 1_000 := by decide
example : specCancellationOver20PerCaseFee = 20_000 := by decide

-- ==== 一致確認（impl ↔ spec、有限グリッド、すべて by decide） ====

/-- Agreement of the implementation with the independent integer formulas at a
    spread of caller-established bases (including floor-boundary points), plus
    equality of the flat constants. -/
def agreeRegistryRealEstateFeesP1C : Bool :=
  [0, 1, 999, 1000, 1001, 12345, 100_000, 1_000_000].all fun n =>
    inheritanceSeparationOwnershipFee n == specInheritanceSeparationOwnershipFee n &&
    inheritanceSeparationOtherFee n == specInheritanceSeparationOtherFee n &&
    provisionalOwnershipPreservationFee n == specProvisionalOwnershipPreservationFee n &&
    provisionalTransferInheritanceMergerFee n == specProvisionalTransferInheritanceMergerFee n &&
    provisionalTransferCoOwnershipDivisionFee n == specProvisionalTransferCoOwnershipDivisionFee n &&
    provisionalTransferOtherFee n == specProvisionalTransferOtherFee n &&
    provisionalSettingLeaseFee n == specProvisionalSettingLeaseFee n &&
    provisionalInheritanceMergerTransferFee n == specProvisionalInheritanceMergerTransferFee n &&
    provisionalCoOwnershipDivisionTransferFee n == specProvisionalCoOwnershipDivisionTransferFee n &&
    provisionalOtherTransferFee n == specProvisionalOtherTransferFee n &&
    provisionalSpouseResidenceRightFee n == specProvisionalSpouseResidenceRightFee n &&
    provisionalTrustOwnershipFee n == specProvisionalTrustOwnershipFee n &&
    provisionalTrustLienFee n == specProvisionalTrustLienFee n &&
    provisionalTrustOtherRightFee n == specProvisionalTrustOtherRightFee n &&
    provisionalSeparationOwnershipFee n == specProvisionalSeparationOwnershipFee n &&
    provisionalSeparationOtherFee n == specProvisionalSeparationOtherFee n &&
    provisionalOtherPerItemFee == specProvisionalOtherPerItemFee &&
    displayChangeParcelPerItemFee == specDisplayChangeParcelPerItemFee &&
    displayChangeMergerPerItemFee == specDisplayChangeMergerPerItemFee &&
    additionalRegistrationPerItemFee == specAdditionalRegistrationPerItemFee &&
    cancellationPerItemFee == specCancellationPerItemFee &&
    cancellationOver20PerCaseFee == specCancellationOver20PerCaseFee

example : agreeRegistryRealEstateFeesP1C = true := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1C
