/-\!
# TreatyJPUSInterest — 日米租税条約 第十一条（利子）

L3 条約層（別層）。第十一条の課税配分・税率上限構造のみをカーネル証明する：
- １１１：一方の締約国内で生じ他方の居住者が受益者である利子は、当該他方でのみ課税。
- １１２(a)：収入・売上げ等を基礎とする変動利子は発生国でも課税可、受益者が他方の
  居住者なら利子額の１０％が上限。
- １１６：特別関係により利子額がみなし額を超える場合、超過分に発生国で５％上限。

具体的な金額・関係・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSInterest

-- １１１：通常利子は受益者居住国でのみ課税（源泉国課税なし）
def sourceTaxOnOrdinaryInterest : Bool := false
theorem ordinary_interest_no_source_tax : sourceTaxOnOrdinaryInterest = false := rfl

-- １１２(a)：変動利子の源泉国税率上限 10%
def contingentInterestCap : Nat := 10
def withinContingentCap (rate : Nat) : Bool := decide (rate <= contingentInterestCap)
theorem ten_within_contingent_cap : withinContingentCap 10 = true := by decide
theorem fifteen_exceeds_contingent_cap : withinContingentCap 15 = false := by decide

-- １１６：特別関係による超過分の税率上限 5%
def excessInterestCap : Nat := 5
def withinExcessCap (rate : Nat) : Bool := decide (rate <= excessInterestCap)
theorem excess_cap_five : excessInterestCap = 5 := rfl
theorem five_within_excess_cap : withinExcessCap 5 = true := by decide
theorem ten_exceeds_excess_cap : withinExcessCap 10 = false := by decide

-- 超過分 = 支払額 - みなし額（支払額が上回る場合のみ）
def excessAmount (paid notional : Nat) : Nat := paid - notional
theorem excess_positive (paid notional : Nat) (h : notional < paid) : excessAmount paid notional > 0 := by
  unfold excessAmount
  omega
theorem excess_zero_when_equal (n : Nat) : excessAmount n n = 0 := by simp [excessAmount]

def interestDeclared : Bool := true
theorem interest_is_declaration : interestDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSInterest
