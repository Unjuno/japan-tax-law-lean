# Unit review — 揮発油税法 art. 9 (¥4,400 → ¥24,300 per kilolitre)

Normative unit id: `NORM|8bf684764da81b921477924a5e17db0d25d2ddfae535431c99302894578f927c`

Law: 332AC0000000055 (揮発油税法), revision
`332AC0000000055_20260525_506AC0000000052`, enforcement 2026-05-25,
snapshot `data/raw/332AC0000000055_20260525_506AC0000000052.law.json`,
sha256 `e5e7d4286963a6424652cc86c75341a6c64d972e4e3e7ef22670ddcf2801de9a`.

Verbatim source text: 「揮発油税の税率は、揮発油一キロリットルにつき二万四千三百円とする。」

Exact source position (from the generated queue):
`LawBody[3]/MainProvision/MainProvision[1]/Article:9/Article#9/Paragraph#1/ParagraphSentence/Sentence#1`.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The model constant is ¥24,300 charged per kilolitre of gasoline (揮発油一キロリットルにつき). The computed function `k × 24,300` is linear in the caller-supplied quantity; 第八条 課税標準 determination is out of scope. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「揮発油税法 art. 9…」 pinned to law 332AC0000000055, article locator 第九条, needle including terminal 「。」. Independent full-file walk: needle occurs **once**, numeral 「二万四千三百円」 occurs **once**, both in 第九条. |
| D (decision) | PASS — audit reports `173/173 checks passed`. |
| C (competing interpretation) | A repo-wide numeric match could mislocate the constant; this unit is pinned by law id + revision + 第九条 + structural path + source digest. Other provisions (第三条〜第十八条, 附則) are distinct norms and are NOT modelled. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/GasolineTaxRate.lean` — `ratePerKilolitre : Money := 24_300`.
- Independent spec: recursive repeated addition of ¥24,300; `agree_gasoline_tax` is a universal induction over all Nat.
- Kernel-decided boundary tests: 0, 1, 2, 3, 100 kL.
- Cross-law: `combined_gasoline_rate` relates this rate to the verified 地方揮発油税 rate (¥4,400/kL).
- Build: `lake build` → **569 jobs, success**; axiom probe: `propext` only for the induction theorem, all others axiom-free, no `sorryAx`/`Classical.choice`.

## Not modelled (exact captions from pinned law)

第三条（納税義務者）, 第八条（課税標準）, 第十条 / 第十一条（申告）,
第十四条（未納税移出）, 第十五条（輸出免税）,
第十六条（移出に係る灯油の免税）, 第十七条（戻入れの場合の揮発油税の控除等）,
第十八条（保全担保）, 附則・経過措置. All captions were dumped verbatim from
the pinned JSON and checked. This is a computable slice of one norm unit, not
an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_GASOLINE_TAX_RATE_9.md` (H/T/D/C/U per finding).
