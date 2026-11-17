import JapanTaxLaw.RegistryRealEstateFeesP1A

/-!
# RegistryRealEstateFeesP1ASpec — 別表第一（一）区分（一）〜（五）の独立整数定式

Source (pinned; identical to RegistryRealEstateFeesP1A.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee formulas as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  （一）   all ownership preservation ......... (base * 4) / 1000
  （二）イ all inheritance/merger transfer ..... (base * 4) / 1000
  （二）ロ co-ownership division transfer ...... (base * 4) / 1000
  （二）ハ other-cause transfer ............... (base * 20) / 1000
  （三）イ restricted right establishment/sublease (base * 10) / 1000
  （三）ロ restricted right inheritance/merger . (base * 2) / 1000
  （三）ハ restricted right co-ownership div. .. (base * 2) / 1000
  （三）ニ restricted right other cause ........ (base * 10) / 1000
  （三の二）spousal residence right ............ (base * 2) / 1000
  （四）   easement establishment ............. 1500 (per parcel)
  （五）   security registration .............. (base * 4) / 1000

The 課税標準 (`base`) is caller-established in both the implementation and this
spec; no eligibility Bool enters any formula. Rounding is floor (切り捨て).
Scope boundaries identical to the implementation (other 区分・号 are NOT YET COVERED).
-/

namespace JapanTaxLaw.RegistryRealEstateFeesP1A

open JapanTaxLaw.TaxFinance

/-- Spec:（一）所有権の保存 = (base * 4) / 1000。 -/
def specOwnershipPreservationFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（二）イ 相続又は法人の合併による移転 = (base * 4) / 1000。 -/
def specOwnershipTransferInheritanceOrMergerFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（二）ロ 共有物の分割による移転 = (base * 4) / 1000。 -/
def specOwnershipTransferCoOwnershipDivisionFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（二）ハ その他の原因による移転 = (base * 20) / 1000。 -/
def specOwnershipTransferOtherFee (base : Nat) : Nat := (base * 20) / 1000
/-- Spec:（三）イ 設定又は転貸 = (base * 10) / 1000。 -/
def specRestrictedRealRightEstablishmentOrSubleaseFee (base : Nat) : Nat := (base * 10) / 1000
/-- Spec:（三）ロ 相続又は法人の合併による移転 = (base * 2) / 1000。 -/
def specRestrictedRealRightInheritanceOrMergerFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec:（三）ハ 共有に係る権利の分割による移転 = (base * 2) / 1000。 -/
def specRestrictedRealRightCoOwnershipDivisionFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec:（三）ニ その他の原因による移転 = (base * 10) / 1000。 -/
def specRestrictedRealRightOtherFee (base : Nat) : Nat := (base * 10) / 1000
/-- Spec:（三の二）配偶者居住権の設定 = (base * 2) / 1000。 -/
def specSpousalResidenceRightFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec:（五）担保権設定・競売・差押え等 = (base * 4) / 1000。 -/
def specSecurityRegistrationFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（四）地役権の設定 — 承役地 1 個につき ¥1,500。 -/
def specEasementEstablishmentFeePerParcel : Nat := 1_500

-- ==== 独立定式の smoke（kernel-decide） ====

example : specOwnershipPreservationFee 1000 = 4 := by decide
example : specOwnershipTransferInheritanceOrMergerFee 1000 = 4 := by decide
example : specOwnershipTransferCoOwnershipDivisionFee 1000 = 4 := by decide
example : specOwnershipTransferOtherFee 1000 = 20 := by decide
example : specRestrictedRealRightEstablishmentOrSubleaseFee 1000 = 10 := by decide
example : specRestrictedRealRightInheritanceOrMergerFee 1000 = 2 := by decide
example : specRestrictedRealRightCoOwnershipDivisionFee 1000 = 2 := by decide
example : specRestrictedRealRightOtherFee 1000 = 10 := by decide
example : specSpousalResidenceRightFee 1000 = 2 := by decide
example : specSecurityRegistrationFee 1000 = 4 := by decide
example : specEasementEstablishmentFeePerParcel = 1_500 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryRealEstateFeesP1A : Bool :=
  let g : List Nat := [0, 1, 99, 100, 249, 250, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  g.all (fun n => ownershipPreservationFee n == specOwnershipPreservationFee n) &&
  g.all (fun n => ownershipTransferInheritanceOrMergerFee n ==
                  specOwnershipTransferInheritanceOrMergerFee n) &&
  g.all (fun n => ownershipTransferCoOwnershipDivisionFee n ==
                  specOwnershipTransferCoOwnershipDivisionFee n) &&
  g.all (fun n => ownershipTransferOtherFee n == specOwnershipTransferOtherFee n) &&
  g.all (fun n => restrictedRealRightEstablishmentOrSubleaseFee n ==
                  specRestrictedRealRightEstablishmentOrSubleaseFee n) &&
  g.all (fun n => restrictedRealRightInheritanceOrMergerFee n ==
                  specRestrictedRealRightInheritanceOrMergerFee n) &&
  g.all (fun n => restrictedRealRightCoOwnershipDivisionFee n ==
                  specRestrictedRealRightCoOwnershipDivisionFee n) &&
  g.all (fun n => restrictedRealRightOtherFee n == specRestrictedRealRightOtherFee n) &&
  g.all (fun n => spousalResidenceRightFee n == specSpousalResidenceRightFee n) &&
  g.all (fun n => securityRegistrationFee n == specSecurityRegistrationFee n) &&
  easementEstablishmentFeePerParcel == specEasementEstablishmentFeePerParcel

example : agreeRegistryRealEstateFeesP1A = true := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1A
