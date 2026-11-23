/-\!
# TreatyJPUSDividends — 日米租税条約 第十条（配当）

L3 条約層（別層）。第十条の税率上限・免除構造のみをカーネル証明する：
- １０２：受益者が支払法人の議決権株式１０％以上を所有する法人なら配当額の５％、
  それ以外は１０％を源泉国の税額上限とする。
- １０３：受益者が５０％以上的所有の適格法人又は年金基金（事業遂行により取得した
  ものでない場合に限る）なら、源泉国で課税できない。
- １０４：合衆国規制投資会社（RIC）が支払う配当には２・３を適用しない。

具体的な所有割合・金額・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSDividends

-- １０２：税率上限（所有割合 10% を閾値に 5% / 10%）
def dividendRateCap (ownershipPct : Nat) : Nat :=
  if 10 <= ownershipPct then 5 else 10

theorem cap_five_at_10pct : dividendRateCap 10 = 5 := by simp [dividendRateCap]
theorem cap_five_above_10pct (p : Nat) (h : 10 <= p) : dividendRateCap p = 5 := by simp [dividendRateCap, h]
theorem cap_ten_below_10pct (p : Nat) (h : p < 10) : dividendRateCap p = 10 := by simp [dividendRateCap, h]

-- 課税額は上限以下
def withinCap (taxRate cap : Nat) : Bool := decide (taxRate <= cap)
theorem five_within_cap : withinCap 5 5 = true := by decide
theorem ten_exceeds_five : withinCap 10 5 = false := by decide

-- １０３：源泉国免除（50%以上適格所有 又は 適格年金基金）
def exemptInSource (ownershipPct : Nat) (qualPensionFund : Bool) : Bool :=
  (50 <= ownershipPct) || qualPensionFund

theorem exempt_at_50pct : exemptInSource 50 false = true := by simp [exemptInSource]
theorem exempt_pension : exemptInSource 0 true = true := by simp [exemptInSource]
theorem not_exempt_below_50 : exemptInSource 49 false = false := by simp [exemptInSource]

-- １０４：RIC 支払配当には 2,3 を適用しない
def appliesRateRules (isRIC : Bool) : Bool := !isRIC
theorem ric_excluded : appliesRateRules true = false := by simp [appliesRateRules]
theorem non_ric_applies : appliesRateRules false = true := by simp [appliesRateRules]

def dividendsDeclared : Bool := true
theorem dividends_is_declaration : dividendsDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSDividends
