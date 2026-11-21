import JapanTaxLaw.AccessoryPriceFloor

/-!
# AccessoryPriceFloorSpec — independent spec for 施行令 第二条 (価格一万円以上)

Pinned source:
  Law id: 339CO0000000182
  Revision: 339CO0000000182_20030401_415CO0000000142
  Raw snapshot: data/raw/339CO0000000182_20030401_415CO0000000142.law.json
  sha256: 086ef9dd9fc2f555fa952772e0be9e7f93f94f6decd7925e103490542331c0e6
  Article: 第二条 (attr.Num = "2")
  原文逐語: 「前二号に掲げるもののほか、車両の附属品であつて価格が一万円以上のもの」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specPriceFloor : Nat := 10_000` (一万円) and expresses 「一万円以上」 as
`decide (¬ price < specPriceFloor)` — a STRICT `<` with negation, deliberately
a DIFFERENT operator from the implementation's non-strict `<=`.

The ONLY bridge between the two is the universal kernel-checked theorem
`agreePriceFloor`, proved with `omega` / `Nat.not_lt`. No implementation
identifier (`accessoryPriceFloor`, `isQualifyingAccessory`) appears in any
independent formula above; the agreement theorem is not an independent formula.

A finite spec-local grid (`specGrid`) and the points below are scaffolding
only, not the statutory formula.

Not modelled (same as the implementation): 前二号, the gated substantive rule,
other articles, and 省令 details.
-/

namespace JapanTaxLaw.AccessoryPriceFloor

/-- Spec-local floor: 一万円 = 10,000 (円, Nat). Independent of the impl. -/
def specPriceFloor : Nat := 10_000

/-- Independent 「一万円以上」: NOT (price < 一万円). Strict `<` + negation. -/
def specQualifies (price : Nat) : Bool :=
  decide (¬ price < specPriceFloor)

/-- Universal, kernel-checked correspondence for every Nat price.
    This is the ONLY impl/spec bridge (omega converts `¬ price < floor`
    to `floor <= price`; `Nat.not_lt` records the same fact on the true branch). -/
theorem agreePriceFloor (price : Nat) :
    isQualifyingAccessory price = specQualifies price := by
  unfold isQualifyingAccessory specQualifies accessoryPriceFloor specPriceFloor
  by_cases h : 10_000 <= price
  · have hs : ¬ price < 10_000 := Nat.not_lt.mpr h
    simp [h, hs]
  · have hs : price < 10_000 := by omega
    simp [h, hs]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specQualifies 0 = false := by decide
example : specQualifies 1 = false := by decide
example : specQualifies 9_999 = false := by decide
example : specQualifies 10_000 = true := by decide
example : specQualifies 10_001 = true := by decide

/-- Finite spec-local grid, used only as scaffolding (not a statutory literal). -/
def specGrid : List Nat := [0, 1, 9_999, 10_000, 10_001]

example : specGrid.length = 5 := by decide

end JapanTaxLaw.AccessoryPriceFloor
