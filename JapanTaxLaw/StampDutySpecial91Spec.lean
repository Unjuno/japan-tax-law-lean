import JapanTaxLaw.StampDutySpecial91

/-!
# StampDutySpecial91 spec — independent statement of 租税特別措置法 art. 91(1),(2)
  vs 印紙税法 別表第一 第一号／第二号

Sources (both pinned; identical to StampDutySpecial91.lean):

  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F
  (data/raw/342AC0000000023_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as StampTable.lean / StampDuty.lean / RegistrationTax.lean)

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * 租税特別措置法 art. 91(1) — 不動産の譲渡に関する契約書（特定期間・契約金額10万円超）の特例税率;
  * 租税特別措置法 art. 91(2) — 建設工事の請負に係る契約に基づく請負契約書（特定期間・契約金額100万円超）の特例税率;
  * 印紙税法 別表第一 第一号 — 契約書（一般税率表、pinned revision の契約金額の記載のある契約書の帯域）;
from the statutory text itself.

Scope boundaries identical to the implementation (see StampDutySpecial91.lean). The
ただし書きの amount gates（柱書の「十万円を超えるもの」「百万円を超えるもの」）and the
特定期間（平成二十六年四月一日〜令和九年三月三十一日）は caller-supplied gates として扱う。
art. 91(3)（別表第一の適用に関する通則３イ読替え)はモデル化していない。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 91(1) — 不動産譲渡契約書特別税率（別表第一第一号の物件名の欄１掲げるもの）。 -/
def specSpecial91Item1 (amount : Money) : Money :=
  if amount ≤ 100_000 then 0
  else if amount ≤ 500_000 then 200
  else if amount ≤ 1_000_000 then 500
  else if amount ≤ 5_000_000 then 1_000
  else if amount ≤ 10_000_000 then 5_000
  else if amount ≤ 50_000_000 then 10_000
  else if amount ≤ 100_000_000 then 30_000
  else if amount ≤ 500_000_000 then 60_000
  else if amount ≤ 1_000_000_000 then 160_000
  else if amount ≤ 5_000_000_000 then 320_000
  else 480_000

/-- Spec: art. 91(2) — 建設工事請負契約書特別税率（別表第一第二号に掲げるもののうち建設工事に係るもの）。 -/
def specSpecial91Item2 (amount : Money) : Money :=
  if amount ≤ 1_000_000 then 0
  else if amount ≤ 2_000_000 then 200
  else if amount ≤ 3_000_000 then 500
  else if amount ≤ 5_000_000 then 1_000
  else if amount ≤ 10_000_000 then 5_000
  else if amount ≤ 50_000_000 then 10_000
  else if amount ≤ 100_000_000 then 30_000
  else if amount ≤ 500_000_000 then 60_000
  else if amount ≤ 1_000_000_000 then 160_000
  else if amount ≤ 5_000_000_000 then 320_000
  else 480_000

/-- Spec: 印紙税法 別表第一 第一号 一般税率表（契約金額の記載のある契約書、pinned revision）。 -/
def specContractDutyPinned (amount : Money) : Money :=
  if amount ≤ 100_000 then 200
  else if amount ≤ 500_000 then 400
  else if amount ≤ 1_000_000 then 1_000
  else if amount ≤ 5_000_000 then 2_000
  else if amount ≤ 10_000_000 then 10_000
  else if amount ≤ 50_000_000 then 20_000
  else if amount ≤ 100_000_000 then 60_000
  else if amount ≤ 500_000_000 then 100_000
  else if amount ≤ 1_000_000_000 then 200_000
  else if amount ≤ 5_000_000_000 then 400_000
  else 600_000

/-- Spec: 印紙税法 別表第一 第二号 一般税率表（請負に関する契約書、契約金額の記載のあるもの）。 -/
def specWorkContractDutyPinned (amount : Money) : Money :=
  if amount ≤ 1_000_000 then 200
  else if amount ≤ 2_000_000 then 400
  else if amount ≤ 3_000_000 then 1_000
  else if amount ≤ 5_000_000 then 2_000
  else if amount ≤ 10_000_000 then 10_000
  else if amount ≤ 50_000_000 then 20_000
  else if amount ≤ 100_000_000 then 60_000
  else if amount ≤ 500_000_000 then 100_000
  else if amount ≤ 1_000_000_000 then 200_000
  else if amount ≤ 5_000_000_000 then 400_000
  else 600_000

-- ==== points, all kernel-decided ====

-- art. 91(1) band boundaries
example : specSpecial91Item1 100_001 = 200 := by decide
example : specSpecial91Item1 500_000 = 200 := by decide
example : specSpecial91Item1 500_001 = 500 := by decide
example : specSpecial91Item1 1_000_000 = 500 := by decide
example : specSpecial91Item1 1_000_001 = 1_000 := by decide
example : specSpecial91Item1 5_000_000 = 1_000 := by decide
example : specSpecial91Item1 5_000_001 = 5_000 := by decide
example : specSpecial91Item1 10_000_000 = 5_000 := by decide
example : specSpecial91Item1 50_000_000 = 10_000 := by decide
example : specSpecial91Item1 100_000_000 = 30_000 := by decide
example : specSpecial91Item1 500_000_000 = 60_000 := by decide
example : specSpecial91Item1 1_000_000_000 = 160_000 := by decide
example : specSpecial91Item1 5_000_000_000 = 320_000 := by decide
example : specSpecial91Item1 6_000_000_000 = 480_000 := by decide

-- art. 91(2) band boundaries
example : specSpecial91Item2 1_000_001 = 200 := by decide
example : specSpecial91Item2 2_000_000 = 200 := by decide
example : specSpecial91Item2 2_000_001 = 500 := by decide
example : specSpecial91Item2 3_000_000 = 500 := by decide
example : specSpecial91Item2 3_000_001 = 1_000 := by decide
example : specSpecial91Item2 5_000_000 = 1_000 := by decide

-- item (1)/(2) agree from ¥5,000,001 up
example : specSpecial91Item1 6_000_000 = specSpecial91Item2 6_000_000 := by decide
example : specSpecial91Item1 55_000_000 = specSpecial91Item2 55_000_000 := by decide
example : specSpecial91Item1 400_000_000 = specSpecial91Item2 400_000_000 := by decide

-- general tables at pins
example : specContractDutyPinned 500_000 = 400 := by decide
example : specContractDutyPinned 5_000_000 = 2_000 := by decide
example : specWorkContractDutyPinned 2_000_000 = 400 := by decide
example : specWorkContractDutyPinned 3_000_000 = 1_000 := by decide

/-- Agreement examples between the implementation and the independent Spec
    at sample points across all bands. -/
def agreeStampDutySpecialPoints : Bool :=
  [100_001, 250_000, 750_000, 2_000_000, 4_000_000, 7_500_000, 30_000_000,
   75_000_000, 250_000_000, 750_000_000, 2_500_000_000, 9_000_000_000].all fun x =>
    special91Item1 x == specSpecial91Item1 x && special91Item2 x == specSpecial91Item2 x

example : agreeStampDutySpecialPoints = true := by decide

end JapanTaxLaw
