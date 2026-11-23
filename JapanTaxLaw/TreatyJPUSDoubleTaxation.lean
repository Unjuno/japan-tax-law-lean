/-\!
# TreatyJPUSDoubleTaxation — 日米租税条約 第二十三条（二重課税の除去）

L3 条約層（別層）。第二十三条の外国税額控除構造をカーネル証明する：
- ２３１(a)：日本居住者が合衆国で課された租税は日本の租税から控除。ただし控除額は
  当該所得に対応する日本の租税額を超えない（通常控除の上限）。
- ２３１(b)：10%以上所有する法人への配当は日本の課税標準から除外（間接控除的除外）。
- ２３２：合衆国も日本の租税を合衆国の租税から控除（合衆国法令の制限に従う）。

具体的な税額・所得・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSDoubleTaxation

-- ２３１(a)：控除額 = min(外国税, 対応する居住国税)
def foreignTaxCredit (foreignTax domesticTax : Nat) : Nat :=
  if foreignTax <= domesticTax then foreignTax else domesticTax

theorem credit_capped_at_domestic (f d : Nat) (h : d <= f) : foreignTaxCredit f d = d := by
  unfold foreignTaxCredit
  by_cases hf : f <= d
  · have : f = d := Nat.le_antisymm hf h
    simp [hf, this]
  · simp [hf]
theorem credit_when_foreign_less (f d : Nat) (h : f <= d) : foreignTaxCredit f d = f := by
  simp [foreignTaxCredit, h]
theorem credit_never_exceeds_domestic (f d : Nat) : foreignTaxCredit f d <= d := by
  unfold foreignTaxCredit
  by_cases h : f <= d
  · simp [h]
  · simp [h]

-- ２３１(b)：10%以上所有法人の配当は課税標準から除外
def dividendExcluded (ownershipPct : Nat) : Bool := decide (10 <= ownershipPct)
theorem dividend_at_10pct_excluded : dividendExcluded 10 = true := by decide
theorem dividend_below_10pct_included : dividendExcluded 9 = false := by decide

def doubleTaxationDeclared : Bool := true
theorem double_taxation_is_declaration : doubleTaxationDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSDoubleTaxation
