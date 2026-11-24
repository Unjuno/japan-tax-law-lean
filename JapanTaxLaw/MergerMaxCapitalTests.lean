import JapanTaxLaw.MergerMaxCapital
import JapanTaxLaw.MergerMaxCapitalSpec

/-
# MergerMaxCapitalTests — kernel-decided boundary checks for 第二条 合併資本金額の最大額選択

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`)
or applications of universal theorems. Coverage: zero, small positive inputs,
the 二 (= 2) trigger neighbourhood (below / at / above), max-selection
saturation, and impl/spec agreement on the boundary grid.

Pinned source: law 404CO0000000089, revision 404CO0000000089_20010106_412CO0000000307,
sha256 e80aec82d08862cb6ae5611886e5d844624473d18936c6fd67ce9cc26ed68ab1,
Article Num 2, needle「合併により被合併法人の株主等に交付された合併後存続する法人の株式又は出資に係る資本の金額又は出資金額（被合併法人が二以上ある場合には、各被合併法人に係るこれらの金額のうち最も多い金額）」.
-/

namespace JapanTaxLaw.MergerMaxCapital

-- (a) zero merged corporations is below the inclusive 二 (= 2) trigger.
example : hasMultipleCorps 0 = false := by decide

-- (b) 二 (= 2) trigger neighbourhood: below (1), at (2), above (3).
example : hasMultipleCorps 1 = false := by decide
example : hasMultipleCorps 2 = true := by decide
example : hasMultipleCorps 3 = true := by decide

-- (c) max-selection on several pairs, including identity and zero.
example : maxAmount 5 3 = 5 := by decide
example : maxAmount 3 5 = 5 := by decide
example : maxAmount 4 4 = 4 := by decide
example : maxAmount 0 0 = 0 := by decide
example : maxAmount 100 50 = 100 := by decide

-- (d) the statutory literal itself.
example : multiCorpThreshold = 2 := by decide

-- (e) theorem-as-proof applications of the named impl theorems.
example : hasMultipleCorps 1 = false := one_false
example : hasMultipleCorps 2 = true := two_true
example : hasMultipleCorps 3 = true := three_true
example : maxAmount 5 3 = 5 := max_5_3
example : maxAmount 3 5 = 5 := max_3_5
example : maxAmount 4 4 = 4 := max_4_4
example : maxAmount 0 0 = 0 := max_0_0

-- (f) impl/spec agreement, kernel-decided at the boundary grid.
example : multiCorpThreshold = specThreshold := by decide
example : hasMultipleCorps 0 = specMultiple 0 := by decide
example : hasMultipleCorps 1 = specMultiple 1 := by decide
example : hasMultipleCorps 2 = specMultiple 2 := by decide
example : hasMultipleCorps 3 = specMultiple 3 := by decide
example : maxAmount 5 3 = specMax 5 3 := by decide
example : maxAmount 3 5 = specMax 3 5 := by decide
example : maxAmount 4 4 = specMax 4 4 := by decide
example : maxAmount 0 0 = specMax 0 0 := by decide
example : maxAmount 100 50 = specMax 100 50 := by decide

-- Universal agreement bridges (no decidability guessing needed).
example (n : Nat) : hasMultipleCorps n = specMultiple n := agreeMultiple n
example (a : Nat) (b : Nat) : maxAmount a b = specMax a b := agreeMax a b
example : multiCorpThreshold = specThreshold := agreeThreshold

end JapanTaxLaw.MergerMaxCapital
