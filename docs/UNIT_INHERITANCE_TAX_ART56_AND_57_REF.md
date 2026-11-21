# Unit review — 相続税法 第五十六条及び第五十七条（STRUCTURE）

Normative unit id: `NORM|9444b08b151252b8c7527f222f0241b42b4cac0e133134e92ce2decf09ab8612`

Law: 325AC0000000073 (相続税法), law number 昭和二十五年法律第七十三号,
law_type Act (法律), revision `325AC0000000073_20260401_506AC0000000008` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`,
sha256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`.

Verbatim source text: 「第五十六条及び第五十七条」 — an article-title cross-reference heading (Articles 56 and 57, both numbers extracted structurally from the needle).

Exact source position:
`LawBody[3]/MainProvision/MainProvision[6]/Article:56:57/Article#56:57/ArticleTitle` — this is an **ArticleTitle** heading (not article body text); `find_article_text` sees main-provision text only and does not return it (verified len 0) → **file-kind** transcription locator used. Needle verbatim-unique in whole law.

Norm kind: **STRUCTURE** — an article-title cross-reference. The heading groups two articles under a common cross-reference via 「及び」 ("and"). The computable slice models the referenced article-number set {56, 57} and a membership predicate. Both numbers extracted structurally from the verbatim needle (第…条 pattern + kanji_to_int). Substantive provisions of Articles 56/57 are NOT MODELLED (separate units).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The heading references exactly Articles 56 and 57; a number is referenced iff it is 56 or 57. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind check 「inheritance tax art.56 and 57 title cross-reference…↔ InheritanceTaxArt56And57Ref.lean」. Full audit: 309/309 checks passed. |
| D (decision) | PASS — audit reports `309/309 checks passed`. |
| C (competing interpretation) | Only cross-reference membership is modeled. Substantive provisions of Articles 56/57, other headings, legal correctness are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/InheritanceTaxArt56And57Ref.lean` — firstArticle=56, secondArticle=57, referenced(n) := n=56 ∨ n=57, articles_distinct.
- Independent spec: `SpecReferenced` list membership in [56,57], `agree_referenced` universal axiom-free; boundary theorems referenced_56/referenced_57/not_referenced_55/not_referenced_58.
- GENERATOR BUG FIXED: initial generator left bare `N1`/`N2` undefined identifiers (replacement targeted wrong placeholders); reproduced via byte-fidelity check, rewrote file with 56/57 substituted, re-verified.
- Build: `lake build` → full build success (977 jobs); unit build 5 jobs; 5 theorems axiom-free, 1 `[propext]`; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Substantive provisions of Articles 56/57, other headings, legal correctness. Computable slice of one STRUCTURE norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART56_AND_57_REF.md`.
