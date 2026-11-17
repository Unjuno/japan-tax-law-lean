import JapanTaxLaw.RegistryCopyrightFees

/-!
# RegistryCopyrightFeesSpec — 別表第一（二）著作権・出版権・著作隣接権の独立整数定式

Source (pinned; identical to RegistryCopyrightFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee amounts as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  十 著作権 / 十一 出版権 / 十二 著作隣接権
    定額 24 件:
      3,000 / 18,000 / 1,500 / 3,000 / 9,000 / 3,000 / 3,000 / 1,000 / 1,000
      30,000 / 3,000 / 18,000 / 1,500 / 3,000 / 3,000 / 1,000 / 1,000
      3,000 / 9,000 / 1,500 / 3,000 / 3,000 / 1,000 / 1,000
    割合型 6 件（債権金額基準、切り捨て）:
      質権設定・処分制限 ..... (base * 4) / 1000  （十（二）・十一（三）・十二（二））
      質権の信託 ........... (base * 2) / 1000  （十（五）イ・十一（五）イ・十二（四）イ）

The 課税標準 (`base`) is caller-established in both the implementation and this
spec; no eligibility Bool enters any formula. Rounding is floor (切り捨て).
Scope boundaries identical to the implementation (other 号・条文 are NOT YET COVERED).
-/


namespace JapanTaxLaw.RegistryCopyrightFees

open JapanTaxLaw.TaxFinance

/-! === 独立整数定式: 割合型 (base * X) / 1000 === -/

/-- Spec: 十（二） 著作権 質権設定・処分制限 = (base * 4) / 1000。 -/
def specCopyrightPledgeEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 十（五）イ 著作権 質権の信託 = (base * 2) / 1000。 -/
def specCopyrightPledgeTrustFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec: 十一（三） 出版権 質権設定・処分制限 = (base * 4) / 1000。 -/
def specPublishingRightPledgeEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 十一（五）イ 出版権 質権の信託 = (base * 2) / 1000。 -/
def specPublishingRightPledgeTrustFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec: 十二（二） 著作隣接権 質権設定・処分制限 = (base * 4) / 1000。 -/
def specRelatedRightPledgeEstablishmentFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 十二（四）イ 著作隣接権 質権の信託 = (base * 2) / 1000。 -/
def specRelatedRightPledgeTrustFee (base : Nat) : Nat := (base * 2) / 1000

/-! === 独立整数定式: 定額 24 件 === -/

/-- Spec: 十（一）イ 著作権移転・相続/合併 = 3,000。 -/
def specCopyrightTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十（一）ロ 著作権移転・その他 = 18,000。 -/
def specCopyrightTransferOtherFee : Nat := 18_000
/-- Spec: 十（三）イ 著作権質権移転・相続/合併 = 1,500。 -/
def specCopyrightPledgeTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec: 十（三）ロ 著作権質権移転・その他 = 3,000。 -/
def specCopyrightPledgeTransferOtherFee : Nat := 3_000
/-- Spec: 十（四） 無名/変名著作物の実名登録 = 9,000。 -/
def specCopyrightRealNameRegistrationFee : Nat := 9_000
/-- Spec: 十（五）ロ 著作権 質権以外の権利の信託 = 3,000。 -/
def specCopyrightTrustOtherRightFee : Nat := 3_000
/-- Spec: 十（六） 著作権 第一発行/公表年月日・創作年月日 = 3,000。 -/
def specCopyrightFirstPublicationDateRegistrationFee : Nat := 3_000
/-- Spec: 十（七） 著作権 回復・更正/変更 = 1,000。 -/
def specCopyrightRestorationOrCorrectionFee : Nat := 1_000
/-- Spec: 十（八） 著作権 登録の抹消 = 1,000。 -/
def specCopyrightCancellationFee : Nat := 1_000

/-- Spec: 十一（一） 出版権設定 = 30,000。 -/
def specPublishingRightEstablishmentFee : Nat := 30_000
/-- Spec: 十一（二）イ 出版権移転・相続/合併 = 3,000。 -/
def specPublishingRightTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十一（二）ロ 出版権移転・その他 = 18,000。 -/
def specPublishingRightTransferOtherFee : Nat := 18_000
/-- Spec: 十一（四）イ 出版権質権移転・相続/合併 = 1,500。 -/
def specPublishingRightPledgeTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec: 十一（四）ロ 出版権質権移転・その他 = 3,000。 -/
def specPublishingRightPledgeTransferOtherFee : Nat := 3_000
/-- Spec: 十一（五）ロ 出版権 質権以外の権利の信託 = 3,000。 -/
def specPublishingRightTrustOtherRightFee : Nat := 3_000
/-- Spec: 十一（六） 出版権 回復・更正/変更 = 1,000。 -/
def specPublishingRightRestorationOrCorrectionFee : Nat := 1_000
/-- Spec: 十一（七） 出版権 登録の抹消 = 1,000。 -/
def specPublishingRightCancellationFee : Nat := 1_000

/-- Spec: 十二（一）イ 著作隣接権移転・相続/合併 = 3,000。 -/
def specRelatedRightTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十二（一）ロ 著作隣接権移転・その他 = 9,000。 -/
def specRelatedRightTransferOtherFee : Nat := 9_000
/-- Spec: 十二（三）イ 著作隣接権質権移転・相続/合併 = 1,500。 -/
def specRelatedRightPledgeTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec: 十二（三）ロ 著作隣接権質権移転・その他 = 3,000。 -/
def specRelatedRightPledgeTransferOtherFee : Nat := 3_000
/-- Spec: 十二（四）ロ 著作隣接権 質権以外の権利の信託 = 3,000。 -/
def specRelatedRightTrustOtherRightFee : Nat := 3_000
/-- Spec: 十二（五） 著作隣接権 回復・更正/変更 = 1,000。 -/
def specRelatedRightRestorationOrCorrectionFee : Nat := 1_000
/-- Spec: 十二（六） 著作隣接権 登録の抹消 = 1,000。 -/
def specRelatedRightCancellationFee : Nat := 1_000


-- ==== 独立定式の smoke（kernel-decide） ====

example : specCopyrightPledgeEstablishmentFee 1000 = 4 := by decide
example : specCopyrightPledgeTrustFee 1000 = 2 := by decide
example : specPublishingRightPledgeEstablishmentFee 1000 = 4 := by decide
example : specPublishingRightPledgeTrustFee 1000 = 2 := by decide
example : specRelatedRightPledgeEstablishmentFee 1000 = 4 := by decide
example : specRelatedRightPledgeTrustFee 1000 = 2 := by decide

example : specCopyrightTransferInheritanceOrMergerFee = 3_000 := by decide
example : specCopyrightTransferOtherFee = 18_000 := by decide
example : specCopyrightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : specCopyrightPledgeTransferOtherFee = 3_000 := by decide
example : specCopyrightRealNameRegistrationFee = 9_000 := by decide
example : specCopyrightTrustOtherRightFee = 3_000 := by decide
example : specCopyrightFirstPublicationDateRegistrationFee = 3_000 := by decide
example : specCopyrightRestorationOrCorrectionFee = 1_000 := by decide
example : specCopyrightCancellationFee = 1_000 := by decide
example : specPublishingRightEstablishmentFee = 30_000 := by decide
example : specPublishingRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : specPublishingRightTransferOtherFee = 18_000 := by decide
example : specPublishingRightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : specPublishingRightPledgeTransferOtherFee = 3_000 := by decide
example : specPublishingRightTrustOtherRightFee = 3_000 := by decide
example : specPublishingRightRestorationOrCorrectionFee = 1_000 := by decide
example : specPublishingRightCancellationFee = 1_000 := by decide
example : specRelatedRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : specRelatedRightTransferOtherFee = 9_000 := by decide
example : specRelatedRightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : specRelatedRightPledgeTransferOtherFee = 3_000 := by decide
example : specRelatedRightTrustOtherRightFee = 3_000 := by decide
example : specRelatedRightRestorationOrCorrectionFee = 1_000 := by decide
example : specRelatedRightCancellationFee = 1_000 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryCopyrightFees : Bool :=
  let g : List Nat := [0, 1, 99, 100, 249, 250, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  g.all (fun n => copyrightPledgeEstablishmentFee n == specCopyrightPledgeEstablishmentFee n) &&
  g.all (fun n => copyrightPledgeTrustFee n == specCopyrightPledgeTrustFee n) &&
  g.all (fun n => publishingRightPledgeEstablishmentFee n ==
                  specPublishingRightPledgeEstablishmentFee n) &&
  g.all (fun n => publishingRightPledgeTrustFee n == specPublishingRightPledgeTrustFee n) &&
  g.all (fun n => relatedRightPledgeEstablishmentFee n ==
                  specRelatedRightPledgeEstablishmentFee n) &&
  g.all (fun n => relatedRightPledgeTrustFee n == specRelatedRightPledgeTrustFee n) &&
  copyrightTransferInheritanceOrMergerFee == specCopyrightTransferInheritanceOrMergerFee &&
  copyrightTransferOtherFee == specCopyrightTransferOtherFee &&
  copyrightPledgeTransferInheritanceOrMergerFee == specCopyrightPledgeTransferInheritanceOrMergerFee &&
  copyrightPledgeTransferOtherFee == specCopyrightPledgeTransferOtherFee &&
  copyrightRealNameRegistrationFee == specCopyrightRealNameRegistrationFee &&
  copyrightTrustOtherRightFee == specCopyrightTrustOtherRightFee &&
  copyrightFirstPublicationDateRegistrationFee == specCopyrightFirstPublicationDateRegistrationFee &&
  copyrightRestorationOrCorrectionFee == specCopyrightRestorationOrCorrectionFee &&
  copyrightCancellationFee == specCopyrightCancellationFee &&
  publishingRightEstablishmentFee == specPublishingRightEstablishmentFee &&
  publishingRightTransferInheritanceOrMergerFee == specPublishingRightTransferInheritanceOrMergerFee &&
  publishingRightTransferOtherFee == specPublishingRightTransferOtherFee &&
  publishingRightPledgeTransferInheritanceOrMergerFee ==
    specPublishingRightPledgeTransferInheritanceOrMergerFee &&
  publishingRightPledgeTransferOtherFee == specPublishingRightPledgeTransferOtherFee &&
  publishingRightTrustOtherRightFee == specPublishingRightTrustOtherRightFee &&
  publishingRightRestorationOrCorrectionFee == specPublishingRightRestorationOrCorrectionFee &&
  publishingRightCancellationFee == specPublishingRightCancellationFee &&
  relatedRightTransferInheritanceOrMergerFee == specRelatedRightTransferInheritanceOrMergerFee &&
  relatedRightTransferOtherFee == specRelatedRightTransferOtherFee &&
  relatedRightPledgeTransferInheritanceOrMergerFee ==
    specRelatedRightPledgeTransferInheritanceOrMergerFee &&
  relatedRightPledgeTransferOtherFee == specRelatedRightPledgeTransferOtherFee &&
  relatedRightTrustOtherRightFee == specRelatedRightTrustOtherRightFee &&
  relatedRightRestorationOrCorrectionFee == specRelatedRightRestorationOrCorrectionFee &&
  relatedRightCancellationFee == specRelatedRightCancellationFee

example : agreeRegistryCopyrightFees = true := by decide

end JapanTaxLaw.RegistryCopyrightFees
