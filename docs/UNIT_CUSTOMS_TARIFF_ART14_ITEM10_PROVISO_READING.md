# Unit review — 関税定率法 第十四条(1) 第14号（読替え）READING

Normative unit id: `NORM|490be20c34299cb9ee5c87382e21241fd3926621fe4583fabc1dd631efcecddb`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「この場合においては、第十号ただし書の規定を準用する。」 — the proviso of Item 10 is read into the case of Item 14.

Exact source position: `LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/Paragraph#1/Item#14/ItemSentence/Sentence#2` — Article 第十四条 (Num=14), caption （無条件免税）. `find_article_text(...,"第十四条")` len 1655 with needle. Item 10 structurally confirmed to carry a proviso (ただし、introducer).

Norm kind: **READING (準用)** — a cross-reference slice. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Item 14 reads in Item 10's proviso; other cases do not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt14Item10ProvisoReading.lean. |
| D | PASS — transcription audit 388/388. |
| C | Only cross-reference structure modeled; item/proviso substance out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt14Item10ProvisoReading.lean` — Case, ReadSource, appliesViaReading, readSourceFor.
- Independent spec: `SpecTrigger` / `SpecReadsItem10`; two axiom-free agreement theorems (cases/constructor/rfl, no simp/propext).
- Build: full lake build success (1219 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Item substance, proviso substance, legal effect mechanics, legal correctness. Computable slice of one READING norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART14_ITEM10_PROVISO_READING.md`.
