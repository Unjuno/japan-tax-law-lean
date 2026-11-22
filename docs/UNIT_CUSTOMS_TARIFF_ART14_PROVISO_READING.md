# Unit review — 関税定率法 第十四条(1) 第11号（読替え）READING

Normative unit id: `NORM|1808965ba8548637956b182cc69e43ba66f490beb0479b631d44d6e9f3f15544`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「この場合においては、前号ただし書の規定を準用する。」 — the proviso of the preceding item (Item 10) is read into the present case (Item 11).

Exact source position: `LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/Paragraph#1/Item#11/ItemSentence/Sentence#2` — Article 第十四条 (Num=14), caption （無条件免税）. `find_article_text(...,"第十四条")` len 1655 with needle. Item 10 structurally confirmed to carry a proviso (ただし、introducer).

Norm kind: **READING (準用)** — a cross-reference slice. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Item 11 reads in the preceding item's proviso; other cases do not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt14ProvisoReading.lean. |
| D | PASS — transcription audit 384/384. |
| C | Only cross-reference structure modeled; proviso substance and Item 11 substance out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt14ProvisoReading.lean` — Case, ReadSource, appliesViaReading, readSourceFor.
- Independent spec: `SpecTrigger` / `SpecReadsProviso`; two axiom-free agreement theorems (constructor/cases/rfl; an initial simp version was found propext-dependent and corrected).
- Build: full lake build success (1216 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Proviso substance, Item 11 substance, legal effect mechanics, legal correctness. Computable slice of one READING norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART14_PROVISO_READING.md`.
