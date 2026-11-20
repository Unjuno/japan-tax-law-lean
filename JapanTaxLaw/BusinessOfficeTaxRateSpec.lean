import JapanTaxLaw.BusinessOfficeTaxRate

/-!
# BusinessOfficeTaxRateSpec — 地方税法 第七百一条の四十二 (art. 701-42) の独立定式

Sources (pinned; identical to BusinessOfficeTaxRate.lean):

  Declared statutory scope (machine-parsed by spec_scope_map.py): art. 701-42

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

Independent restatements of the modelled arithmetic:

  * 資産割
      impl: `businessOfficeAssetTax a = a * 600`
      spec: `specAssetTax a = 600 * a`（被乗数を入れ替えた独立整数定式）
  * 従業者割
      impl: `businessOfficeEmploymentTax s = s * 25 / 10000`
      spec: `specEmploymentTax s = (25 * s) / 10000`
  * 合算
      impl: `businessOfficeTax a s = asset + employment`
      spec: `specBusinessOfficeTax a s = specEmploymentTax s + specAssetTax a`（加算順を入れ替え）

各 `agree*` はカーネルが `decide` で決定する有限サンプル上の一致確認であり、
法的意味の等価証明ではない。Scope boundaries are identical to the implementation:
事業所床面積・従業者給与総額の認定、課税標準の算定、申告・徴収手続、
附則・経過措置は caller-established / NOT MODELLED。丸めは切り捨て。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 資産割（被乗数を入れ替えた独立定式）。 -/
def specAssetTax (floorAreaSqMeters : Money) : Money :=
  600 * floorAreaSqMeters

/-- Spec: 従業者割（被乗数を入れ替えた独立定式）。 -/
def specEmploymentTax (employeeSalaryTotal : Money) : Money :=
  (25 * employeeSalaryTotal) / 10000

/-- Spec: 事業所税額（加算順を入れ替えた独立定式）。 -/
def specBusinessOfficeTax (floorAreaSqMeters employeeSalaryTotal : Money) : Money :=
  specEmploymentTax employeeSalaryTotal + specAssetTax floorAreaSqMeters

-- ==== kernel-decided correspondence checks on representative points ====

def agreeAssetTaxAtZero : Bool := businessOfficeAssetTax 0 == specAssetTax 0
def agreeAssetTaxAt100 : Bool := businessOfficeAssetTax 100 == specAssetTax 100
def agreeAssetTaxAt10k : Bool := businessOfficeAssetTax 10_000 == specAssetTax 10_000

def agreeEmploymentTaxAtZero : Bool := businessOfficeEmploymentTax 0 == specEmploymentTax 0
def agreeEmploymentTaxAt4m : Bool := businessOfficeEmploymentTax 4_000_000 == specEmploymentTax 4_000_000
def agreeEmploymentTaxAtOne : Bool := businessOfficeEmploymentTax 1 == specEmploymentTax 1

def agreeTotalAtExample : Bool :=
  businessOfficeTax 100 4_000_000 == specBusinessOfficeTax 100 4_000_000

def agreeTotalAtMixed : Bool :=
  businessOfficeTax 37 1_234_567 == specBusinessOfficeTax 37 1_234_567

example : agreeAssetTaxAtZero = true := by decide
example : agreeAssetTaxAt100 = true := by decide
example : agreeAssetTaxAt10k = true := by decide
example : agreeEmploymentTaxAtZero = true := by decide
example : agreeEmploymentTaxAt4m = true := by decide
example : agreeEmploymentTaxAtOne = true := by decide
example : agreeTotalAtExample = true := by decide
example : agreeTotalAtMixed = true := by decide

end JapanTaxLaw
