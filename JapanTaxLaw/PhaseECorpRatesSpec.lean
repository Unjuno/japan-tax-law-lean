import JapanTaxLaw.PhaseECorpRates

/-!
# PhaseECorpRates spec — independent statement of the cross-law consistency checks

Sources (both pinned; identical to PhaseECorpRates.lean):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * 租税特別措置法 art. 67の2(1) 特定の医療法人の法人税率の特例 — 百分の十九の税率
    （「法人税法第六十六条第一項、第二項及び第六項の規定にかかわらず」）;
  * 租税特別措置法 art. 68(1)(2) 特定の協同組合等の法人税率の特例 — art. 66(3) の
    読替え: 「百分の十九（各事業年度の所得のうち十億円（一年未満事業年度は月数を乗じて
    十二で除した金額）を超える部分については百分の二十二）」。
from the statutory text itself, and the cross-law consistency relation with
    法人税法 art. 66(3) (public-interest / cooperative flat 19%).

Scope boundaries identical to the implementation (see PhaseECorpRates.lean).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 67の2(1) — 百分の十九（適格な特定の医療法人）. -/
def specSpecialMedicalCorpTax (income : Money) : Money := income * 19 / 100

/-- Spec: art. 68 cap — 十億円 × 月数 ÷ 12（切り捨て; modeling candidate）. -/
def specCoopSpecialCap (monthsLived : Nat) : Money :=
  1_000_000_000 * monthsLived / 12

/-- Spec: art. 68(1) — cap 以下は百分の十九、超過分のみ百分の二十二. -/
def specCoopSpecialTax (income : Money) (monthsLived : Nat) : Money :=
  let cap := specCoopSpecialCap monthsLived
  let reduced := if income ≤ cap then income else cap
  let excess := income - reduced
  reduced * 19 / 100 + excess * 22 / 100

-- ==== points, all kernel-decided ====

-- art. 67の2(1)
example : specSpecialMedicalCorpTax 100_000_000 = 19_000_000 := by decide
example : specSpecialMedicalCorpTax 0 = 0 := by decide

-- art. 68(1)(2)
example : specCoopSpecialCap 12 = 1_000_000_000 := by decide
example : specCoopSpecialCap 6 = 500_000_000 := by decide
example : specCoopSpecialCap 1 = 83_333_333 := by decide

-- art. 68 below cap ≡ 法人税法 art. 66(3) 百分の十九
example : specCoopSpecialTax 800_000_000 12 = 152_000_000 := by decide
example : specCoopSpecialTax 1_000_000_000 12 = 190_000_000 := by decide
-- art. 68 above cap: 百分の十九×10億 + 百分の二十二×超過
example : specCoopSpecialTax 2_000_000_000 12 = 410_000_000 := by decide
example : specCoopSpecialTax 3_000_000_000 12 = 630_000_000 := by decide
-- art. 68(2) 月数換算 (6ヶ月・cap ¥5億）
example : specCoopSpecialTax 700_000_000 6 = 139_000_000 := by decide
example : specCoopSpecialTax 600_000_000 6 = 117_000_000 := by decide
-- 1円だけ cap を超えた場合（端数の境界）
example : specCoopSpecialTax 1_000_000_001 12 = 190_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering both laws' rate computations and the months proration. -/
def agreeCoopSpecialTaxPoints : Bool :=
  let samples : List (Money × Nat) :=
    [ (0, 1), (0, 12), (83_333_333, 1), (500_000_000, 6), (800_000_000, 12),
      (1_000_000_000, 12), (1_000_000_001, 12), (2_000_000_000, 12),
      (700_000_000, 6), (3_000_000_000, 12) ]
  samples.all fun (income, months) =>
    coopSpecialTaxRaw income (specCoopSpecialCap months) ==
      specCoopSpecialTax income months

example : agreeCoopSpecialTaxPoints = true := by decide

def agreeSpecialMedicalPoints : Bool :=
  [0, 1, 100_000_000, 8_000_000, 10_000_000_000].all fun income =>
    specialMedicalCorpTax income == specSpecialMedicalCorpTax income

example : agreeSpecialMedicalPoints = true := by decide

end JapanTaxLaw
