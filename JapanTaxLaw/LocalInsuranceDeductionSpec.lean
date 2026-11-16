import JapanTaxLaw.LocalInsuranceDeduction

/-!
# LocalInsuranceDeduction spec — independent restatement of
  地方税法 art. 34(1)第五号（生命保険料控除）・art. 34(1)第五号の三（地震保険料控除）

Sources (pinned; identical to LocalInsuranceDeduction.lean):

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53
  (data/raw/325AC0000000226_20261101_508AC0000000002.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * art. 34(1)第五号 — イ（新生命保険料／旧生命保険料）: 4-banded formula, ¥28,000 合計 when
    both paid (column cap ¥28,000); ロ (介護医療保険料): same as new life, ¥28,000 cap;
    ハ（新／旧個人年金保険料）: same brackets, ¥28,000 合計 when both paid;
    Grand total: capped at ¥70,000.
  * art. 34(1)第五号の三 — 地震保険料控除額: 支払合計額の二分の一、¥25,000 上限。
from the statutory text itself.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 34(1)第五号 新生命保険料／介護医療保険料／新個人年金保険料（共通形）。 -/
def specNewDeduction (paid : Money) : Money :=
  if paid ≤ 12_000 then paid
  else if paid ≤ 32_000 then 12_000 + (paid - 12_000) / 2
  else if paid ≤ 56_000 then 22_000 + (paid - 32_000) / 4
  else 28_000

/-- Spec: art. 34(1)第五号 旧生命保険料／旧個人年金保険料（共通形）。 -/
def specOldDeduction (paid : Money) : Money :=
  if paid ≤ 15_000 then paid
  else if paid ≤ 40_000 then 15_000 + (paid - 15_000) / 2
  else if paid ≤ 70_000 then 27_500 + (paid - 40_000) / 4
  else 35_000

/-- Spec: art. 34(1)第五号 イ・ハ 欄（両方支払も含む）: ¥28,000 合計上限。 -/
def specBothColumn (newPaid oldPaid : Money) : Money :=
  if newPaid > 0 && oldPaid > 0 then
    min 28_000 (specNewDeduction newPaid + specOldDeduction oldPaid)
  else if newPaid > 0 then specNewDeduction newPaid
  else if oldPaid > 0 then specOldDeduction oldPaid
  else 0

/-- Spec: art. 34(1)第五号 ロ 欄。 -/
def specNursingColumn (paid : Money) : Money :=
  if paid > 0 then specNewDeduction paid else 0

/-- Spec: art. 34(1)第五号 合計（イ + ロ + ハ）、総合 ¥70,000 上限。 -/
def specLifeInsuranceDeduction (a b c d e : Money) : Money :=
  min 70_000 (specBothColumn a b + specNursingColumn c + specBothColumn d e)

/-- Spec: art. 34(1)第五号の三 地震保険料控除額。 -/
def specEarthquakeDeduction (paid : Money) : Money :=
  min 25_000 (paid / 2)

-- ==== points, all kernel-decided ====

example : specNewDeduction 0 = 0 := by decide
example : specNewDeduction 12_000 = 12_000 := by decide
example : specNewDeduction 32_000 = 22_000 := by decide
example : specNewDeduction 56_000 = 28_000 := by decide
example : specNewDeduction 100_000_000 = 28_000 := by decide

example : specOldDeduction 0 = 0 := by decide
example : specOldDeduction 15_000 = 15_000 := by decide
example : specOldDeduction 40_000 = 27_500 := by decide
example : specOldDeduction 70_000 = 35_000 := by decide
example : specEarthquakeDeduction 0 = 0 := by decide
example : specEarthquakeDeduction 50_000 = 25_000 := by decide
example : specEarthquakeDeduction 100_000 = 25_000 := by decide

def agreeInsuranceDeductionPoints : Bool :=
  [ false, true ].all fun a =>
  [ false, true ].all fun b =>
  [ false, true ].all fun c =>
  [ false, true ].all fun d =>
    [ (0, 0, 0, 0, 0), (10_000, 10_000, 10_000, 10_000, 10_000),
      (20_000, 20_000, 20_000, 20_000, 20_000), (100_000_000, 0, 0, 0, 0),
      (0, 100_000_000, 0, 0, 0), (0, 0, 100_000_000, 0, 0),
      (0, 0, 0, 100_000_000, 0), (0, 0, 0, 0, 100_000_000),
      (100_000_000, 100_000_000, 100_000_000, 100_000_000, 100_000_000),
      (50_000, 50_000, 50_000, 50_000, 50_000) ].all fun (n, o, nr, na, oa) =>
      let specVal := specLifeInsuranceDeduction n o nr na oa
      let implVal := lifeInsuranceDeduction n o nr na oa
      specVal == implVal

example : agreeInsuranceDeductionPoints = true := by decide

def agreeEarthquakePoints : Bool :=
  [0, 1, 10_000, 50_000, 51_000, 100_000, 100_000_000].all fun x =>
    earthquakeInsuranceDeduction x == specEarthquakeDeduction x

example : agreeEarthquakePoints = true := by decide

end JapanTaxLaw
