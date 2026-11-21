import JapanTaxLaw.TaxAccountantFineCap300k

/-
# TaxAccountantFineCap300kSpec — independent spec for 税理士法 第六十二条

Pinned source:
  Law id: 326AC1000000237
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  sha256: 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f
  Article: 第六十二条 (raw JSON Article attr.Num = "62")
原文逐語: 「次の各号のいずれかに該当する場合には、その違反行為をした者は、三十万円以下の罰金に処する。」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specFineCap : Nat := 300_000` (三十万円) and expresses 「三十万円以下」 as
`decide (¬ specFineCap < amount)` — a STRICT `<` with negation, deliberately a
DIFFERENT operator from the implementation's non-strict `<=`.

The ONLY bridge is the universal, axiom-free theorem `agreeWithin`, proved by a
pure `simp [Nat.not_lt]` rewrite: the constructive theorem Nat.not_lt turns
`¬ 300000 < amount` into `amount <= 300000`. No `by_cases`, no `omega`, no
`Classical.choice` is used in the bridge. No implementation identifier
(`fineCap`, `withinFineCap`) appears in any independent `spec*` formula; the
agreement theorem is not an independent formula.

Variable contract: amount = 罰金の額 (Nat, 円, whole yen); 以下 is inclusive.
Not modelled (same as the implementation): 各号, the referenced articles, other
paragraphs and other articles.
-/

namespace JapanTaxLaw.TaxAccountantFineCap300k

/-- Spec-local cap: 三十万円 = 300,000 (円, Nat). Independent of the impl. -/
def specFineCap : Nat := 300_000

/-- Independent 「三十万円以下」: NOT (specFineCap < amount). Strict `<` + negation. -/
def specWithin (amount : Nat) : Bool :=
  decide (¬ specFineCap < amount)

/-- Universal, kernel-checked correspondence for every Nat amount.
    Pure constructive bridge: `simp [Nat.not_lt]` rewrites `¬ 300000 < amount`
    to `amount <= 300000`; no `by_cases`, no `omega`, no `Classical.choice`. -/
theorem agreeWithin (amount : Nat) :
    withinFineCap amount = specWithin amount := by
  unfold withinFineCap specWithin fineCap specFineCap
  simp [Nat.not_lt]

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specWithin 0 = true := by decide
example : specWithin 1 = true := by decide
example : specWithin 299_999 = true := by decide
example : specWithin 300_000 = true := by decide
example : specWithin 300_001 = false := by decide

end JapanTaxLaw.TaxAccountantFineCap300k
