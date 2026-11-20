# Unit review — 日米地位協定関税特例法 art.12(6)（関税法の適用について外国貨物とみなす）

Normative unit id: `NORM|9a9d622241c1736e9375241d59f25ec74ed16132c017d586ca0a7e96c9fd5751`

Law: 327AC0000000112 (日米地位協定関税特例法), revision
`327AC0000000112_20190317_429AC0000000013`,
snapshot `data/raw/327AC0000000112_20190317_429AC0000000013.law.json`,
sha256 `ca251c418b17aef8e9205d8f53417c14214ee9840579bf69e75828e4d9cc1a6d`.

Verbatim source text: 「第一項の規定の適用を受ける物品は、関税法の適用については、同法の外国貨物とみなす。」

Exact source position (from the generated queue):
`LawBody[1]/MainProvision/MainProvision[11]/Article:12/Article#12/Paragraph#6/ParagraphSentence/Sentence#1`.
Norm kind: **DEEMING** (cross-law reference with explicit scope limitation to 関税法).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | Goods receiving the application of art.12(1) are deemed 外国貨物 of 関税法, but ONLY for purposes of applying 関税法 (「関税法の適用については」); the deeming does not leak into other statutes' application. Unit: propositional status; domain Bool × LegalContext. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` check 「日米地位協定関税特例法 art.12(6)…↔ UsForcesDeemedForeignGoods.lean」 pinned to law 327AC0000000112, article locator 第十二条, verbatim needle with terminal 「。」. Full-file count 1, located in Article 12 / Paragraph 6. |
| D (decision) | PASS — audit reports `179/179 checks passed`. |
| C (competing interpretation) | The phrase 「関税法の適用については」 is an explicit scope limiter, so modeling the deeming as active only under `customsLaw` is faithful; a global 外国貨物 status would over-approximate. The substantive 関税法 definition of 外国貨物 is intentionally not modelled — the unit's content is the scoped deeming relation itself. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/UsForcesDeemedForeignGoods.lean` — `LegalContext` (customsLaw/otherLaw), `deemedForeignGoods receivesParagraph1 ctx = receivesParagraph1 && (ctx == customsLaw)`.
- Independent spec: `specDeemedForeignGoods` uses a case analysis on context, consulting the paragraph-1 flag only under 関税法 — different formulation from boolean AND. `agree_deemed_foreign_goods` is universal over all Bool × LegalContext inputs.
- Kernel proofs: `no_deeming_under_other_law`, `no_deeming_without_paragraph1`, `deeming_monotone_customs`.
- Build: `lake build` → full build success (587 jobs); all 4 theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive content of art.12(1), the 関税法 definition of 外国貨物, other paragraphs, the status-of-forces treaty background and 政令 details. This is a computable slice of one cross-law DEEMING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/ADVERSARIAL_US_FORCES_DEEMED_FOREIGN_GOODS_12_6.md` (H/T/D/C/U per finding).
