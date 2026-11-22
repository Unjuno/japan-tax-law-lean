# Unit review — 関税定率法 第十九条(4)（準用）READING

Normative unit id: `NORM|662ecdbb3874ed176834a6def2924dbe0518892f9339905e6ab3b3e442775462`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「この場合においては、第十三条第七項但書の規定を準用する。」 — a READING (準用): in the trigger case この場合, the proviso (但書) of article 13 paragraph 7 (第十三条第七項但書) is read in. The source's own **但書** spelling is preserved (this unit uses 但書, not ただし書). The verbatim and its sub-terms are extracted from the authoritative queue, never hand-typed or "corrected".

Exact source position: `LawBody[1]/MainProvision/MainProvision[32]/Article:19/Article#19/Paragraph#4/ParagraphSentence/Sentence#2` — Article 第十九条 (Num=19), caption （輸出貨物の製造用原料品の減税、免税又は戻し税等）. `find_article_text(...,"第十九条")` len 2200 with needle → article-kind locator.

Norm kind: **READING** — cross-article proviso 準用 with source article 13, paragraph 7, proviso flag, and trigger case.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | In この場合, the 第十三条第七項但書 provisions are read in; outside it they are not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt19Art13Para7ProvisoReading.lean. |
| D | PASS — transcription audit 422/422. |
| C | Only the cross-reference structure (source provision identity, trigger case) modeled; substantive content out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt19Art13Para7ProvisoReading.lean` — `Provision` (art13Para7Proviso), `TriggerCase` (thisCase/other), `appliesViaReading`, `sourceArticle=13`, `sourceParagraph=7`, `sourceIsProviso=true`.
- Independent spec: `SpecApplies` explicit case-and-provision conjunction, representationally distinct from the implementation function; `agree_applies_via_reading` axiom-free (cases/rfl, no simp/propext/decide).
- Build: full lake build success (1300 jobs); all six unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Dependencies
The queue records one `law_article` dependency (この場合) as `unresolved_underdetermined` / `sufficient=false`. It is recorded honestly; no cross-law constant is claimed and no bare 15-digit ID is treated as a resolved dependency.

## Not modelled
Substantive content of 第十三条第七項但書, establishment of この場合, other reading rules, legal correctness. Computable slice of one READING norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART19_ART13_PARA7_PROVISO_READING.md`.
