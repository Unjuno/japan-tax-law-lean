# Unit review — 関税定率法 第十七条(2)（読替え）READING

Normative unit id: `NORM|760484ebb1fe349e9ed493fddb34acc8ef4aace8f5092589dfcf179c2f827d25`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号, law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005`.
Verbatim source text: 「第十三条第三項の規定は、前項の規定により関税を免除する場合について準用する。」 — the provisions of Article 13(3) are read into the case where duty is exempted under the preceding paragraph.

Exact source position: `LawBody[1]/MainProvision/MainProvision[30]/Article:17/Article#17/Paragraph#2/ParagraphSentence/Sentence#1` — Article 第十七条 (Num=17). `find_article_text(...,"第十七条")` len 1032 with needle → article-kind locator. Preceding Paragraph 1 structurally confirmed.

Norm kind: **READING (準用)** — a cross-reference slice. All statutory strings injected from the queue (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The duty-exemption case reads in Article 13(3); other cases do not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for CustomsTariffArt17DutyExemptionReading.lean. |
| D | PASS — transcription audit 395/395. |
| C | Only cross-reference structure modeled; Article 13(3)/exemption substance out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt17DutyExemptionReading.lean` — Case, ReadSource, appliesViaReading, readSourceFor.
- Independent spec: `SpecTrigger` / `SpecReadsArticle13`; two axiom-free agreement theorems (cases/constructor/rfl, no simp/propext).
- Build: full lake build success (1240 jobs); all unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Article 13(3) substance, exemption substance, legal effect mechanics, legal correctness. Computable slice of one READING norm unit.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART17_DUTY_EXEMPTION_READING.md`.
