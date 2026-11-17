import JapanTaxLaw.TaxFinance

/-!
# RegistryRealEstateFeesP1B — 登録免許税法 別表第一（一）の区分（六）〜（十）の手数料モデル (W-Q)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: registry_app1_1_B.txt（UTF-8・正規化済み、区分（六）〜（十））

Models 別表第一（一）の区分（六）〜（十）の 8 本の fee string（pinned raw bytes 逐語）:

  （六）先取特権、質権又は抵当権の移転の登記
        イ 相続又は法人の合併による移転の登記 — 債権金額又は極度金額 千分の一
        ロ その他の原因による移転の登記     — 債権金額又は極度金額 千分の二
  （七）根抵当権の一部譲渡又は法人の分割による移転の登記
        — 一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額 千分の二
  （八）抵当権の順位の変更の登記 — 抵当権の件数 一件につき千円
  （九）賃借権の先順位抵当権に優先する同意の登記
        — 賃借権及び抵当権の件数 一件につき千円
  （十）信託の登記
        イ 所有権の信託の登記 — 不動産の価額 千分の四
        ロ 先取特権、質権又は抵当権の信託の登記 — 債権金額又は極度金額 千分の二
        ハ その他の権利の信託の登記 — 不動産の価額 千分の二

Scope & honest boundaries:

* 課税標準（債権金額／極度金額／不動産の価額／件数）はすべて **caller-established**
  な入力です。区分の該当性・金額の認定・不動産の価額の算定はモデル化しません。
* （七）の「一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額」は割り算ですが、
  入力 `base` を **「除した後の金額」** として caller-established にします。共有者数・
  極度金額そのもの、および割り算の丸めはモデル化しません。
* 千分の割合の適用は自然数 `base * mille / 1000`（切り捨て）です。通則法 art. 118/119 の
  端数処理、art. 15（課税標準の千円下限）、art. 19（最低税額千円）、art. 18（同一申請書に
  係る複数の登記の合計）は本スライスの対象外です（既存 `RegistrationTax.lean` の対象）。
* 別表第一（一）の他の区分（一）〜（五）・（十一）以降、船舶以下の表、商業登記以下の号は
  NOT YET COVERED です。
* Pinned evidence は doc-comment に限定します。すべての定理は当該モデルの内部性質のみを
  主張し、法令の意味が正しいこと自体は主張しません（誠実性の原則）。
-/


namespace JapanTaxLaw.RegistryRealEstateFeesP1B

open JapanTaxLaw.TaxFinance

-- ==== 千分の割合の税率定数（法文の「千分の一」等の整数分子） ====

/-- （六）イ 相続又は法人の合併による移転の登記 — 千分の一。 -/
def milleTransferInheritanceOrMerger : Money := 1

/-- （六）ロ その他の原因による移転の登記 — 千分の二。 -/
def milleTransferOther : Money := 2

/-- （七）根抵当権の一部譲渡又は法人の分割による移転の登記 — 千分の二。 -/
def milleRootMortgagePartialTransfer : Money := 2

/-- （十）イ 所有権の信託の登記 — 千分の四。 -/
def milleTrustOwnership : Money := 4

/-- （十）ロ 先取特権、質権又は抵当権の信託の登記 — 千分の二。 -/
def milleTrustSecurity : Money := 2

/-- （十）ハ その他の権利の信託の登記 — 千分の二。 -/
def milleTrustOtherRights : Money := 2

/-- （八）（九）の「一件につき千円」— 1 件あたりの定額。 -/
def flatFeePerCase : Money := 1_000

-- ==== 割合型の税額（課税標準は caller-established） ====

/-- （六）イ の税額 = 債権金額又は極度金額 × 千分の一。 -/
def transferInheritanceOrMergerFee (base : Money) : Money :=
  base * milleTransferInheritanceOrMerger / 1000

/-- （六）ロ の税額 = 債権金額又は極度金額 × 千分の二。 -/
def transferOtherFee (base : Money) : Money :=
  base * milleTransferOther / 1000

/-- （七）の税額 = （共有者数で除した後の金額）× 千分の二。
    `base` は「除した後の金額」を caller-established に受け取ります。 -/
