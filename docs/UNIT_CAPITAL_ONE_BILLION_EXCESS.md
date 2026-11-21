# Unit review — 国税臨時特例法 art.7(1)(1)イ（資本金十億円超）

Normative unit id: `NORM|3b1013fc326dbfcb98839b2a2a363fb2569d565af04514f05fe362ce89d7d027`

Law: 502AC0000000025 (新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律),
revision `502AC0000000025_20260401_508AC0000000012`, snapshot
`data/raw/502AC0000000025_20260401_508AC0000000012.law.json`, sha256
`410e0d9715f6ea70fe2a9ca6c986a70abec48a3cbabe625fb54aabaa18efaa23`
(108,764 bytes, 0 CRLF; hash independently recomputed by the adversarial reviewer).

Verbatim source text: 「資本金の額又は出資金の額が十億円を超える法人」

Exact source position:
`law_full_text/LawBody/MainProvision/Article[Num=7]/Paragraph[1]/Item[一]/Subitem1[イ]/Subitem1Sentence/Sentence#1`.
The needle is verbatim-unique in the whole law (count = 1), confirmed by an
independent recursive walk. Norm kind: **CONDITION** (capital/contribution
strictly exceeds 十億円 = ¥1,000,000,000; 「超える」 is strict `>`, not 以上 `>=`).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This clause defines a capital/contribution threshold: amount > ¥1,000,000,000 (十億円を超える, strict), a definitional subitem of 大規模法人 in art.7(1)(1)イ. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` file-kind-independent check 「国税臨時特例法 art. 7(1)(1)（資本金十億円超）↔ CapitalOneBillionExcess.lean」 pinned to law 502AC0000000025, revision 502AC0000000025_20260401_508AC0000000012, verbatim needle (unique in whole law). Full audit: 196/196 checks passed. |
| D (decision) | PASS — audit reports `196/196 checks passed`; needle located uniquely in the scoped Article 第七条. |
| C (competing interpretation) | Reading 「超える」 as inclusive 以上 would admit exactly ¥1,000,000,000; the kernel-decided boundary theorem `floor_exclusive` rejects that reading. The condition is a definitional subitem gating a proviso exception; the legal effect itself is out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The applicability of the 大規模法人 definition and the proviso exception require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Implementation: `JapanTaxLaw/CapitalOneBillionExcess.lean` — `capitalBillionFloor=1_000_000_000`, `exceedsCapitalBillion amount := decide (floor < amount)`.
- Independent spec: `specExceedsCapital amount := decide (Nat.succ specCapitalBillionFloor <= amount)` (successor-based strict bound, distinct operator); `agree_capital_billion` universal over all Nat amounts, kernel-checked with `by omega`.
- Boundary theorems: `floor_exclusive` (1,000,000,000 fails — 超え strict), `first_above` (1,000,000,001 qualifies), `zero_false`.
- Tests: 10 kernel-decided examples covering zero, small input, both boundary sides, Nat identity, and impl/spec agreement; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The legal effect gated by this condition (the 欠損金繰戻し還付 restriction in the
art.7 proviso), the rest of art. 7, other items, and all enforcement rules.
This is a computable slice of one CONDITION norm unit, not an article-level or
law-level completion claim.

## Adversarial review

Independent adversarial findings are recorded in
`docs/adversarial/reviews-capital-one-billion.md` (H/T/D/C/U per check). No
defect in the modelled norm was found; F1 records the evidence-chain gap
(kernel attestation pending a green CI run) and F2 a minor scope disclosure,
both addressed in this branch. No legal correctness is claimed.
