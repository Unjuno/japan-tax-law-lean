import JapanTaxLaw.ForeignCorpRedemptionTaxCredit

/-! # ForeignCorpRedemptionTaxCredit spec — 独立定式 (law 362CO0000000335 / art.3)

割合適用を `num * amount / den` として独立に再記述し、限度税率を
別の補助関数で計算する。実装の識別子は使わない。 -/

namespace JapanTaxLaw.ForeignCorpRedemptionTaxCredit

def specApply (amount : Nat) (num : Nat) (den : Nat) : Nat :=
  if den = 0 then 0 else num * amount / den

def specLimit (gain : Nat) (num : Nat) (den : Nat) (ratePct : Nat) : Nat :=
  specApply gain num den * ratePct / 100

def specCredit (incomeTax : Nat) (gain : Nat) (num : Nat) (den : Nat) (ratePct : Nat) : Nat :=
  specApply incomeTax num den - specLimit gain num den ratePct

example : specCredit 100 100 1 2 20 = 40 := by decide
example : specCredit 100 100 2 2 20 = 80 := by decide

/-- 実装と独立仕様の一致: 乗法の可換性と分母 0 の場合分けのみ、公理なし。 -/
theorem spec_agrees (incomeTax : Nat) (gain : Nat) (num : Nat) (den : Nat) (ratePct : Nat) :
    credit incomeTax gain num den ratePct = specCredit incomeTax gain num den ratePct := by
  unfold credit limitedTax applyRatio specCredit specLimit specApply
  by_cases h : den = 0
  · simp [h]
  · simp [h]
    rw [Nat.mul_comm incomeTax num, Nat.mul_comm gain num]

end JapanTaxLaw.ForeignCorpRedemptionTaxCredit
