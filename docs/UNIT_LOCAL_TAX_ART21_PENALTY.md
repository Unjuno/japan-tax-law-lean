# Unit review — 地方税法 第二十一条(1)（罰則: 三年以下の拘禁刑又は二十万円以下の罰金）

Normative unit id: `NORM|c44267260dc35641899361b7ab7e63e06f22ace473bef4c3a81b22a33b50fd14`

Law: 325AC0000000226 (地方税法, Local Tax Act), law number 昭和二十五年法律第二百二十六号,
law_type Act (法律), revision `325AC0000000226_20261101_508AC0000000002` (from INVENTORY
`current_revision.law_revision_id`, matched raw), snapshot
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json`,
sha256 `3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53`.

Verbatim source text: 「動した者は、三年以下の拘禁刑又は二十万円以下の罰金に処する。」

Exact source position:
`LawBody[2]/MainProvision/MainProvision[0]/Article:21/Article#21/Paragraph#1/ParagraphSentence/Sentence#1` — MainProvision Article 第二十一条. `find_article_text(...,"第二十一条")` returns that article (len 251) containing the needle → article-kind locator used.
Norm kind: **penalty clause** (queue kind=CONDITION). Numeric ceilings derived from 原文: `maxImprisonmentMonths=36` (三年以下), `maxFineYen=200,000` (二十万円以下), both 以下 = inclusive; 「又は」 = alternative (imprisonment OR fine), not cumulative.

Byte fidelity: all authoritative CJK strings injected programmatically; byte-fidelity confirmed (`quote equal: True`, title/lawnum present, U+6EDE=0).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The clause imposes imprisonment ≤ 36 months OR a fine ≤ ¥200,000 (inclusive ceilings, alternative punishments). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「地方税法 第二十一条(1) penalty…↔ LocalTaxArt21Penalty.lean」. Full audit: 216/216 checks passed. |
| D (decision) | PASS — audit reports `216/216 checks passed`. |
| C (competing interpretation) | Only the numeric ceilings + alternative relationship are modeled. The violation condition (動した者), substantive rule, other paragraphs/articles and judicial sentencing are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/LocalTaxArt21Penalty.lean` — inductive `Penalty` (imprisonment months / fine yen), `withinLimits : Penalty -> Bool`, following the established `UsForcesDutyFreePenalty` pattern.
- Independent spec: `specWithinLimits : Penalty -> Prop` using successor-strict form (`m < succ 36`, `y < succ 200000`); `agree_within_limits` is universal over all penalties. Depends on `[propext]` (standard core axiom; forbidden `sorryAx`/`Classical.choice` absent).
- Boundary checks: imprisonment 36 ok / 37 fails; fine 200,000 ok / 200,001 fails.
- Build: `lake build` → full build success (698 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The violation condition (動した者), the preceding article's substantive rule, other paragraphs/articles, and judicial sentencing. Computable slice of one penalty norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART21_PENALTY.md`.
