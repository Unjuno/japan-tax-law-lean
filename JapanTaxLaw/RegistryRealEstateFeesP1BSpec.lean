import JapanTaxLaw.RegistryRealEstateFeesP1B

/-!
# RegistryRealEstateFeesP1B spec — 独立整数定式（登録免許税法 別表第一（一）（六）〜（十））

Sources (pinned; identical to RegistryRealEstateFeesP1B.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the eight fee strings from the statutory text itself.
Where the implementation multiplies by a `Money` rate constant and divides by 1000,
this spec builds a `TaxRate ⟨num, 1000, _⟩` and uses `applyFloor` — a different
code path for the same integer arithmetic. Flat fees are restated as literal
`cases * 1000` rather than referencing `flatFeePerCase`.

Scope boundaries are identical to the implementation; in particular the taxable
base and the number of cases are caller-established and NOT verified here.
The `agree*` checks are finite sample-grid equalities (`by decide`), not proofs
of legal equivalence.
-/


namespace JapanTaxLaw.RegistryRealEstateFeesP1B

open JapanTaxLaw.TaxFinance

-- ==== 独立定式: 千分の割合（TaxRate 経由） ====

/-- Spec: （六）イ — 千分の一。 -/
def specTransferInheritanceOrMergerFee (base : Nat) : Nat :=
  (⟨1, 1000, by decide⟩ : TaxRate).applyFloor base

/-- Spec: （六）ロ — 千分の二。 -/
def specTransferOtherFee (base : Nat) : Nat :=
  (⟨2, 1000, by decide⟩ : TaxRate).applyFloor base

/-- Spec: （七）— 千分の二（`base` は共有者数で除した後の金額）。 -/
def specRootMortgagePartialTransferFee (base : Nat) : Nat :=
  (⟨2, 1000, by decide⟩ : TaxRate).applyFloor base

/-- Spec: （十）イ — 千分の四。 -/
def specTrustOwnershipFee (base : Nat) : Nat :=
  (⟨4, 1000, by decide⟩ : TaxRate).applyFloor base

/-- Spec: （十）ロ — 千分の二。 -/
def specTrustSecurityFee (base : Nat) : Nat :=
  (⟨2, 1000, by decide⟩ : TaxRate).applyFloor base

/-- Spec: （十）ハ — 千分の二。 -/
def specTrustOtherRightsFee (base : Nat) : Nat :=
  (⟨2, 1000, by decide⟩ : TaxRate).applyFloor base

-- ==== 独立定式: 一件につき千円（リテラル） ====

/-- Spec: （八）（九）の一件あたり定額 ¥1,000。 -/
def specFlatFeePerCase : Nat := 1_000

/-- Spec: （八）— 抵当権の件数 × 千円。 -/
def specMortgageRankChangeFee (cases : Nat) : Nat := cases * 1_000

/-- Spec: （九）— 賃借権及び抵当権の件数 × 千円。 -/
def specLeaseholdPriorityConsentFee (cases : Nat) : Nat := cases * 1_000

-- ==== 独立定式の一点検証（kernel-checked） ====

example : specTransferInheritanceOrMergerFee 1_000_000 = 1_000 := by decide
example : specTransferOtherFee 12_345_678 = 24_691 := by decide
example : specRootMortgagePartialTransferFee 30_000_000 = 60_000 := by decide
example : specTrustOwnershipFee 100_000_000 = 400_000 := by decide
example : specTrustSecurityFee 100_000_000 = 200_000 := by decide
example : specTrustOtherRightsFee 100_000_000 = 200_000 := by decide
example : specFlatFeePerCase = 1_000 := by decide
example : specMortgageRankChangeFee 3 = 3_000 := by decide
example : specLeaseholdPriorityConsentFee 2 = 2_000 := by decide

-- ==== impl ↔ spec の有限グリッド一致（`by decide`） ====

/-- 割合型 6 区分 × 課税標準サンプル点（境界 0 / 999 / 1000 / 1001 を含む）。 -/
def agreeRateFeesP1B : Bool :=
  let bases : List Nat := [0, 1, 999, 1_000, 1_001, 12_345_678, 100_000_000, 2_000_000_000]
  bases.all fun b =>
    (transferInheritanceOrMergerFee b == specTransferInheritanceOrMergerFee b) &&
    (transferOtherFee b == specTransferOtherFee b) &&
    (rootMortgagePartialTransferFee b == specRootMortgagePartialTransferFee b) &&
    (trustOwnershipFee b == specTrustOwnershipFee b) &&
    (trustSecurityFee b == specTrustSecurityFee b) &&
    (trustOtherRightsFee b == specTrustOtherRightsFee b)

/-- 定額型 2 区分 × 件数サンプル点。 -/
def agreeFlatFeesP1B : Bool :=
  let cases : List Nat := [0, 1, 2, 3, 17, 1_000]
  cases.all fun n =>
    (mortgageRankChangeFee n == specMortgageRankChangeFee n) &&
    (leaseholdPriorityConsentFee n == specLeaseholdPriorityConsentFee n) &&
    (flatFeePerCase == specFlatFeePerCase)

/-- 统一的な `registryFee` と独立定式の一致（全 8 区分を明示列挙）。 -/
def agreeRegistryFeeP1B : Bool :=
  let bs : List Nat := [0, 1_000, 1_000_000]
  let cs : List Nat := [0, 1, 3]
  (bs.all fun b => cs.all fun c =>
    registryFee .transferInheritanceOrMerger b c == specTransferInheritanceOrMergerFee b) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .transferOther b c == specTransferOtherFee b) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .rootMortgagePartialTransfer b c == specRootMortgagePartialTransferFee b) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .mortgageRankChange b c == specMortgageRankChangeFee c) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .leaseholdPriorityConsent b c == specLeaseholdPriorityConsentFee c) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .trustOwnership b c == specTrustOwnershipFee b) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .trustSecurity b c == specTrustSecurityFee b) &&
  (bs.all fun b => cs.all fun c =>
    registryFee .trustOtherRights b c == specTrustOtherRightsFee b)

/-- impl と Spec の有限グリッド一致（法的意味の等価証明ではありません）。 -/
def agreeRegistryRealEstateFeesP1B : Bool :=
  agreeRateFeesP1B && agreeFlatFeesP1B && agreeRegistryFeeP1B

example : agreeRateFeesP1B = true := by decide
example : agreeFlatFeesP1B = true := by decide
example : agreeRegistryFeeP1B = true := by decide
example : agreeRegistryRealEstateFeesP1B = true := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1B
