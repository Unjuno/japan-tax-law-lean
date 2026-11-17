import JapanTaxLaw.RegistryPatentFees

/-!
# RegistryPatentFeesSpec — 別表第一（二）第十三号・第十四号（特許権・実用新案権）の独立整数定式

Source (pinned; identical to RegistryPatentFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee formulas as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  【十三 特許権】
  （一）イ 相続・合併による移転 ............. 3_000
  （一）ロ その他の原因による移転 ........... 15_000
  （二）専用実施権の設定又は保存 ............ 15_000
  （三）質権の設定／処分の制限 ............. (base * 4) / 1000
  （四）イ 相続・合併による移転 ............. 1_500
  （四）ロ その他の原因による移転 ........... 3_000
  （五）イ 質権の信託 ...................... (base * 2) / 1000
  （五）ロ 質権以外の権利の信託 ............. 3_000
  （六）付記・仮登録・回復・更正／変更 ...... 1_000
  （七）登録の抹消 ......................... 1_000

  【十四 実用新案権】
  （一）イ 相続・合併による移転 ............. 3_000
  （一）ロ その他の原因による移転 ........... 9_000
  （二）専用実施権の設定又は保存 ............ 9_000
  （三）質権の設定／処分の制限 ............. (base * 4) / 1000
  （四）イ 相続・合併による移転 ............. 1_500
  （四）ロ その他の原因による移転 ........... 3_000
  （五）イ 質権の信託 ...................... (base * 2) / 1000
  （五）ロ 質権以外の権利の信託 ............. 3_000
  （六）付記・仮登録・回復・更正／変更 ...... 1_000
  （七）登録の抹消 ......................... 1_000

The 登録件数 and the 課税標準 (`base`) are caller-established in both the
implementation and this spec; no eligibility Bool enters any formula. Rounding
is floor (切り捨て). Scope boundaries identical to the implementation
(other 号 are NOT YET COVERED).
-/

namespace JapanTaxLaw.RegistryPatentFees

open JapanTaxLaw.TaxFinance

/-! === 十三 特許権 — 独立定式 === -/

/-- Spec 十三（一）イ 相続・合併による移転 = 3_000。 -/
def specPatentTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec 十三（一）ロ その他の原因による移転 = 15_000。 -/
def specPatentTransferOtherFee : Nat := 15_000
/-- Spec 十三（二） 専用実施権の設定又は保存 = 15_000。 -/
def specPatentExclusiveRightEstablishmentOrPreservationFee : Nat := 15_000
/-- Spec 十三（三） 質権の設定／処分の制限 = (base * 4) / 1000。 -/
def specPatentPledgeEstablishmentOrDispositionRestrictionFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec 十三（四）イ 相続・合併による移転 = 1_500。 -/
def specPatentExclusiveRightOrPledgeTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec 十三（四）ロ その他の原因による移転 = 3_000。 -/
def specPatentExclusiveRightOrPledgeTransferOtherFee : Nat := 3_000
/-- Spec 十三（五）イ 質権の信託 = (base * 2) / 1000。 -/
def specPatentPledgeTrustFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec 十三（五）ロ 質権以外の権利の信託 = 3_000。 -/
def specPatentNonPledgeTrustFee : Nat := 3_000
/-- Spec 十三（六） 付記・仮登録・回復・更正／変更 = 1_000。 -/
def specPatentMiscRegistrationFee : Nat := 1_000
/-- Spec 十三（七） 登録の抹消 = 1_000。 -/
def specPatentCancellationFee : Nat := 1_000

/-! === 十四 実用新案権 — 独立定式 === -/

/-- Spec 十四（一）イ 相続・合併による移転 = 3_000。 -/
def specUtilityModelTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec 十四（一）ロ その他の原因による移転 = 9_000。 -/
def specUtilityModelTransferOtherFee : Nat := 9_000
/-- Spec 十四（二） 専用実施権の設定又は保存 = 9_000。 -/
def specUtilityModelExclusiveRightEstablishmentOrPreservationFee : Nat := 9_000
/-- Spec 十四（三） 質権の設定／処分の制限 = (base * 4) / 1000。 -/
def specUtilityModelPledgeEstablishmentOrDispositionRestrictionFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec 十四（四）イ 相続・合併による移転 = 1_500。 -/
def specUtilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec 十四（四）ロ その他の原因による移転 = 3_000。 -/
def specUtilityModelExclusiveRightOrPledgeTransferOtherFee : Nat := 3_000
/-- Spec 十四（五）イ 質権の信託 = (base * 2) / 1000。 -/
def specUtilityModelPledgeTrustFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec 十四（五）ロ 質権以外の権利の信託 = 3_000。 -/
def specUtilityModelNonPledgeTrustFee : Nat := 3_000
/-- Spec 十四（六） 付記・仮登録・回復・更正／変更 = 1_000。 -/
def specUtilityModelMiscRegistrationFee : Nat := 1_000
/-- Spec 十四（七） 登録の抹消 = 1_000。 -/
def specUtilityModelCancellationFee : Nat := 1_000

-- ==== 独立定式の smoke（kernel-decide） ====

example : specPatentTransferInheritanceOrMergerFee = 3_000 := by decide
example : specPatentTransferOtherFee = 15_000 := by decide
example : specPatentExclusiveRightEstablishmentOrPreservationFee = 15_000 := by decide
example : specPatentPledgeEstablishmentOrDispositionRestrictionFee 1000 = 4 := by decide
example : specPatentExclusiveRightOrPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : specPatentExclusiveRightOrPledgeTransferOtherFee = 3_000 := by decide
example : specPatentPledgeTrustFee 1000 = 2 := by decide
example : specPatentNonPledgeTrustFee = 3_000 := by decide
example : specPatentMiscRegistrationFee = 1_000 := by decide
example : specPatentCancellationFee = 1_000 := by decide

example : specUtilityModelTransferInheritanceOrMergerFee = 3_000 := by decide
example : specUtilityModelTransferOtherFee = 9_000 := by decide
example : specUtilityModelExclusiveRightEstablishmentOrPreservationFee = 9_000 := by decide
example : specUtilityModelPledgeEstablishmentOrDispositionRestrictionFee 1000 = 4 := by decide
example : specUtilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : specUtilityModelExclusiveRightOrPledgeTransferOtherFee = 3_000 := by decide
example : specUtilityModelPledgeTrustFee 1000 = 2 := by decide
example : specUtilityModelNonPledgeTrustFee = 3_000 := by decide
example : specUtilityModelMiscRegistrationFee = 1_000 := by decide
example : specUtilityModelCancellationFee = 1_000 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryPatentFees : Bool :=
  let g : List Nat := [0, 1, 99, 100, 249, 250, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  -- 十三 定額
  patentTransferInheritanceOrMergerFee == specPatentTransferInheritanceOrMergerFee &&
  patentTransferOtherFee == specPatentTransferOtherFee &&
  patentExclusiveRightEstablishmentOrPreservationFee ==
    specPatentExclusiveRightEstablishmentOrPreservationFee &&
  patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee ==
    specPatentExclusiveRightOrPledgeTransferInheritanceOrMergerFee &&
  patentExclusiveRightOrPledgeTransferOtherFee == specPatentExclusiveRightOrPledgeTransferOtherFee &&
  patentNonPledgeTrustFee == specPatentNonPledgeTrustFee &&
  patentMiscRegistrationFee == specPatentMiscRegistrationFee &&
  patentCancellationFee == specPatentCancellationFee &&
  -- 十三 割合型
  g.all (fun n => patentPledgeEstablishmentOrDispositionRestrictionFee n ==
                  specPatentPledgeEstablishmentOrDispositionRestrictionFee n) &&
  g.all (fun n => patentPledgeTrustFee n == specPatentPledgeTrustFee n) &&
  -- 十四 定額
  utilityModelTransferInheritanceOrMergerFee == specUtilityModelTransferInheritanceOrMergerFee &&
  utilityModelTransferOtherFee == specUtilityModelTransferOtherFee &&
  utilityModelExclusiveRightEstablishmentOrPreservationFee ==
    specUtilityModelExclusiveRightEstablishmentOrPreservationFee &&
  utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee ==
    specUtilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee &&
  utilityModelExclusiveRightOrPledgeTransferOtherFee == specUtilityModelExclusiveRightOrPledgeTransferOtherFee &&
  utilityModelNonPledgeTrustFee == specUtilityModelNonPledgeTrustFee &&
  utilityModelMiscRegistrationFee == specUtilityModelMiscRegistrationFee &&
  utilityModelCancellationFee == specUtilityModelCancellationFee &&
  -- 十四 割合型
  g.all (fun n => utilityModelPledgeEstablishmentOrDispositionRestrictionFee n ==
                  specUtilityModelPledgeEstablishmentOrDispositionRestrictionFee n) &&
  g.all (fun n => utilityModelPledgeTrustFee n == specUtilityModelPledgeTrustFee n)

example : agreeRegistryPatentFees = true := by decide

end JapanTaxLaw.RegistryPatentFees
