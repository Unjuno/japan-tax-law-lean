import JapanTaxLaw.ClampedSubtraction

/-
# ClampedSubtraction spec — 登録免許税法施行規則 第十二条 の独立条件定式

Pinned sources: law 342M50000040037,
revision 342M50000040037_20260401_508M60000040008,
raw data/raw/342M50000040037_20260401_508M60000040008.law.json, Article Num 12.

Independent restatement: 「ロがイを上回る場合に零、そうでなければ差」を
if-then-else で直接書く。impl の Nat 飽和減算は使用しない。
Lean の Nat 減算の零飽和 (a - b = 0 when b > a) は、この明示的な
if-then-else floor と等しい。橋渡しは普遍定理で omega がカーネル検証する。
-/

namespace JapanTaxLaw.ClampedSubtraction

/-- 独立定式: 原文の「零を下回る場合は零」を条件式として直接表現。
    impl 識別子 (clampedSubtract / isZero) は使わない。 -/
def specClampedSubtract (i r : Nat) : Nat := if r <= i then i - r else 0

example : specClampedSubtract 5 10 = 0 := by decide
example : specClampedSubtract 10 3 = 7 := by decide
example : specClampedSubtract 10 10 = 0 := by decide
example : specClampedSubtract 0 1 = 0 := by decide

/-- 普遍的な橋渡し: impl の飽和減算と独立条件定式が全 (i, r) で一致。
    omega がカーネルチェックする（有限の例示による確認ではない）。 -/
theorem agreeClampedSubtract (i r : Nat) :
    clampedSubtract i r = specClampedSubtract i r := by
  unfold clampedSubtract specClampedSubtract
  split
  · omega
  · omega

end JapanTaxLaw.ClampedSubtraction
