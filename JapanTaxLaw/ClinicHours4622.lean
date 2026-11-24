import JapanTaxLaw.TaxFinance

/-!
# ClinicHours4622 — 特別交付税に関する省令 art. 3（診療時間の合計 四千六百二十二時間以上）

Sources (pinned):

  Law id: 351M50000008035
  Revision: 351M50000008035_20260316_508M60000008025
  Raw snapshot: data/raw/351M50000008035_20260316_508M60000008025.law.json

Pinned 原文: 「前年度の休日及び夜間の診療時間の合計時間が四千六百二十二時間以上の診療所」

Scoped claim: only the 診療時間の合計 四千六百二十二時間以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.ClinicHours4622

def clinicFloor4622 : Nat := 4622

def hasClinicHours4622 (x : Nat) : Bool :=
  decide (clinicFloor4622 <= x)

theorem threshold_value : clinicFloor4622 = 4622 := rfl

end JapanTaxLaw.ClinicHours4622
