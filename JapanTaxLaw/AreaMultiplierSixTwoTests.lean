import JapanTaxLaw.AreaMultiplierSixTwo
import JapanTaxLaw.AreaMultiplierSixTwoSpec

/-
# AreaMultiplierSixTwoTests — kernel-decided checks for 第三十一条（面積六倍・特例二倍）

Pinned: law 423CO0000000112, revision 423CO0000000112_20260401_508CO0000000102,
source data/raw/423CO0000000112_20260401_508CO0000000102.law.json,
SHA-256 d1e8cc26fcec663e706cec8859f4175d1c282f5670bd21a9649d786836db6964,
Article Num 31, needle「り当該共用部分の床面積を按あん分して計算した面積を含む。））に六（前条第三項第一号の建物にあっては、二）を乗じて計算した面積と当該滅失建物等の敷地の用に供されていた土地の面積とのいずれか大きい面積とする。」.
All checks are closed Nat/Bool expressions decided by the kernel, or applications of
named bridge theorems. Coverage: general 6 / special 2 selection, zero and small
inputs, statutory-literal neighbours (2 and 6), and impl/spec agreement.
-/

namespace JapanTaxLaw.AreaMultiplierSixTwo

-- (a) kernel-decided: the two conditional multipliers on area 10
example : multipliedArea 10 false = 60 := by decide
example : multipliedArea 10 true = 20 := by decide

-- (b) kernel-decided: zero / small input / statutory-literal neighbourhood
example : multipliedArea 0 false = 0 := by decide
example : multipliedArea 1 true = 2 := by decide
example : multipliedArea 5 false = 30 := by decide
example : multipliedArea 2 false = 12 := by decide
example : multipliedArea 6 false = 36 := by decide
example : multipliedArea 3 true = 6 := by decide
example : multipliedArea 7 true = 14 := by decide

-- (c) impl/spec agreement (named bridge theorems as proof terms)
example : generalMultiplier = specGeneral := agreeGeneral
example : specialMultiplier = specSpecial := agreeSpecial
example : multipliedArea 10 false = specMultiply 10 false := agreeMultiply 10 false
example : multipliedArea 10 true = specMultiply 10 true := agreeMultiply 10 true
example (area : Nat) (isSpecial : Bool) : multipliedArea area isSpecial = specMultiply area isSpecial := agreeMultiply area isSpecial

end JapanTaxLaw.AreaMultiplierSixTwo
