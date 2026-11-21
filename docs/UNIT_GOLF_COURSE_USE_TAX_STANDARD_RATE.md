# Unit review — 地方税法 第七十六条(1)（ゴルフ場利用税の標準税率: 一人一日につき八百円）

Normative unit id: `NORM|f345a99128087aed87634e8963422db557c8f7daa6b17adec119fe0aceb3cdfa`

Law: 325AC0000000226 (地方税法, Local Tax Act), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「ゴルフ場利用税の標準税率は、一人一日につき八百円とする。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[1]/Article:76/Article#76/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第七十六条. `find_article_text(...,"第七十六条")` returns that article (len 173) containing the needle → article-kind locator used.

Norm kind: **EFFECT** — ゴルフ場利用税 (golf course use tax) 標準税率 (standard rate) = ¥800 per person per day (八百円).

Byte fidelity: authoritative CJK strings injected programmatically from INVENTORY/queue; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The standard rate is ¥800 per person per day; total = 800 × people × person-days. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「地方税法 第七十六条(1) golf course use tax standard rate 800円…↔ GolfCourseUseTaxStandardRate.lean」. Full audit: 221/221 checks passed. |
| D (decision) | PASS — audit reports `221/221 checks passed`. |
| C (competing interpretation) | 標準税率 is a benchmark rate; local rate variation / 税率の特例, the tax base, rate-setting procedure and exemptions are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/GolfCourseUseTaxStandardRate.lean` — `standardRateYenPerPersonPerDay=800`, `standardTaxYen people days := 800 * (people * days)`.
- Independent spec: `specTaxYen people days := Nat.rec 0 (fun _ acc => acc + 800) (people * days)` — repeated addition, a distinct formulation from multiplication.
- `mul_eq_accumulate` proves `800*k = k` accumulations of 800 by axiom-free induction; `agree_standard_tax` is universal over all people/days and axiom-free.
- Boundary checks: 1 person/1 day = 800; 2 people/3 days = 4800.
- Build: `lake build` → full build success (713 jobs); both theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

Tax base, rate-setting procedure, exemptions, local rate variation/税率の特例, other paragraphs and other articles. Computable slice of one EFFECT norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_GOLF_COURSE_USE_TAX_STANDARD_RATE.md`.