def rootMortgagePartialTransferFee (base : Money) : Money :=
  base * milleRootMortgagePartialTransfer / 1000

/-- （十）イ の税額 = 不動産の価額 × 千分の四。 -/
def trustOwnershipFee (base : Money) : Money :=
  base * milleTrustOwnership / 1000

/-- （十）ロ の税額 = 債権金額又は極度金額 × 千分の二。 -/
def trustSecurityFee (base : Money) : Money :=
  base * milleTrustSecurity / 1000

/-- （十）ハ の税額 = 不動産の価額 × 千分の二。 -/
def trustOtherRightsFee (base : Money) : Money :=
  base * milleTrustOtherRights / 1000

-- ==== 定額型の税額（件数は caller-established） ====

/-- （八）抵当権の順位の変更の登記 — 抵当権の件数 × 一件につき千円。 -/
def mortgageRankChangeFee (cases : Money) : Money :=
  cases * flatFeePerCase

/-- （九）賃借権の先順位抵当権に優先する同意の登記
    — 賃借権及び抵当権の件数 × 一件につき千円。 -/
def leaseholdPriorityConsentFee (cases : Money) : Money :=
  cases * flatFeePerCase

-- ==== 区分をまとめた统一的な税額関数 ====

/-- 本スライスがモデル化する別表第一（一）（六）〜（十）の区分。 -/
inductive RegistryFeeKind where
  | transferInheritanceOrMerger      -- （六）イ
  | transferOther                     -- （六）ロ
  | rootMortgagePartialTransfer       -- （七）
  | mortgageRankChange                -- （八） flat
  | leaseholdPriorityConsent          -- （九） flat
  | trustOwnership                    -- （十）イ
  | trustSecurity                     -- （十）ロ
  | trustOtherRights                  -- （十）ハ
  deriving DecidableEq, Repr

/-- 区分ごとの税額。`base` は割合型の課税標準、`cases` は定額型の件数（いずれも
    caller-established）。flat 型は `base` を無視し、割合型は `cases` を無視します。 -/
def registryFee (kind : RegistryFeeKind) (base cases : Money) : Money :=
  match kind with
  | .transferInheritanceOrMerger => transferInheritanceOrMergerFee base
  | .transferOther => transferOtherFee base
  | .rootMortgagePartialTransfer => rootMortgagePartialTransferFee base
  | .mortgageRankChange => mortgageRankChangeFee cases
  | .leaseholdPriorityConsent => leaseholdPriorityConsentFee cases
  | .trustOwnership => trustOwnershipFee base
  | .trustSecurity => trustSecurityFee base
  | .trustOtherRights => trustOtherRightsFee base

-- ==== positivity（税率定数・定額は正） ====

theorem milleTransferInheritanceOrMerger_pos : 0 < milleTransferInheritanceOrMerger := by decide
theorem milleTransferOther_pos : 0 < milleTransferOther := by decide
theorem milleRootMortgagePartialTransfer_pos : 0 < milleRootMortgagePartialTransfer := by decide
theorem milleTrustOwnership_pos : 0 < milleTrustOwnership := by decide
theorem milleTrustSecurity_pos : 0 < milleTrustSecurity := by decide
theorem milleTrustOtherRights_pos : 0 < milleTrustOtherRights := by decide
theorem flatFeePerCase_pos : 0 < flatFeePerCase := by decide

-- ==== 税率定数・定額の逐語 smoke ====

example : milleTransferInheritanceOrMerger = 1 := by decide
example : milleTransferOther = 2 := by decide
example : milleRootMortgagePartialTransfer = 2 := by decide
example : milleTrustOwnership = 4 := by decide
example : milleTrustSecurity = 2 := by decide
example : milleTrustOtherRights = 2 := by decide
example : flatFeePerCase = 1_000 := by decide

-- ==== 各 fee 関数の kernel-decide smoke（端点と代表値） ====

example : transferInheritanceOrMergerFee 0 = 0 := by decide
example : transferInheritanceOrMergerFee 999 = 0 := by decide
example : transferInheritanceOrMergerFee 1_000 = 1 := by decide
example : transferInheritanceOrMergerFee 1_000_000 = 1_000 := by decide

