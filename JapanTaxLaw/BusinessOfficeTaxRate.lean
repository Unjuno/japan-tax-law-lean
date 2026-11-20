import JapanTaxLaw.TaxFinance

/-!
# BusinessOfficeTaxRate — 地方税法 第七百一条の四十二（税率）の L4 モデル

Sources (pinned):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  (current-enforced per data/INVENTORY.json; 地方税法)

担当範囲原文（pinned JSON の正規化テキストから一字も誤らず転記、U+3000 なし）:

  （税率）第七百一条の四十二事業所税の税率は、資産割にあつては一平方メートルにつき六百円、
  従業者割にあつては百分の〇・二五とする。

Pinned needle (doc-comment only; appears once in the normalized article):

  「事業所税の税率は、資産割にあつては一平方メートルにつき六百円、従業者割にあつては
    百分の〇・二五とする。」

Modelled (only the explicit statutory arithmetic):

  * 資産割: 一平方メートルにつき六百円 → `assetTax a = a * 600`。単位は
    `a` が平方メートル (Nat)、結果が円 (Money = Nat)。
  * 従業者割: 百分の〇・二五 = 0.25% = 25/10000 →
    `employmentTax s = s * 25 / 10000`（TaxRate.applyFloor、切り捨て）。
  * 事業所税額 = 資産割 + 従業者割。

Scope & honest boundaries:

  * 事業所床面積・従業者給与総額の認定、課税標準の算定、申告・徴収手続、
    指定都市以外の附則・経過措置は **NOT MODELLED / caller-established**。
  * 原文に端数規定の明示がないため、Nat 除算による切り捨てをモデル規約として明示する
    （解釈を保証しない）。百分の〇・二五は分母 10000 の整数比として符号化し、
    10 倍過大（25/1000）を避ける。
  * 転記監査は fidelity-only であり、法的正しさや原文対応の完全性を保証しない。
  * All arithmetic is total Nat; no sorry/admit/axiom/Classical.choice.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 資産割の税率: 一平方メートルにつき六百円。 -/
def businessOfficeAssetRatePerSqMeter : Money := 600

/-- 従業者割の税率: 百分の〇・二五 = 25/10000（0.25%）。 -/
def businessOfficeEmploymentRate : TaxRate := ⟨25, 10000, by decide⟩

/-- 資産割の額 = 事業所床面積(㎡) × 600円/㎡。 -/
def businessOfficeAssetTax (floorAreaSqMeters : Money) : Money :=
  floorAreaSqMeters * businessOfficeAssetRatePerSqMeter

/-- 従業者割の額 = 従業者給与総額 × 25/10000（切り捨て）。 -/
def businessOfficeEmploymentTax (employeeSalaryTotal : Money) : Money :=
  businessOfficeEmploymentRate.applyFloor employeeSalaryTotal

/-- 事業所税額 = 資産割 + 従業者割。 -/
def businessOfficeTax (floorAreaSqMeters employeeSalaryTotal : Money) : Money :=
  businessOfficeAssetTax floorAreaSqMeters + businessOfficeEmploymentTax employeeSalaryTotal

-- ==== kernel-checked facts about the model (model properties only) ====

theorem asset_rate_is_600 : businessOfficeAssetRatePerSqMeter = 600 := rfl

theorem employment_rate_num : businessOfficeEmploymentRate.num = 25 := rfl

theorem employment_rate_den : businessOfficeEmploymentRate.den = 10000 := rfl

theorem asset_tax_zero : businessOfficeAssetTax 0 = 0 := by decide

theorem employment_tax_zero : businessOfficeEmploymentTax 0 = 0 := by decide

theorem tax_zero : businessOfficeTax 0 0 = 0 := by decide

theorem asset_tax_100_sq_m : businessOfficeAssetTax 100 = 60_000 := by decide

theorem asset_tax_10k_sq_m : businessOfficeAssetTax 10_000 = 6_000_000 := by decide

theorem employment_tax_4m : businessOfficeEmploymentTax 4_000_000 = 10_000 := by decide

theorem employment_tax_floor : businessOfficeEmploymentTax 1 = 0 := by decide

theorem tax_combines : businessOfficeTax 100 4_000_000 = 70_000 := by decide

theorem asset_tax_eq (a : Money) : businessOfficeAssetTax a = a * 600 := rfl

theorem employment_tax_eq (s : Money) : businessOfficeEmploymentTax s = s * 25 / 10000 := rfl

/-- 資産割は床面積について単調非減少（600 ≥ 0）。 -/
theorem asset_tax_mono {a a' : Money} (h : a ≤ a') :
    businessOfficeAssetTax a ≤ businessOfficeAssetTax a' := by
  unfold businessOfficeAssetTax businessOfficeAssetRatePerSqMeter
  exact Nat.mul_le_mul_right 600 h

/-- 従業者割は給与総額について単調非減少（applyFloor の単調性）。 -/
theorem employment_tax_mono {s s' : Money} (h : s ≤ s') :
    businessOfficeEmploymentTax s ≤ businessOfficeEmploymentTax s' := by
  change s * 25 / 10000 ≤ s' * 25 / 10000
  exact Nat.div_le_div_right (Nat.mul_le_mul_right 25 h)

/-- 事業所税額は各引数について単調非減少。 -/
theorem business_tax_mono {a a' s s' : Money} (ha : a ≤ a') (hs : s ≤ s') :
    businessOfficeTax a s ≤ businessOfficeTax a' s' := by
  unfold businessOfficeTax
  exact Nat.add_le_add (asset_tax_mono ha) (employment_tax_mono hs)

/-- 到達可能性: 資産割・従業者割の両方が正になり得る（主要分岐は非空）。 -/
theorem both_parts_positive : businessOfficeAssetTax 1 > 0 ∧ businessOfficeEmploymentTax 400 > 0 := by
  decide

end JapanTaxLaw
