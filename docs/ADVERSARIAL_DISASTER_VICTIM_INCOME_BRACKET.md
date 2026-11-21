# Independent adversarial review — 災害被害者租税減免等施行令 附則第三条（四百五十万円超六百万円以下）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it independently re-derived the pin hash, real revision, law
identity, article/paragraph/item chain, needle uniqueness, amount decoding,
strictness, spec independence and proof soundness from the pinned raw JSON,
INVENTORY, the queue and the three Lean files. It did not run `lake build`
(per instruction) and modified no repository files.

## Verdict: NO CONCRETE FINDINGS

All prior-unit failure modes (fabricated revision, false law/article label,
wrong amount, circular spec, unjustified axiom) were actively tested and
refuted. The unit is faithful and sound.

## Independent evidence

| Check | Independent result | Matches claim |
|---|---|---|
| sha256 of `data/raw/322CO0000000268_20251201_507CO0000000120.law.json` | `f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c`, 191,809 bytes | ✅ |
| File exists on disk | yes | ✅ |
| INVENTORY `current_revision.law_revision_id` | `322CO0000000268_20251201_507CO0000000120` | ✅ |
| INVENTORY `source_file` / `source_sha256` | `data/raw/…0120.law.json` / `F6FE1C…A21C` | ✅ (case-insensitive) |
| Raw `revision_info.law_revision_id` | `322CO0000000268_20251201_507CO0000000120` | ✅ |
| Raw `law_title` / `law_type` / `abbrev` | 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令） / `CabinetOrder` / 災害減免法の施行に関する政令 | ✅ (Cabinet Order = 政令, not 法律) |
| Needle count in whole law | **1** (verbatim-unique) | ✅ |
| Structural chain of needle | `Law > LawBody[32] > SupplProvision > Article(Num=3, ArticleTitle=第三条) > Paragraph(Num=5) > Item(Num=2) > ItemSentence > Column(Num=1) > Sentence(Num=1)` | ✅ |
| 附則 attachment | `in_suppl=True`; queue `provision=SUPPLEMENTARY` | ✅ |
| Queue record | kind=`CONDITION`, article=`3`, paragraph=`5`, item=`2`, `unhandled_conditions=[]` | ✅ |

Lean evidence:
- impl `:42-49` — `lowerBoundYen=4_500_000`, `upperBoundYen=6_000_000`, `inBracket := lowerBoundYen < x ∧ x ≤ upperBoundYen`.
- spec `:28-39` — `specInBracket := Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen`; `agree_bracket` universal over all `x` via `Nat.succ_le_of_lt` / `Nat.lt_of_succ_le`.
- spec `:42-63` — four boundary theorems + `bounds_decoded`, all `by decide` / `rfl`.
- `TaxFinance.lean:29` — `abbrev Money := Nat`.
- `transcription_audit.py:1263-1271` — file-kind locator (needed because `find_article_text` sees main only); verbatim-unique needle; direct execution returned `contains: True`, `needle == queue_text: True`.
- grep for `sorry|admit|axiom|Classical|choice|unsafe` across impl/spec: **no matches**.

## Structured verdict (H / T / D / C / U)

| ID | H (falsifiable hypothesis) | T (reproduction) | D (decision) | C (competing interpretation) | U (uncertainty) |
|---|---|---|---|---|---|
| H1 | revision id or snapshot fabricated | hashlib + INVENTORY + on-disk walk + raw `revision_info` | FAIL (refuted) — appears in INVENTORY, on disk, and raw JSON; sha256 exact | none plausible | none |
| H2 | false article label "附則第三条" | recursive structural walk with ancestor chain | FAIL (refuted) — Article Num=3, ArticleTitle=第三条, in SupplProvision at LawBody[32] | raw ArticleTitle literal is just 第三条 (附則 from parent); compound label 附則第三条 accurate | none |
| H3 | wrong amount / strictness | Japanese numeral decode + source bytes | FAIL (refuted) — 四百五十万円 = 450×10,000 = 4,500,000; 六百万円 = 600×10,000 = 6,000,000; 超え = strict >; 以下 = ≤ | none | none |
| H4 | spec circular / not independent | read spec vs impl | FAIL (refuted) — successor form succ 4500000 ≤ x is distinct; equivalence kernel-proved universally | independence is presentational, not semantic; proof universal and sound | none |
| H5 | unjustified axioms / sorry / Classical.choice / unsound decide | grep + inspect proofs | FAIL (refuted) — none found; `by decide` kernel-reduces; lemmas standard sound | none | nil |
| H6 | `Nat` unsound for estimated income | check `Money` | FAIL (refuted) — `Money := Nat`; whole-yen domain stated | 見積額 is an estimate, still in whole yen | nil |
| H7 | audit wrong locator / false PASS | read check + run directly | FAIL (refuted) — file locator correct (main-only finder); needle unique; check PASS | none | none |

## Interpretive notes (not findings)

- **Boundaries:** confirmed exactly `4,500,000 < x ∧ x ≤ 6,000,000`. Boundary theorems
  correct: `lower_exclusive` (4,500,000 out), `first_qualifying` (4,500,001 in),
  `upper_inclusive` (6,000,000 in), `above_upper` (6,000,001 out).
- **Scope honesty:** the needle is one Item defining a class of 被災給与所得者; docs
  explicitly exclude the substantive law, gated benefit, 「災害時」 timing, other
  items/paragraphs and 省令. Only the income-interval predicate is modeled; no
  law-level completion claim.
- **Taxonomy:** queue kind=CONDITION appropriate (class-defining condition);
  confirmed by authoritative queue record.
- **Residual U (not findings):** U1 — reviewer did not run `lake build` per
  instruction; verification by close reading, compile risk negligible (core Nat
  lemmas + decide). U2 — no human legal-opinion review; this audit covers source
  fidelity, scope honesty and proof soundness only.

## Closing

No soundness break, wrong pin, transcription error, circular proof, wrong law
identity, wrong article label, fabricated revision, or boundary error remains.
No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
