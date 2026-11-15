import JapanTaxLaw.SpecialGiftRate

/-!
# SpecialGiftRate spec — independent statement of 租税特別措置法 art. 70の2の5(1)
  vs 相続税法 art. 21-7

Sources (both pinned; identical to SpecialGiftRate.lean):

  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
  Raw snapshot sha256: C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7
  (data/raw/325AC0000000073_20260401_506AC0000000008.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE
  (data/raw/332AC0000000026_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * 租税特別措置法 art. 70の2の5(1) — 直系尊属からの贈与（受贈者がその年一月一日時点で十八歳以上）に係る
    贈与税の額は、相続税法 art. 21-7 の規定にかかわらず、所定の表の税率で計算した金額とする;
  * 相続税法 art. 21-7 — 贈与税の税率表（一般税率）。
from the statutory text itself.

Scope boundaries identical to the implementation (see SpecialGiftRate.lean).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 70の2の5(1) — special rate table. -/
structure SpecSpecialGiftFacts where
  isFromLinealAscendant : Bool
  recipientIsAdultOnGiftYearJan1 : Bool
  deriving DecidableEq, Repr

/-- Spec: eligibility gates (externally established). -/
def specSpecialGiftEligible (f : SpecSpecialGiftFacts) : Bool :=
  f.isFromLinealAscendant && f.recipientIsAdultOnGiftYearJan1

/-- Restatement used only for spot-checking the implementation. The real table
    is handled band-by-band against each statutory limit; this is a direct
    restatement of the statutory table ({pct} per band), summed product-by-product. -/
def specSpecialGiftPortionTaxDirect (x : Money) : Money :=
  let bands : List (Money × Nat) := [(2_000_000, 10), (4_000_000, 15), (6_000_000, 20),
    (10_000_000, 30), (15_000_000, 40), (30_000_000, 45), (45_000_000, 50)]
  let rec go (lo : Money) : List (Money × Nat) → Money
    | [] => (x - lo) * 55 / 100
    | (lim, pct) :: rest =>
        let portion := (if x ≤ lim then x else lim) - (if x ≤ lo then x else lo)
        portion * pct / 100 + go lim rest
  go 0 bands

-- ==== points, all kernel-decided ====

example : specSpecialGiftPortionTaxDirect 2_000_000 = 200_000 := by decide
example : specSpecialGiftPortionTaxDirect 3_000_000 = 200_000 + 150_000 := by decide
example : specSpecialGiftPortionTaxDirect 4_000_000 = 200_000 + 300_000 := by decide
example : specSpecialGiftPortionTaxDirect 6_000_000 = 900_000 := by decide
example : specSpecialGiftPortionTaxDirect 10_000_000 = 2_100_000 := by decide
example : specSpecialGiftPortionTaxDirect 15_000_000 = 4_100_000 := by decide
example : specSpecialGiftPortionTaxDirect 30_000_000 = 10_850_000 := by decide
example : specSpecialGiftPortionTaxDirect 45_000_000 = 18_350_000 := by decide
example : specSpecialGiftPortionTaxDirect 50_000_000 = 21_100_000 := by decide

/-- Spot-check: implementation agrees with the independent direct spec at sample points. -/
def agreeSpecialGiftRatePoints : Bool :=
  [0, 500_000, 2_000_000, 3_000_000, 4_000_000, 6_000_000, 10_000_000,
   15_000_000, 30_000_000, 45_000_000, 50_000_000, 100_000_000].all fun x =>
    specialGiftPortionTax x == specSpecialGiftPortionTaxDirect x

example : agreeSpecialGiftRatePoints = true := by decide

end JapanTaxLaw
