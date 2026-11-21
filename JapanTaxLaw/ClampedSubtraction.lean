import JapanTaxLaw.TaxFinance

/-
# ClampedSubtraction — 登録免許税法施行規則 第十二条（控除した額の零下限）モデル

Pinned sources:
  Law id: 342M50000040037
  Revision: 342M50000040037_20260401_508M60000040008
  Raw snapshot: data/raw/342M50000040037_20260401_508M60000040008.law.json
  Article Num 12; normalized scoped leaf text (WS_RE = [\s\u3000]+).
  SHA-256 (raw bytes): 5aba6032d0ed2f0060e623e1a7bd53c2248e7b5abcb9cb2b81c21e9ff443cc16
  Raw file size: 175030 bytes; Article Num="12" located exactly once.

Verbatim 原文 needle (count 1 in normalized scoped Article 12 text):
  「イに掲げる額からロに掲げる額を控除した額（当該控除した額が零を下回る場合にあつては、零）がイに掲げる額のうちに占める割合」

Variable contract:
  i = イに掲げる額 (Nat, unit 円)
  r = ロに掲げる額 (Nat, unit 円)
  控除 = subtraction (i − r)
  零を下回る場合は零 = saturating floor at zero

Scope: ONLY the explicit clamp-at-zero subtraction is modelled. The trailing
「割合」(ratio) is out of scope: it would require division/rounding rules not
stated in this fragment. No statute-configurable constants are introduced.
-/

namespace JapanTaxLaw.ClampedSubtraction

open JapanTaxLaw.TaxFinance

/-- 控除後の額 = イに掲げる額 − ロに掲げる額。
    Lean の Nat 減算は zero-saturating（a < b なら a − b = 0）。これは原文
    「当該控除した額が零を下回る場合にあつては、零」そのもの: 差が負に
    なる（零を下回る）とき結果を零にする明示的な下限（floor at zero）。
    負数を導入せずに saturating subtraction で同じ意味をカーネル検証する。 -/
def clampedSubtract (i r : Nat) : Nat := i - r

/-- 控除後の額が零かどうか（Bool、kernel-decide）。 -/
def isZero (i r : Nat) : Bool := decide (clampedSubtract i r == 0)

/-- i = r なら差は零。 -/
theorem clampedSubtract_self (i : Nat) : clampedSubtract i i = 0 := by
  unfold clampedSubtract
  omega

/-- ロがイを上回る（零を下回る）なら結果は零。 -/
theorem clampedSubtract_underflow (i r : Nat) (h : r > i) : clampedSubtract i r = 0 := by
  unfold clampedSubtract
  omega

/-- イがロを上回るなら単純な差 i − r。 -/
theorem clampedSubtract_of_gt (i r : Nat) (h : i > r) : clampedSubtract i r = i - r := by
  unfold clampedSubtract
  omega

/-- 零入力（イ=0, ロ=任意）なら結果は零。 -/
theorem clampedSubtract_zero_i (r : Nat) : clampedSubtract 0 r = 0 := by
  unfold clampedSubtract
  omega

/-- 零入力（ロ=0, イ=任意）なら結果はイそのもの。 -/
theorem clampedSubtract_zero_r (i : Nat) : clampedSubtract i 0 = i := by
  unfold clampedSubtract
  omega

/-- イに関する単調性: イを増やせば控除後の額は増える（または不変）。 -/
theorem clampedSubtract_mono_i (r : Nat) : Monotone (fun i => clampedSubtract i r) := by
  intro a b hab
  unfold clampedSubtract
  omega

end JapanTaxLaw.ClampedSubtraction
