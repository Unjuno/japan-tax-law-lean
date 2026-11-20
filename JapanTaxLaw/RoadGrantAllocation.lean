import JapanTaxLaw.TaxFinance

/-!
# RoadGrantAllocation — 地方税等減収補てん臨時交付金に関する政令 art.5（地方道路譲与税減収補てん臨時交付金）bounded L4 モデル

Sources (pinned):
  Law id: 420AC0000000084
  Revision: 420AC0000000084_20081022_000000000000000
  Raw snapshot: data/raw/420AC0000000084_20081022_000000000000000.law.json
  Article Num 5, flat/normalized leaf text 281 chars, U+3000 count 0.

原文逐語:
  §2 「地方道路譲与税減収補てん臨時交付金の総額は、四十五億九千五百万円とする。」
  §3 「各都道府県及び各市町村に対して交付すべき...額は、前項に規定する...総額を、
       平成二十年六月に各都道府県及び各市町村に対して譲与した地方道路譲与税の額に
       よりあん分した額とする。」

Computation（原文逐語から導出）:
  totalGrant = 4,595,000,000 円（四十五億九千五百万円）
  allocation = totalGrant × entityBasis / totalBasis（按分、分母 0 は安全版で 0）

Scope: 各団体の地方道路譲与税額（basis）は caller-established。
按分の端数処理・交付手続・他2種の交付金は NOT MODELLED。
-/

namespace JapanTaxLaw.RoadGrantAllocation

open JapanTaxLaw.TaxFinance

/-- 地方道路譲与税減収補てん臨時交付金の総額 = 四十五億九千五百万円。 -/
def totalGrant : Money := 4_595_000_000

/-- 按分額 = 総額 × 団体の基準額 / 基準額合計（分母 0 → 0 安全版）。 -/
def allocation (entityBasis totalBasis : Money) : Money :=
  if totalBasis = 0 then 0 else totalGrant * entityBasis / totalBasis

example : totalGrant = 4_595_000_000 := by decide
example : allocation 1 10 = 459_500_000 := by decide
example : allocation 3 10 = 1_378_500_000 := by decide
example : allocation 10 10 = 4_595_000_000 := by decide
example : allocation 5 0 = 0 := by decide
example : allocation 0 10 = 0 := by decide

/-- 団体の基準額が合計以下なら按分額は総額以下（ caller-established の前提を明示）。 -/
theorem allocation_le_total (entityBasis totalBasis : Money) (h : entityBasis ≤ totalBasis) :
    allocation entityBasis totalBasis ≤ totalGrant := by
  unfold allocation
  by_cases hz : totalBasis = 0
  · rw [ite_eq_left hz]
    exact Nat.zero_le _
  · rw [ite_eq_right hz]
    have hmul : totalGrant * entityBasis ≤ totalGrant * totalBasis :=
      Nat.mul_le_mul_left totalGrant h
    have hmul' : totalGrant * entityBasis ≤ totalBasis * totalGrant := by
      simpa [Nat.mul_comm] using hmul
    exact Nat.div_le_of_le_mul hmul'

end JapanTaxLaw.RoadGrantAllocation
