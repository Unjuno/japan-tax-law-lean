# Unit review — 関税定率法 第二十条の二(3)（準用）EXCEPTION

Normative unit id: `NORM|04057a73ecf3e5e7f56460b7b280eee517956be5c9b69d8d845cfed58189c76f`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「この場合においては、第十三条第七項ただし書の規定を準用する。」 — an EXCEPTION: the 第十三条第七項ただし書 proviso is read in for trigger case この場合, here in article 第二十条の二(3). Sub-terms (第十三条第七項ただし書 / この場合) are extracted programmatically from the needle, never hand-typed. NOTE: this is a distinct norm unit from the 第十七条(5) application of the same proviso — different article, source path, and queue id; the needle is unique in the whole law.

Exact source position: `LawBody[1]/MainProvision/MainProvision[36]/Article:20_2/Article#20_2/Paragraph#3/ParagraphSentence/Sentence#2` — Article 第二十条の二, caption （軽減税率適用貨物の用途外使用の制限等）. `find_article_text(...,"第二十条の二")` len 570 with needle → article-kind locator.

Norm kind: **EXCEPTION** — cross-article proviso read in for a trigger case.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The 第十三条第七項ただし書 applies in この場合, not otherwise. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt20No2Art13ProvisoException.lean. |
| D | PASS — transcription audit 433/433. |
| C | Only source provision identity (13/7/proviso) and trigger-case discrimination modeled. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt20No2Art13ProvisoException.lean` — `Trigger` (thisCase/other), `withinException` Bool, `sourceArticle=13`, `sourceParagraph=7`, `sourceIsProviso=true`.
- Independent spec: `SpecWithinException` propositional predicate, representationally distinct from the Bool function; `agree_within_exception` axiom-free (cases/rfl, no simp/propext/decide).
- Build: full lake build success (1333 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `law_article` dependency (この場合) as `unresolved_underdetermined` / `sufficient=false`. It is recorded honestly; no cross-law constant is claimed and no bare 15-digit ID is treated as a resolved dependency.

## Not modelled
Substantive content of 第十三条第七項ただし書 and この場合, other articles, legal correctness. Computable slice of one EXCEPTION norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART20_NO2_ART13_PROVISO_EXCEPTION.md`.
