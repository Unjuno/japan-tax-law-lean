# Unit review — 地方税法 第四十八条から第五十条まで (ArticleTitle) STRUCTURE

Normative unit id: `NORM|76351db6bc4ddafec1d36f9bb70e5fe0fa5aa6eafa4db90ea65f76e66c3050ee`

Law: 325AC0000000226 (地方税法), Act, revision 325AC0000000226_20261101_508AC0000000002.
SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53.

Verbatim source text (injected from the queue, not hand-typed): 「第四十八条から第五十条まで」
Full Article flat text (resolved from raw JSON): 「第四十八条から第五十条まで削除」

Exact source position: `LawBody[2]/MainProvision/MainProvision[1]/Article:48:50/Article#48:50/ArticleTitle` — the needle IS the ArticleTitle; the article's flat text adds 削除 (deleted).

Norm kind: **STRUCTURE** — a repeal/deletion note. The article numbers 48 and 50 were parsed programmatically from the kanji numerals 第四十八条/第五十条 in the needle (no hand-typed CJK).

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Articles 48, 49 and 50 lie in the 「第四十八条から第五十条まで」 range; 47 and 51 lie outside it. |
| T | `scripts/ci/transcription_audit.py` article-kind check for LocalTaxArt48To50DeletedRange.lean (needle = ArticleTitle; full Article flat text also pinned). |
| D | PASS — transcription audit 469/469. |
| C | Only the article-number range discrimination of the title is modeled; the legal effect of the repeal, cross-law propagation and legal correctness are out of scope. The inclusive reading 「から…まで」 (48/49/50) is an interpretive choice left to human legal review. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/LocalTaxArt48To50DeletedRange.lean` — Bool `inDeletedRange` (if-chain on 48/49/50) with five boundary theorems.
- Independent spec: `SpecDeletedRange` Prop disjunction, representationally distinct; `spec_lo/mid/hi` and `agree_lo/agree_hi` axiom-free (rfl, left/right).
- Build: full lake build success (1537 jobs); all ten unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Legal effect of the repeal, cross-law propagation, legal correctness.

## Dependencies (honest)
The queue records two `law_article` dependencies (第四十八条, 第五十条) with `resolution=unresolved_underdetermined` and empty `law_id`/`enforcement_version`. These are internal references within the same pinned 地方税法 (325AC0000000226, enforcement 2026-11-01) per the unit's own provenance; full machine resolution beyond the 15-digit law id is NOT claimed by this unit, and no external-law constant is introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART48_TO_50_DELETED_RANGE.md`.
