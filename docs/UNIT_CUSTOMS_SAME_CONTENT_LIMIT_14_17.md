# Unit review — 関税定率法 art.14 item 17 proviso (同内容二本以内)

Normative unit id: `NORM|4f809b7fbadedd5606d99bdd90eff711ca1b77bc66fc8a481845a6c117dba46d`

Law: 143AC0000000054 (関税定率法), revision
`143AC0000000054_20260601_508AC0000000005`,
snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「ただし、内容を同じくするものについては、そのうちの二本以内に限る。」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[25]/Article:14/Article#14/Paragraph#1/Item#17/ItemSentence/Sentence#2`.
Norm kind: **EXCEPTION** (ただし書).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The proviso limits the number of identical-content items to at most 2 (unit 本/items), not a yen amount or a period. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「関税定率法 art.14 第十七号ただし書…」 pinned to law 143AC0000000054, article locator 第十四条, needle with terminal 「。」. Full-file counts: needle 1, 二本以内 1, both in Item 17 of art.14. |
| D (decision) | PASS — audit reports `174/174 checks passed`. |
| C (competing interpretation) | 「二本」 could be misread as a money amount or a period; the surrounding text (同内容の物品の数) and the unit 本 confirm an item count. Only the quantitative scope is modelled — the main 無条件免税 rule and 政令 procedure are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsSameContentLimit.lean` — `sameContentLimit : Money := 2`,
  `withinSameContentLimit count = count ≤ 2`.
- Independent spec: `specWithin` is a structural pattern match enumerating 0/1/2
  and rejecting ≥3 — deliberately different from the inequality.
- Kernel proof: `agree_exception_scope` proves equivalence for **all** Nat counts
  (case analysis, not a finite sample); `above_limit_monotone` proves exclusion
  propagates upward; boundary theorems for 0/2/3.
- Build: `lake build` → **572 jobs, success**; axiom probe: `propext` only for the
  equivalence theorem, all boundary/monotonicity theorems axiom-free,
  no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The main 無条件免税 rule of art.14, the other items of that article, the 政令
procedure, and all other provisions of 関税定率法. This is a computable slice of
one exception unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_CUSTOMS_SAME_CONTENT_LIMIT_14_17.md` (H/T/D/C/U per finding).
