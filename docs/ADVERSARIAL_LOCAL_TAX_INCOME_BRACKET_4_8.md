# Independent adversarial review — 地方税法 第七十二条の二十四の七(1)第三号（年四百万円超年八百万円以下）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written under D:\CodexData\Temp\opencode and deleted;
no repository file modified; `lake build` not run by reviewer.

## Verdict: NO FINDINGS — all 6 verification tasks PASS.

| # | H (hypothesis to falsify) | T (reproduction) | D |
|---|---|---|---|
| 1 | sha256 wrong / file fabricated | `hashlib.sha256(raw.read_bytes())` | PASS — `3dd29e00…68d53`, 12,181,725 B; on disk + INVENTORY + raw revision_info |
| 2 | needle mis-transcribed / not unique / wrong cell | flatten text, count, ancestor walk, `json.dumps(ensure_ascii=True)` on all 3 strings | PASS — all 29 chars codepoint-identical in queue/Lean quote/audit needle; whole-law count 1; exact Sentence located; 四百万=4M, 八百万=8M |
| 3 | revision / law identity false | raw `law_info`/`revision_info` vs INVENTORY vs pin | PASS — `law_type=Act`, title 地方税法, num 昭和二十五年法律第二百二十六号, revision `325AC0000000226_20261101_508AC0000000002`, CurrentEnforced |
| 4 | article-kind locator claim false | import transcription_audit, call find_article_text with both titles | PASS — full title 第七十二条の二十四の七 → len 2821 + needle; short title 第七十二条の二十四 → len 209, no needle; audit uses full title |
| 5 | spec circular / unsound / dishonest boundaries | read 3 files; grep banned tokens; `Money := Nat` | PASS — successor spec distinct; `agree_bracket` universal via core Nat lemmas; no sorry/admit/axiom/Classical.choice; boundary theorems correct; `decide` kernel-sound |
| 6 | interpretive errors | static analysis vs statute + structural walk | PASS — (a) 超え strict > / 以下 ≤, (b) honest out-of-scope disclosure, (c) kind=CONDITION apt, (d) labels correct, (e) Nat lemmas sound |

## Detailed evidence

- Needle `"\u5404\u4e8b...\u91d1\u984d"` byte-identical in queue text, Lean quote (impl:20),
  and audit needle (decoded from `\u` escapes). Confirms 各事業年度, 所得, 四百万円=4M,
  八百万円=8M, 超え strict, 以下 inclusive.
- Ancestor chain: Law→LawBody→MainProvision→Chapter[2]→Section[2]→Subsection[2]→
  Article{Num=72_24_7}→Paragraph{1}→Item{3}→TableStruct→Table→TableRow→TableColumn→Sentence{1}.
- Article locator: full title essential — the shorter title returns a different
  article without the needle; audit correctly uses the full title.

## Uncertainty (U)

Spec.lean/Tests.lean omit the law-num/revision header strings (stylistic only, no
correctness impact). Audit is transcription fidelity only, not legal correctness
(docs `LEGAL_REVIEW_PENDING`). No `lake build` by reviewer — reading-based
assessment; theorem statements elementary and well-formed.

## Closing

NO FINDINGS. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
