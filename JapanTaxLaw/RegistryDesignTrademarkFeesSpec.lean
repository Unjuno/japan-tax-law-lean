import JapanTaxLaw.RegistryDesignTrademarkFees

/-!
# RegistryDesignTrademarkFeesSpec — 別表第一（二）意匠権・商標権・回路配置利用権の独立整数定式

Source (pinned; identical to RegistryDesignTrademarkFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee amounts as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  定額型（1 件あたり、円）:
    十五 意匠権 .... 3,000 / 9,000 / 9,000 / 1,500 / 3,000 / 3,000 / 1,000 / 1,000
    十六 商標権 .... 3,000 / 30,000 / 30,000 / 3,000 / 9,000 / 9,000 / 1,000 / 1,000
    十七 回路配置 . 18,000 / 3,000 / 9,000 / 9,000 / 1,500 / 3,000 / 3,000 / 1,000 / 1,000
  割合型（切り捨て、債権金額を base とする）:
    十五（三） / 十六（三） / 十七（四） .... (base * 4) / 1000
    十五（五）イ / 十六（五）イ / 十七（六）イ .. (base * 2) / 1000

The 課税標準 (`base`) and the 件数 are caller-established in both the
implementation and this spec; no eligibility Bool enters any formula. Rounding
is floor (切り捨て). 育成者権 is absent from the pinned source slice and is NOT
modeled. Scope boundaries are identical to the implementation.
-/

namespace JapanTaxLaw.RegistryDesignTrademarkFees

open JapanTaxLaw.TaxFinance

-- ==== 独立定式: 定額型（1 件あたり） ====

/-- Spec: 十五（一）イ 意匠権移転（相続・合併）= 3,000。 -/
def specDesignTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十五（一）ロ 意匠権移転（その他）= 9,000。 -/
def specDesignTransferOtherFee : Nat := 9_000
/-- Spec: 十五（二） 専用実施権の設定／保存 = 9,000。 -/
def specDesignExclusiveRightEstablishmentOrPreservationFee : Nat := 9_000
/-- Spec: 十五（四）イ 意匠権等の移転（相続・合併）= 1,500。 -/
def specDesignExclusiveRightTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec: 十五（四）ロ 意匠権等の移転（その他）= 3,000。 -/
def specDesignExclusiveRightTransferOtherFee : Nat := 3_000
/-- Spec: 十五（五）ロ 質権以外の権利の信託 = 3,000。 -/
def specDesignTrustNonPledgeFee : Nat := 3_000
/-- Spec: 十五（六） 付記・仮・回復・更正／変更 = 1,000。 -/
def specDesignUpdateRegistrationFee : Nat := 1_000
/-- Spec: 十五（七） 登録の抹消 = 1,000。 -/
def specDesignCancellationFee : Nat := 1_000

/-- Spec: 十六（一）イ 商標権移転（相続・合併）= 3,000。 -/
def specTrademarkTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十六（一）ロ 商標権移転（その他）= 30,000。 -/
def specTrademarkTransferOtherFee : Nat := 30_000
/-- Spec: 十六（二） 専用使用権／通常使用権の設定・保存 = 30,000。 -/
def specTrademarkUseRightEstablishmentOrPreservationFee : Nat := 30_000
/-- Spec: 十六（四）イ 商標権等の移転（相続・合併）= 3,000。 -/
def specTrademarkUseRightTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十六（四）ロ 商標権等の移転（その他）= 9,000。 -/
def specTrademarkUseRightTransferOtherFee : Nat := 9_000
/-- Spec: 十六（五）ロ 質権以外の権利の信託 = 9,000。 -/
def specTrademarkTrustNonPledgeFee : Nat := 9_000
/-- Spec: 十六（六） 付記・仮・回復・更正／変更 = 1,000。 -/
def specTrademarkUpdateRegistrationFee : Nat := 1_000
/-- Spec: 十六（七） 登録の抹消 = 1,000。 -/
def specTrademarkCancellationFee : Nat := 1_000

/-- Spec: 十七（一） 回路配置利用権の設定 = 18,000。 -/
def specCircuitEstablishmentFee : Nat := 18_000
/-- Spec: 十七（二）イ 移転（相続・合併）= 3,000。 -/
def specCircuitTransferInheritanceOrMergerFee : Nat := 3_000
/-- Spec: 十七（二）ロ 移転（その他）= 9,000。 -/
def specCircuitTransferOtherFee : Nat := 9_000
/-- Spec: 十七（三） 専用利用権／通常利用権の設定 = 9,000。 -/
def specCircuitUseRightEstablishmentFee : Nat := 9_000
/-- Spec: 十七（五）イ 利用権等の移転（相続・合併）= 1,500。 -/
def specCircuitUseRightTransferInheritanceOrMergerFee : Nat := 1_500
/-- Spec: 十七（五）ロ 利用権等の移転（その他）= 3,000。 -/
def specCircuitUseRightTransferOtherFee : Nat := 3_000
/-- Spec: 十七（六）ロ 質権以外の権利の信託 = 3,000。 -/
def specCircuitTrustNonPledgeFee : Nat := 3_000
/-- Spec: 十七（七） 付記・仮・回復・更正／変更 = 1,000。 -/
def specCircuitUpdateRegistrationFee : Nat := 1_000
/-- Spec: 十七（八） 登録の抹消 = 1,000。 -/
def specCircuitCancellationFee : Nat := 1_000

-- ==== 独立定式: 割合型（債権金額 base × X / 1000、切り捨て） ====

/-- Spec: 十五（三） 質権設定／処分制限 = (base * 4) / 1000。 -/
def specDesignPledgeSecurityFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 十五（五）イ 質権の信託 = (base * 2) / 1000。 -/
def specDesignTrustPledgeFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec: 十六（三） 質権設定／処分制限 = (base * 4) / 1000。 -/
def specTrademarkPledgeSecurityFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 十六（五）イ 質権の信託 = (base * 2) / 1000。 -/
def specTrademarkTrustPledgeFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec: 十七（四） 質権設定／処分制限 = (base * 4) / 1000。 -/
def specCircuitPledgeSecurityFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 十七（六）イ 質権の信託 = (base * 2) / 1000。 -/
def specCircuitTrustPledgeFee (base : Nat) : Nat := (base * 2) / 1000

-- ==== 独立定式の smoke（kernel-decide） ====

example : specDesignTransferInheritanceOrMergerFee = 3_000 := by decide
example : specDesignTransferOtherFee = 9_000 := by decide
example : specDesignExclusiveRightEstablishmentOrPreservationFee = 9_000 := by decide
example : specDesignExclusiveRightTransferInheritanceOrMergerFee = 1_500 := by decide
example : specDesignExclusiveRightTransferOtherFee = 3_000 := by decide
example : specDesignTrustNonPledgeFee = 3_000 := by decide
example : specDesignUpdateRegistrationFee = 1_000 := by decide
example : specDesignCancellationFee = 1_000 := by decide
example : specTrademarkTransferInheritanceOrMergerFee = 3_000 := by decide
example : specTrademarkTransferOtherFee = 30_000 := by decide
example : specTrademarkUseRightEstablishmentOrPreservationFee = 30_000 := by decide
example : specTrademarkUseRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : specTrademarkUseRightTransferOtherFee = 9_000 := by decide
example : specTrademarkTrustNonPledgeFee = 9_000 := by decide
example : specTrademarkUpdateRegistrationFee = 1_000 := by decide
example : specTrademarkCancellationFee = 1_000 := by decide
example : specCircuitEstablishmentFee = 18_000 := by decide
example : specCircuitTransferInheritanceOrMergerFee = 3_000 := by decide
example : specCircuitTransferOtherFee = 9_000 := by decide
example : specCircuitUseRightEstablishmentFee = 9_000 := by decide
example : specCircuitUseRightTransferInheritanceOrMergerFee = 1_500 := by decide
example : specCircuitUseRightTransferOtherFee = 3_000 := by decide
example : specCircuitTrustNonPledgeFee = 3_000 := by decide
example : specCircuitUpdateRegistrationFee = 1_000 := by decide
example : specCircuitCancellationFee = 1_000 := by decide

example : specDesignPledgeSecurityFee 1000 = 4 := by decide
example : specDesignTrustPledgeFee 1000 = 2 := by decide
example : specTrademarkPledgeSecurityFee 1000 = 4 := by decide
example : specTrademarkTrustPledgeFee 1000 = 2 := by decide
example : specCircuitPledgeSecurityFee 1000 = 4 := by decide
example : specCircuitTrustPledgeFee 1000 = 2 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryDesignTrademarkFees : Bool :=
  let g : List Nat := [0, 1, 99, 100, 249, 250, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  (g.all (fun n => designPledgeSecurityFee n == specDesignPledgeSecurityFee n) &&
   g.all (fun n => designTrustPledgeFee n == specDesignTrustPledgeFee n) &&
   g.all (fun n => trademarkPledgeSecurityFee n == specTrademarkPledgeSecurityFee n) &&
   g.all (fun n => trademarkTrustPledgeFee n == specTrademarkTrustPledgeFee n) &&
   g.all (fun n => circuitPledgeSecurityFee n == specCircuitPledgeSecurityFee n) &&
   g.all (fun n => circuitTrustPledgeFee n == specCircuitTrustPledgeFee n)) &&
  designTransferInheritanceOrMergerFee == specDesignTransferInheritanceOrMergerFee &&
  designTransferOtherFee == specDesignTransferOtherFee &&
  designExclusiveRightEstablishmentOrPreservationFee ==
    specDesignExclusiveRightEstablishmentOrPreservationFee &&
  designExclusiveRightTransferInheritanceOrMergerFee ==
    specDesignExclusiveRightTransferInheritanceOrMergerFee &&
  designExclusiveRightTransferOtherFee == specDesignExclusiveRightTransferOtherFee &&
  designTrustNonPledgeFee == specDesignTrustNonPledgeFee &&
  designUpdateRegistrationFee == specDesignUpdateRegistrationFee &&
  designCancellationFee == specDesignCancellationFee &&
  trademarkTransferInheritanceOrMergerFee == specTrademarkTransferInheritanceOrMergerFee &&
  trademarkTransferOtherFee == specTrademarkTransferOtherFee &&
  trademarkUseRightEstablishmentOrPreservationFee ==
    specTrademarkUseRightEstablishmentOrPreservationFee &&
  trademarkUseRightTransferInheritanceOrMergerFee ==
    specTrademarkUseRightTransferInheritanceOrMergerFee &&
  trademarkUseRightTransferOtherFee == specTrademarkUseRightTransferOtherFee &&
  trademarkTrustNonPledgeFee == specTrademarkTrustNonPledgeFee &&
  trademarkUpdateRegistrationFee == specTrademarkUpdateRegistrationFee &&
  trademarkCancellationFee == specTrademarkCancellationFee &&
  circuitEstablishmentFee == specCircuitEstablishmentFee &&
  circuitTransferInheritanceOrMergerFee == specCircuitTransferInheritanceOrMergerFee &&
  circuitTransferOtherFee == specCircuitTransferOtherFee &&
  circuitUseRightEstablishmentFee == specCircuitUseRightEstablishmentFee &&
  circuitUseRightTransferInheritanceOrMergerFee ==
    specCircuitUseRightTransferInheritanceOrMergerFee &&
  circuitUseRightTransferOtherFee == specCircuitUseRightTransferOtherFee &&
  circuitTrustNonPledgeFee == specCircuitTrustNonPledgeFee &&
  circuitUpdateRegistrationFee == specCircuitUpdateRegistrationFee &&
  circuitCancellationFee == specCircuitCancellationFee

example : agreeRegistryDesignTrademarkFees = true := by decide

end JapanTaxLaw.RegistryDesignTrademarkFees
