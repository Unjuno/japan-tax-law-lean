import JapanTaxLaw.RegistryPropertyRightsFees

/-!
# RegistryPropertyRightsFeesSpec — 別表第一（二）四〜四の四の独立整数定式

Source (pinned; identical to RegistryPropertyRightsFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee formulas as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  各権利（ダム使用権 / 公共施設等運営権 / 樹木採取権 / 漁港水面施設運営権）:

    （一）（二）イ（四）イ（七）ロ  (base * 1) / 1000
    （二）ロ                       (base * 5) / 1000
    （三）                         (base * 4) / 1000
    （四）ロ（五）（七）イ          (base * 2) / 1000
    （六）（八）（九）               1000 (per case, flat)

The 課税標準 (`base`) and the case counts are caller-established in both the
implementation and this spec; no eligibility Bool enters any formula.
Rounding is floor (切り捨て). Scope boundaries identical to the implementation
(other 号・別表 are NOT YET COVERED; 五 工場財団等 and 六 are out of scope).

本モジュールの def は 4 権利 × (独立定式 4 + 定額 1) = 20 本と agree 1 本。
-/

namespace JapanTaxLaw.RegistryPropertyRightsFees

open JapanTaxLaw.TaxFinance

/-! === ダム使用権 の独立定式 === -/
def specDamThousandthFee (base : Nat) : Nat := (base * 1) / 1000
def specDamFiveThousandthsFee (base : Nat) : Nat := (base * 5) / 1000
def specDamFourThousandthsFee (base : Nat) : Nat := (base * 4) / 1000
def specDamTwoThousandthsFee (base : Nat) : Nat := (base * 2) / 1000
def specDamPerCaseFee : Nat := 1_000

/-! === 公共施設等運営権 の独立定式 === -/
def specPfcThousandthFee (base : Nat) : Nat := (base * 1) / 1000
def specPfcFiveThousandthsFee (base : Nat) : Nat := (base * 5) / 1000
def specPfcFourThousandthsFee (base : Nat) : Nat := (base * 4) / 1000
def specPfcTwoThousandthsFee (base : Nat) : Nat := (base * 2) / 1000
def specPfcPerCaseFee : Nat := 1_000

/-! === 樹木採取権 の独立定式 === -/
def specTreeThousandthFee (base : Nat) : Nat := (base * 1) / 1000
def specTreeFiveThousandthsFee (base : Nat) : Nat := (base * 5) / 1000
def specTreeFourThousandthsFee (base : Nat) : Nat := (base * 4) / 1000
def specTreeTwoThousandthsFee (base : Nat) : Nat := (base * 2) / 1000
def specTreePerCaseFee : Nat := 1_000

/-! === 漁港水面施設運営権 の独立定式 === -/
def specPortThousandthFee (base : Nat) : Nat := (base * 1) / 1000
def specPortFiveThousandthsFee (base : Nat) : Nat := (base * 5) / 1000
def specPortFourThousandthsFee (base : Nat) : Nat := (base * 4) / 1000
def specPortTwoThousandthsFee (base : Nat) : Nat := (base * 2) / 1000
def specPortPerCaseFee : Nat := 1_000

-- ==== 独立定式の smoke（kernel-decide） ====

example : specDamThousandthFee 1000 = 1 := by decide
example : specDamFiveThousandthsFee 1000 = 5 := by decide
example : specDamFourThousandthsFee 1000 = 4 := by decide
example : specDamTwoThousandthsFee 1000 = 2 := by decide
example : specDamPerCaseFee = 1_000 := by decide
example : specPfcThousandthFee 1000 = 1 := by decide
example : specPfcFiveThousandthsFee 1000 = 5 := by decide
example : specPfcFourThousandthsFee 1000 = 4 := by decide
example : specPfcTwoThousandthsFee 1000 = 2 := by decide
example : specPfcPerCaseFee = 1_000 := by decide
example : specTreeThousandthFee 1000 = 1 := by decide
example : specTreeFiveThousandthsFee 1000 = 5 := by decide
example : specTreeFourThousandthsFee 1000 = 4 := by decide
example : specTreeTwoThousandthsFee 1000 = 2 := by decide
example : specTreePerCaseFee = 1_000 := by decide
example : specPortThousandthFee 1000 = 1 := by decide
example : specPortFiveThousandthsFee 1000 = 5 := by decide
example : specPortFourThousandthsFee 1000 = 4 := by decide
example : specPortTwoThousandthsFee 1000 = 2 := by decide
example : specPortPerCaseFee = 1_000 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryPropertyRightsFees : Bool :=
  let g : List Nat := [0, 1, 99, 100, 249, 250, 999, 1000, 1001, 12_345, 100_000, 1_000_000]
  g.all (fun n => damThousandthFee n == specDamThousandthFee n) &&
  g.all (fun n => damFiveThousandthsFee n == specDamFiveThousandthsFee n) &&
  g.all (fun n => damFourThousandthsFee n == specDamFourThousandthsFee n) &&
  g.all (fun n => damTwoThousandthsFee n == specDamTwoThousandthsFee n) &&
  damPerCaseFee == specDamPerCaseFee &&
  g.all (fun n => pfcThousandthFee n == specPfcThousandthFee n) &&
  g.all (fun n => pfcFiveThousandthsFee n == specPfcFiveThousandthsFee n) &&
  g.all (fun n => pfcFourThousandthsFee n == specPfcFourThousandthsFee n) &&
  g.all (fun n => pfcTwoThousandthsFee n == specPfcTwoThousandthsFee n) &&
  pfcPerCaseFee == specPfcPerCaseFee &&
  g.all (fun n => treeThousandthFee n == specTreeThousandthFee n) &&
  g.all (fun n => treeFiveThousandthsFee n == specTreeFiveThousandthsFee n) &&
  g.all (fun n => treeFourThousandthsFee n == specTreeFourThousandthsFee n) &&
  g.all (fun n => treeTwoThousandthsFee n == specTreeTwoThousandthsFee n) &&
  treePerCaseFee == specTreePerCaseFee &&
  g.all (fun n => portThousandthFee n == specPortThousandthFee n) &&
  g.all (fun n => portFiveThousandthsFee n == specPortFiveThousandthsFee n) &&
  g.all (fun n => portFourThousandthsFee n == specPortFourThousandthsFee n) &&
  g.all (fun n => portTwoThousandthsFee n == specPortTwoThousandthsFee n) &&
  portPerCaseFee == specPortPerCaseFee

example : agreeRegistryPropertyRightsFees = true := by decide

end JapanTaxLaw.RegistryPropertyRightsFees
