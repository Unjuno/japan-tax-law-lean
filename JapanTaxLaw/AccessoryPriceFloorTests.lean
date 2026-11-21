import JapanTaxLaw.AccessoryPriceFloor
import JapanTaxLaw.AccessoryPriceFloorSpec

/-
# AccessoryPriceFloorTests — kernel-decided checks for 施行令 第二条 (価格一万円以上)

Every check is a closed Nat/Bool expression discharged by `by decide`/`by rfl`,
or a general Nat fact closed by `omega` / theorem application.
Coverage: zero, small positive, just below (9,999), at floor (10,000),
just above (10,001), Nat identity/saturation at the threshold, and impl/spec
agreement.
-/

namespace JapanTaxLaw.AccessoryPriceFloor

-- (a) zero input is below the floor.
example : isQualifyingAccessory 0 = false := by decide
example : specQualifies 0 = false := by decide

-- (b) small positive input (1) is below the floor.
example : isQualifyingAccessory 1 = false := by decide

-- (c) just below the floor: 9,999 < 10,000.
example : isQualifyingAccessory 9_999 = false := by decide

-- (d) at the floor: 以上 is inclusive, so 10,000 qualifies.
example : isQualifyingAccessory 10_000 = true := by decide
example : specQualifies 10_000 = true := by decide

-- (e) just above the floor: 10,001 qualifies.
example : isQualifyingAccessory 10_001 = true := by decide

-- (f) the decoded constant itself.
example : accessoryPriceFloor = 10_000 := by decide
example : specPriceFloor = 10_000 := by decide

-- (g) Nat identity / saturation at the threshold (floor-like boundaries).
example : 10_000 + 0 = 10_000 := by decide
example : 10_000 - 0 = 10_000 := by decide
example : 9_999 - 10_000 = 0 := by decide
example : 0 + 0 = 0 := by decide

-- (h) impl/spec agreement: concrete points and the universal theorem.
example : isQualifyingAccessory 9_999 = specQualifies 9_999 := by decide
example : isQualifyingAccessory 10_000 = specQualifies 10_000 := by decide
example : isQualifyingAccessory 10_001 = specQualifies 10_001 := by decide
example (price : Nat) : isQualifyingAccessory price = specQualifies price := by
  exact agreePriceFloor price

-- (i) monotonicity above the floor (kernel-checked via the impl theorem).
example (price' : Nat) (hle : 10_000 <= price') : isQualifyingAccessory price' = true := by
  exact monotone at_floor_true hle

end JapanTaxLaw.AccessoryPriceFloor
