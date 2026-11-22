# Unit review — 関税定率法 第十七条(5)（第十三条第七項ただし書の準用）EXCEPTION

Normative unit id: `NORM|13bac8bcfa07d6e3fcf0861aea41480df8ba7093311535bdf2e8e81a95a78304`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「第十三条第七項ただし書の規定は、前項の規定により関税を徴収する場合について準用する。」 — an EXCEPTION: the proviso (ただし書) of article 13 paragraph 7 is read in (準用) for the case where customs duty is collected under the preceding paragraph. The verbatim is injected from the authoritative queue, never hand-typed or "corrected".

Exact source position: `LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#5/ParagraphSentence/Sentence#1` — Article 第十七条 (Num=17), caption （再輸出免税）. `find_article_text(...,"第十七条")` len 1032 with needle → article-kind locator.

Norm kind: **EXCEPTION** — a cross-article proviso read in for a specific collection case. Source identity: article 13, paragraph 7, proviso.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The 第十三条第七項ただし書 applies in the preceding-paragraph duty-collection case, not otherwise. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt13Para7ProvisoException.lean. |
| D | PASS — transcription audit 410/410. |
| C | Only source provision identity (13/7/proviso) and trigger-case discrimination modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt13Para7ProvisoException.lean` — `CollectionCase` (prevParaCollection/other), `withinException`, `sourceArticle=13`, `sourceParagraph=7`, `sourceIsProviso=true`.
- Independent spec: `SpecWithinException` propositional predicate, representationally distinct from the Bool function; `agree_within_exception` axiom-free (cases/rfl, no simp/propext/decide).
- Build: full lake build success (1288 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `law_article` dependency (前項) as `unresolved_underdetermined` / `sufficient=false`. It is recorded honestly; no cross-law constant is claimed and no bare 15-digit ID is treated as a resolved dependency.

## Not modelled
Substantive content of 第十三条第七項ただし書 and 前項, how duty is collected, other articles, legal correctness. Computable slice of one EXCEPTION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART13_PARA7_PROVISO_EXCEPTION.md`.
