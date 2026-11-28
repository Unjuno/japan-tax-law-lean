import JapanTaxLaw.CovidLocalTaxGrantThousandRounding

/-
# CovidLocalTaxGrantThousandRoundingSpec — コロナ減収補塡特例交付金省令 2(1) の独立定式

Pinned: law 504M60000008016, revision 504M60000008016_20220318_000000000000000,
Article 2 Paragraph 1; needle 「…五百円未満の端数…切り捨て、五百円以上
千円未満の端数…千円として計算する」.

Independent restatement: a remainder below 500 is truncated; a remainder from
500 to 999 is raised to the next 1000. Definitions use their own numerals and
identifiers; agreement is a separate bridge.
-/

namespace JapanTaxLaw.CovidLocalTaxGrantThousandRounding

/-- 独立定式: 五百 = 500。 -/
def specLower : Nat := 500

/-- 独立定式: 千 = 1000。 -/
def specUpper : Nat := 1000

/-- 独立定式: 二段階の端数丸め（impl 識別子は使わない）。 -/
def specRound (amount : Nat) : Nat :=
  let r := amount % specUpper
  if r < specLower then amount - r else amount - r + specUpper

theorem agreeLower : lowerBand = specLower := by
  unfold lowerBand specLower
  rfl

theorem agreeUpper : upperBand = specUpper := by
  unfold upperBand specUpper
  rfl

theorem agreeRound (amount : Nat) :
    roundAmount amount = specRound amount := by
  unfold roundAmount specRound
  rw [agreeLower, agreeUpper]

example : specRound 499 = 0 := by decide
example : specRound 500 = 1000 := by decide

end JapanTaxLaw.CovidLocalTaxGrantThousandRounding
