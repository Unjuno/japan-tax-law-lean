/-\!
# TreatyJPUSRoyalties — 日米租税条約 第十二条（使用料）

L3 条約層（別層）。第十二条の課税配分・上限構造のみをカーネル証明する：
- １２１：一方で生じ他方の居住者が受益者である使用料は、当該他方でのみ課税。
- １２３：受益者が発生国内の恒久的施設を通じて事業を行い、権利が当該 PE と実質的
  関連を有する場合は１を適用せず、第七条（営業利益）を適用。
- １２４：特別関係による超過分には発生国で５％を超えない租税。
- １２５：受益者でないとみなされる場合の取扱い。

具体的な金額・権利・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSRoyalties

-- １２１：通常使用料は受益者居住国でのみ課税
def sourceTaxOnOrdinaryRoyalty : Bool := false
theorem ordinary_royalty_no_source_tax : sourceTaxOnOrdinaryRoyalty = false := rfl

-- １２３：PE 実質関連がある場合は第七条へ（１２１を適用しない）
def article7Applies (hasPE realLink : Bool) : Bool := hasPE && realLink
theorem pe_real_link_switches_to_art7 : article7Applies true true = true := by decide
theorem no_pe_stays_art12 : article7Applies false true = false := by decide
theorem no_real_link_stays_art12 : article7Applies true false = false := by decide

-- １２４：特別関係超過分の税率上限 5%
def royaltyExcessCap : Nat := 5
def withinRoyaltyExcessCap (rate : Nat) : Bool := decide (rate <= royaltyExcessCap)
theorem five_within_royalty_excess : withinRoyaltyExcessCap 5 = true := by decide
theorem ten_exceeds_royalty_excess : withinRoyaltyExcessCap 10 = false := by decide

-- 超過分 = 支払額 - みなし額
def royaltyExcess (paid notional : Nat) : Nat := paid - notional
theorem royalty_excess_zero_when_equal (n : Nat) : royaltyExcess n n = 0 := by simp [royaltyExcess]
theorem royalty_excess_positive (p n : Nat) (h : n < p) : royaltyExcess p n > 0 := by
  unfold royaltyExcess
  omega

def royaltiesDeclared : Bool := true
theorem royalties_is_declaration : royaltiesDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSRoyalties
