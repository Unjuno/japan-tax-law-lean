import JapanTaxLaw.CabinetOrderMattersDelegationSpec

/-
# CabinetOrderMattersDelegationTests — kernel-decided boundary checks

Verifies the pure DELEGATION 「前二項の規定の適用に関し必要な事項は、政令で定める。」:
Cabinet Order flag true, 前二項 coverage inclusive at 0/1/2 and false at 3.
The literal 2 is a structural paragraph cross-reference (前二項), NOT a
substantive threshold; boundary categories below exercise that reference.
-/

namespace JapanTaxLaw.CabinetOrderMattersDelegation

-- Boundary: below the structural cross-reference (zero).
example : appliesToParagraph 0 = true := by decide

-- Boundary: below the structural cross-reference (1 = 2 - 1).
example : appliesToParagraph 1 = true := by decide

-- Boundary: exactly the structural cross-reference 前二項 (= 2).
example : appliesToParagraph 2 = true := by decide

-- Boundary: just above 前二項 (3 = 2 + 1) — outside the delegation scope.
example : appliesToParagraph 3 = false := by decide

-- Structural cross-reference and delegation flag facts (theorem-as-proof).
example : paragraphRef = 2 := paragraphRef_is_two
example : delegatedToCabinetOrder = true := delegatedToCabinetOrder_is_true

-- Implementation/spec agreement (theorem-as-proof).
example : paragraphRef = specParagraphRef := agreeParagraphRef
example : delegatedToCabinetOrder = specDelegated := agreeDelegated
example : appliesToParagraph 2 = specApplies 2 := agreeApplies 2

end JapanTaxLaw.CabinetOrderMattersDelegation
