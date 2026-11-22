import JapanTaxLaw.RegistrationTaxFloor1k
import JapanTaxLaw.RegistrationTaxFloor1kSpec

/-
# RegistrationTaxFloor1kTests — kernel-decided checks for 登録免許税法 第十九条（下限千円）

All checks are closed Nat expressions discharged by `rfl` / `by decide`, or
theorem-as-proof applications. Coverage: zero, small positive input, both sides
of the 千円 threshold, a large computed amount, and impl/spec agreement.
-/

namespace JapanTaxLaw.RegistrationTaxFloor1k

-- (a) pinned statutory value: 千円 = 1000.
example : minimumTax = 1000 := rfl
example : specFloor = 1000 := rfl

-- (b) zero computed amount: below the floor, tax = 千円.
example : taxWithFloor 0 = 1000 := by decide
example : specTax 0 = 1000 := by decide

-- (c) small positive input (1): below the floor.
example : taxWithFloor 1 = 1000 := by decide

-- (d) just below the floor (999 < 1000): tax = 千円.
example : taxWithFloor 999 = 1000 := by decide

-- (e) exactly at the threshold: tax = 千円.
example : taxWithFloor 1000 = 1000 := by decide
example : specTax 1000 = 1000 := by decide

-- (f) just above the threshold: tax = computed.
example : taxWithFloor 1001 = 1001 := by decide

-- (g) well above the threshold: tax = computed.
example : taxWithFloor 5000 = 5000 := by decide

-- (h) impl/spec agreement: kernel-checked bridges, theorem-as-proof.
example (computed : Nat) : taxWithFloor computed = specTax computed := agreeTax computed
example : minimumTax = specFloor := agreeFloor

end JapanTaxLaw.RegistrationTaxFloor1k
