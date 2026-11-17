import JapanTaxLaw.RegistryShipFees

/-!
# RegistryShipFeesSpec — 別表第一（二）二（船舶の登記）の独立整数定式

Source (pinned; identical to RegistryShipFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee formulas as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  （一）   所有権の保存 ............ (base * 4) / 1000
  （二）イ 相続・合併による移転 .... (base * 4) / 1000
  （二）ロ 遺贈・贈与その他無償名義 .. (base * 20) / 1000
  （二）ハ その他の原因による移転 .... (base * 28) / 1000
  （三）   委付 .................. (base * 4) / 1000
  （四）   賃借権設定・転貸・移転 .... (base * 15) / 10000  (千分の一・五)
  （五）   抵当権設定・差押え等 ...... (base * 4) / 1000
  （六）イ 抵当権移転（相続・合併） .. (base * 1) / 1000
  （六）ロ 抵当権移転（その他） ...... (base * 2) / 1000
  （七）   根抵当権の一部譲渡／分割 .. (base * 2) / 1000
  （八）   抵当権の順位変更 ........ 1000 (per case)
  （九）   賃借権の先順位優先同意 .... 1000 (per case)
  （十）イ 所有権の信託 ............ (base * 4) / 1000
  （十）ロ 抵当権の信託 ............ (base * 2) / 1000
  （十）ハ その他の権利の信託 ........ (base * 15) / 10000
  （十一）イ 所有権移転の仮登記・保全 .. (base * 4) / 1000
  （十一）ロ その他の仮登記 .......... 2000 (per vessel)
  （十二） 付記・回復・更正変更 ...... 1000 (per vessel)
  （十三） 登記の抹消 .............. 1000 (per vessel)

The 課税標準 (`base`), 隻数 and 件数 are caller-established in both the
implementation and this spec; no eligibility Bool enters any formula.
Rounding is floor (切り捨て). Scope boundaries identical to the implementation
(別表第一（二）の他の区分・他の号 are NOT YET COVERED).
-/

namespace JapanTaxLaw.RegistryShipFees

open JapanTaxLaw.TaxFinance

/-- Spec:（一）所有権の保存 = (base * 4) / 1000。 -/
def specShipOwnershipPreservationFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（二）イ 相続・合併による移転 = (base * 4) / 1000。 -/
def specShipOwnershipTransferInheritanceOrMergerFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（二）ロ 遺贈・贈与その他無償名義 = (base * 20) / 1000。 -/
def specShipOwnershipTransferGratuitousFee (base : Nat) : Nat := (base * 20) / 1000
/-- Spec:（二）ハ その他の原因による移転 = (base * 28) / 1000。 -/
def specShipOwnershipTransferOtherFee (base : Nat) : Nat := (base * 28) / 1000
/-- Spec:（三）委付 = (base * 4) / 1000。 -/
def specShipAbandonmentFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（四）賃借権設定・転貸・移転 = (base * 15) / 10000。 -/
def specShipLeaseholdFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec:（五）抵当権設定・差押え等 = (base * 4) / 1000。 -/
def specShipMortgageSecurityFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（六）イ 抵当権移転（相続・合併） = (base * 1) / 1000。 -/
def specShipMortgageTransferInheritanceOrMergerFee (base : Nat) : Nat := (base * 1) / 1000
/-- Spec:（六）ロ 抵当権移転（その他） = (base * 2) / 1000。 -/
def specShipMortgageTransferOtherFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec:（七）根抵当権の一部譲渡／分割 = (base * 2) / 1000。 -/
def specShipSweepMortgagePartialTransferOrDivisionFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec:（十）イ 所有権の信託 = (base * 4) / 1000。 -/
def specShipOwnershipTrustFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec:（十）ロ 抵当権の信託 = (base * 2) / 1000。 -/
def specShipMortgageTrustFee (base : Nat) : Nat := (base * 2) / 1000
/-- Spec:（十）ハ その他の権利の信託 = (base * 15) / 10000。 -/
def specShipOtherRightTrustFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec:（十一）イ 所有権移転の仮登記・保全 = (base * 4) / 1000。 -/
def specShipOwnershipTransferProvisionalFee (base : Nat) : Nat := (base * 4) / 1000

/-- Spec:（八）抵当権の順位変更 — 1 件につき ¥1,000。 -/
def specShipMortgageRankChangeFeePerCase : Nat := 1_000
/-- Spec:（九）賃借権の先順位優先同意 — 1 件につき ¥1,000。 -/
def specShipLeaseholdPriorityConsentFeePerCase : Nat := 1_000
/-- Spec:（十一）ロ その他の仮登記 — 1 隻につき ¥2,000。 -/
def specShipOtherProvisionalFeePerVessel : Nat := 2_000
/-- Spec:（十二）付記・回復・更正変更 — 1 隻につき ¥1,000。 -/
def specShipSupplementaryRegistrationFeePerVessel : Nat := 1_000
/-- Spec:（十三）登記の抹消 — 1 隻につき ¥1,000。 -/
def specShipCancellationFeePerVessel : Nat := 1_000

-- ==== 独立定式の smoke（kernel-decide） ====

example : specShipOwnershipPreservationFee 1000 = 4 := by decide
example : specShipOwnershipTransferInheritanceOrMergerFee 1000 = 4 := by decide
example : specShipOwnershipTransferGratuitousFee 1000 = 20 := by decide
example : specShipOwnershipTransferOtherFee 1000 = 28 := by decide
example : specShipAbandonmentFee 1000 = 4 := by decide
example : specShipLeaseholdFee 1000 = 1 := by decide
example : specShipMortgageSecurityFee 1000 = 4 := by decide
example : specShipMortgageTransferInheritanceOrMergerFee 1000 = 1 := by decide
example : specShipMortgageTransferOtherFee 1000 = 2 := by decide
example : specShipSweepMortgagePartialTransferOrDivisionFee 1000 = 2 := by decide
example : specShipOwnershipTrustFee 1000 = 4 := by decide
example : specShipMortgageTrustFee 1000 = 2 := by decide
example : specShipOtherRightTrustFee 1000 = 1 := by decide
example : specShipOwnershipTransferProvisionalFee 1000 = 4 := by decide
example : specShipMortgageRankChangeFeePerCase = 1_000 := by decide
example : specShipLeaseholdPriorityConsentFeePerCase = 1_000 := by decide
example : specShipOtherProvisionalFeePerVessel = 2_000 := by decide
example : specShipSupplementaryRegistrationFeePerVessel = 1_000 := by decide
example : specShipCancellationFeePerVessel = 1_000 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryShipFees : Bool :=
  let g : List Nat := [0, 1, 99, 100, 249, 250, 666, 667, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  g.all (fun n => shipOwnershipPreservationFee n == specShipOwnershipPreservationFee n) &&
  g.all (fun n => shipOwnershipTransferInheritanceOrMergerFee n ==
                  specShipOwnershipTransferInheritanceOrMergerFee n) &&
  g.all (fun n => shipOwnershipTransferGratuitousFee n == specShipOwnershipTransferGratuitousFee n) &&
  g.all (fun n => shipOwnershipTransferOtherFee n == specShipOwnershipTransferOtherFee n) &&
  g.all (fun n => shipAbandonmentFee n == specShipAbandonmentFee n) &&
  g.all (fun n => shipLeaseholdFee n == specShipLeaseholdFee n) &&
  g.all (fun n => shipMortgageSecurityFee n == specShipMortgageSecurityFee n) &&
  g.all (fun n => shipMortgageTransferInheritanceOrMergerFee n ==
                  specShipMortgageTransferInheritanceOrMergerFee n) &&
  g.all (fun n => shipMortgageTransferOtherFee n == specShipMortgageTransferOtherFee n) &&
  g.all (fun n => shipSweepMortgagePartialTransferOrDivisionFee n ==
                  specShipSweepMortgagePartialTransferOrDivisionFee n) &&
  g.all (fun n => shipOwnershipTrustFee n == specShipOwnershipTrustFee n) &&
  g.all (fun n => shipMortgageTrustFee n == specShipMortgageTrustFee n) &&
  g.all (fun n => shipOtherRightTrustFee n == specShipOtherRightTrustFee n) &&
  g.all (fun n => shipOwnershipTransferProvisionalFee n == specShipOwnershipTransferProvisionalFee n) &&
  shipMortgageRankChangeFeePerCase == specShipMortgageRankChangeFeePerCase &&
  shipLeaseholdPriorityConsentFeePerCase == specShipLeaseholdPriorityConsentFeePerCase &&
  shipOtherProvisionalFeePerVessel == specShipOtherProvisionalFeePerVessel &&
  shipSupplementaryRegistrationFeePerVessel == specShipSupplementaryRegistrationFeePerVessel &&
  shipCancellationFeePerVessel == specShipCancellationFeePerVessel

example : agreeRegistryShipFees = true := by decide

end JapanTaxLaw.RegistryShipFees
