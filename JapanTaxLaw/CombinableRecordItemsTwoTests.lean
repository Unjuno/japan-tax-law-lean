import JapanTaxLaw.CombinableRecordItemsTwo
import JapanTaxLaw.CombinableRecordItemsTwoSpec

/-
# CombinableRecordItemsTwoTests — kernel-decided boundary checks for 電子帳簿保存法施行規則 第五条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 二 (= 2) INCLUSIVE count threshold neighbourhood, and impl/spec agreement
on the boundary grid.

Pinned source: law 410M50000040043, revision
410M50000040043_20250401_507M60000040028,
sha256 15786f1ae7140c2a1841e02f195246e42f437574b4a20d9f6573dba841899f44,
Article Num 5, needle
「二以上の任意の記録項目を組み合わせて条件を設定することができること。」
-/

namespace JapanTaxLaw.CombinableRecordItemsTwo

-- (a) zero and one record items are not 二以上.
example : canCombine 0 = false := by decide
example : canCombine 1 = false := by decide

-- (b) the 二 (= 2) threshold neighbourhood: 以上 is INCLUSIVE.
example : canCombine 2 = true := by decide
example : canCombine 3 = true := by decide
example : canCombine 10 = true := by decide

-- (c) the pinned statutory count.
example : minItems = 2 := by decide
example : minItems = 2 := rfl

-- (d) named impl theorems used as proofs (theorem-as-proof form).
example : canCombine 0 = false := canCombine_0
example : canCombine 1 = false := canCombine_1
example : canCombine 2 = true := canCombine_2
example : canCombine 3 = true := canCombine_3
example : canCombine 10 = true := canCombine_10
example : minItems = 2 := minItems_value

-- (e) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : canCombine 0 = specCombine 0 := by decide
example : canCombine 1 = specCombine 1 := by decide
example : canCombine 2 = specCombine 2 := by decide
example : canCombine 3 = specCombine 3 := by decide
example : canCombine 10 = specCombine 10 := by decide
example (n : Nat) : canCombine n = specCombine n := agreeCombine n
example : minItems = specMin := agreeMin

end JapanTaxLaw.CombinableRecordItemsTwo
