# Unit review — とうもろこし関税割当省令 art.1（提出部数は一通）

Normative unit id: `NORM|b8a8b36b8a88d17067f380b89d2af71d86e63baac7cdfcd834c96a9bc4344894`

Law: 340M50010000013 (とうもろこし等の関税割当制度に関する省令), MinisterialOrdinance, revision
`340M50010000013_20220401_504M60000200005`, snapshot
`data/raw/340M50010000013_20220401_504M60000200005.law.json`, sha256
`bffc3255bd51f8e34dc4ca4463aa05bb6e75d9c174f5f644208df706820a2ba3`.

Verbatim source text: 「関税割当制度に関する政令（以下「令」という。）第二条第一項の関税割当申請書の様式は別記様式第一によるものとし、その提出部数は一通とする。」 (verbatim-unique).
Kind: **CONDITION** — the application must be submitted in exactly one copy.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The prescribed copy count for the tariff-quota application is exactly one. |
| T (reproduction) | Durable pin `data/TRANSCRIPTION_PINS/QuotaApplicationCopyCountOne.json`: law 340M50010000013, article 第一条, verbatim needle unique. The source numeral 一 is structural (excluded from `spec_literals`); an explicit independent `int_to_kanji(1) = 一` check plus the verbatim pin carry the source audit. |
| D (decision) | PASS — needle located uniquely in scoped Article 第一条; one copy included, zero and two rejected. |
| C (competing interpretation) | Reading 一通 as "at least one" would admit two copies; `two_false` rejects that. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The prescribed form (別記様式第一), application content, other paragraphs and enforcement rules require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `submissionCopies=1`, `isPrescribedCopies n := decide (n == 1)`.
- Independent spec: own constant, predicate with strict inequalities `n < 2 && 0 < n`; universal `agree_copies` by case analysis, axiom-free.
- Boundary examples: 1 true, 0 false, 2 false.
- Tests: 5 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled

Prescribed form, application content, other paragraphs and enforcement rules.
This is a computable slice of one numeric copy-count condition.

## Adversarial review

See `docs/adversarial/reviews-quota-copy-count-one.md` (H/T/D/C/U per check).
No legal correctness claimed; human legal review pending.
