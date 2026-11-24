import JapanTaxLaw.TaxFinance

/-!
# OwnershipOverHalf — 相続税法施行令 art. 31(4)一 50% super-majority

Pinned source: law 325CO0000000071, revision
`325CO0000000071_20260401_506CO0000000143`, snapshot
`data/raw/325CO0000000071_20260401_506CO0000000143.law.json`.

Normative unit: `NORM|b338babb5647936d561ccd8e4a53d660b56a474820cd86dbadcc18e7ef62686a`
Verbatim: 「…発行済株式等の百分の五十を超える株式等が同項の個人等により
所有されている場合」

Scope: only the strict >50% ownership comparison. `ownedShares` and
`totalShares` are caller-established Nat counts (unit: shares); the caller
must supply `totalShares > 0` for the fraction to be meaningful. The identity
of the shareholders and the preceding paragraph's conditions are separate
matters and are not modelled here. Cross-multiplication avoids division.
-/
namespace JapanTaxLaw.OwnershipOverHalf

/-- 百分の五十 = 50/100. -/
def thresholdPercent : Nat := 50
def percentBase : Nat := 100

/-- True iff owned shares strictly exceed 50% of issued shares. -/
def exceedsHalf (ownedShares totalShares : Nat) : Bool :=
  decide (thresholdPercent * totalShares < ownedShares * percentBase)

theorem exactly_half : exceedsHalf 50 100 = false := by decide
theorem just_over_half : exceedsHalf 51 100 = true := by decide
theorem half_reduced : exceedsHalf 1 2 = false := by decide
theorem just_over_reduced : exceedsHalf 5_001 10_000 = true := by decide

end JapanTaxLaw.OwnershipOverHalf