example : transferOtherFee 0 = 0 := by decide
example : transferOtherFee 1_000 = 2 := by decide
example : transferOtherFee 12_345_678 = 24_691 := by decide

example : rootMortgagePartialTransferFee 0 = 0 := by decide
example : rootMortgagePartialTransferFee 1_000 = 2 := by decide
example : rootMortgagePartialTransferFee 30_000_000 = 60_000 := by decide

example : mortgageRankChangeFee 0 = 0 := by decide
example : mortgageRankChangeFee 1 = 1_000 := by decide
example : mortgageRankChangeFee 3 = 3_000 := by decide

example : leaseholdPriorityConsentFee 0 = 0 := by decide
example : leaseholdPriorityConsentFee 2 = 2_000 := by decide

example : trustOwnershipFee 0 = 0 := by decide
example : trustOwnershipFee 1_000 = 4 := by decide
example : trustOwnershipFee 100_000_000 = 400_000 := by decide

example : trustSecurityFee 0 = 0 := by decide
example : trustSecurityFee 100_000_000 = 200_000 := by decide

example : trustOtherRightsFee 0 = 0 := by decide
example : trustOtherRightsFee 1_000 = 2 := by decide
example : trustOtherRightsFee 100_000_000 = 200_000 := by decide

example : registryFee .transferInheritanceOrMerger 1_000_000 0 = 1_000 := by decide
example : registryFee .transferOther 1_000_000 0 = 2_000 := by decide
example : registryFee .rootMortgagePartialTransfer 1_000_000 0 = 2_000 := by decide
example : registryFee .mortgageRankChange 0 3 = 3_000 := by decide
example : registryFee .leaseholdPriorityConsent 0 2 = 2_000 := by decide
example : registryFee .trustOwnership 1_000_000 0 = 4_000 := by decide
example : registryFee .trustSecurity 1_000_000 0 = 2_000 := by decide
example : registryFee .trustOtherRights 1_000_000 0 = 2_000 := by decide

-- ==== モデルの内部性質（法令の意味を保証するものではない） ====

/-- 千分の割合の適用は課税標準について単調非減少（自然数切り捨て）。 -/
theorem rateFee_mono (rate : Money) {a b : Money} (h : a ≤ b) :
    a * rate / 1000 ≤ b * rate / 1000 := by
  exact Nat.div_le_div_right (Nat.mul_le_mul_right rate h)

/-- 割合型の税額は課税標準について単調非減少（flat 型は `cases = 0` で 0 のまま）。 -/
theorem registryFee_mono_base (kind : RegistryFeeKind) {a b : Money} (h : a ≤ b) :
    registryFee kind a 0 ≤ registryFee kind b 0 := by
  cases kind with
  | mortgageRankChange => exact Nat.le_refl 0
  | leaseholdPriorityConsent => exact Nat.le_refl 0
  | transferInheritanceOrMerger => exact rateFee_mono milleTransferInheritanceOrMerger h
  | transferOther => exact rateFee_mono milleTransferOther h
  | rootMortgagePartialTransfer => exact rateFee_mono milleRootMortgagePartialTransfer h
  | trustOwnership => exact rateFee_mono milleTrustOwnership h
  | trustSecurity => exact rateFee_mono milleTrustSecurity h
  | trustOtherRights => exact rateFee_mono milleTrustOtherRights h

/-- 定額型の税額は件数について単調非減少（割合型は `base = 0` で 0 のまま）。 -/
theorem registryFee_mono_cases (kind : RegistryFeeKind) {a b : Money} (h : a ≤ b) :
    registryFee kind 0 a ≤ registryFee kind 0 b := by
  cases kind with
  | mortgageRankChange => exact Nat.mul_le_mul_right flatFeePerCase h
  | leaseholdPriorityConsent => exact Nat.mul_le_mul_right flatFeePerCase h
  | transferInheritanceOrMerger => exact Nat.le_refl 0
  | transferOther => exact Nat.le_refl 0
  | rootMortgagePartialTransfer => exact Nat.le_refl 0
  | trustOwnership => exact Nat.le_refl 0
  | trustSecurity => exact Nat.le_refl 0
  | trustOtherRights => exact Nat.le_refl 0

end JapanTaxLaw.RegistryRealEstateFeesP1B
