import JapanTaxLaw.TaxAccountantPenaltyCap

/-
# TaxAccountantPenaltyCapSpec — independent spec for 税理士法 第六十四条

Pinned source:
  Law id: 326AC1000000237
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  sha256: 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f
  Article: 第六十四条 (attr.Num = "64")
  原文逐語: 「次の各号のいずれかに該当する者は、百万円以下の過料に処する。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specPenaltyCap : Nat := 1_000_000` (百万円) and expresses 「百万円以下」 as
`decide (¬ amount > specPenaltyCap)` — a STRICT `>` with negation, deliberately
a DIFFERENT operator from the implementation's non-strict `<=`.

The ONLY bridge between the two is the universal kernel-checked theorem
`agreePenaltyCap`, proved with `omega`. No implementation identifier
(`penaltyCap`, `withinPenaltyCap`) appears in any independent formula above;
the agreement theorem is not an independent formula.

Variable contract: amount = 過料の額 (Nat, 円, whole yen); 以下 is inclusive.
Not modelled (same as the implementation): 各号, 第五十三条/第五十九条
violations, 報告/検査 facts, other paragraphs and other articles.
-/

namespace JapanTaxLaw.TaxAccountantPenaltyCap

/-- Spec-local cap: 百万円 = 1,000,000 (円, Nat). Independent of the impl. -/
def specPenaltyCap : Nat := 1_000_000

/-- Independent 「百万円以下」: NOT (amount > 百万円). Strict `>` + negation. -/
def specWithin (amount : Nat) : Bool :=
  decide (¬ amount > specPenaltyCap)

/-- Universal, kernel-checked correspondence for every Nat amount.
    This is the ONLY impl/spec bridge (omega converts `¬ amount > 1_000_000`
    to `amount <= 1_000_000`). -/
theorem agreePenaltyCap (amount : Nat) :
    withinPenaltyCap amount = specWithin amount := by
  unfold withinPenaltyCap specWithin penaltyCap specPenaltyCap
  by_cases h : amount <= 1_000_000
  · have hn : ¬ amount > 1_000_000 := by omega
    simp [h, hn]
  · have hn : amount > 1_000_000 := by omega
    simp [h, hn]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 999_999 = true := by decide
example : specWithin 1_000_000 = true := by decide
example : specWithin 1_000_001 = false := by decide

end JapanTaxLaw.TaxAccountantPenaltyCap
