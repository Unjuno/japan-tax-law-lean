# Independent adversarial review — 相続税法施行規則 第三十条(6)第一号（解約返戻金相当額百万円以下）

Reviewer: an independent agent session (no shared working context with the
author). Read-only: independent Python `hashlib`/`json`/codepoint scripts written
to temp files and deleted afterward. `lake build` not run by reviewer. No
repository file modified by reviewer.

## Verdict: ONE CONCRETE FINDING (F1) — reproduced and FIXED. All other checks PASS.

| # | H (hypothesis to falsify) | T (independent test) | D |
|---|---|---|---|
| 1 | sha256 wrong | `hashlib.sha256` of raw bytes (443,929 B) = `a4e46e6e…35b552f`, matches INVENTORY | PASS |
| 2 | byte-level CJK defect in quote | queue needle from `build/task_queue.json` codepoint list; Lean quote `json.dumps` identical (`equal: True`); audit needle via `\u` escapes decodes to queue needle; no 滯/个 confusions; 百万円=1,000,000 | PASS |
| 2c | needle count/location wrong | whole-law count 1; `LawBody → MainProvision → Article(Num=30) → Paragraph(Num=6) → Item(Num=1) → Sentence(Num=1)`, ArticleTitle 第三十条; exactly one Article titled 第三十条; text len 6705 | PASS |
| 3 | fabricated revision | INVENTORY `current_revision.law_revision_id` = `325M50000040017_20260901_506M60000040016`; file exists; raw `revision_info` identical; CurrentEnforced | PASS |
| 3b | false law identity/type | raw + INVENTORY `law_type=MinisterialOrdinance` (省令), title 相続税法施行規則, num 昭和二十五年大蔵省令第十七号. Not 法律/CabinetOrder | PASS (except the number label — F1) |
| 4 | article-kind-locator claim false | `find_article_text("325M50000040017","第三十条")` returns non-None len 6705, needle present, count 1 | PASS |
| 5 | spec circular / unsound tokens | `specInScope x := x < Nat.succ thresholdYen` distinct from impl `x ≤`; `agree_scope` universal ∀ x; no sorry/admit/axiom/Classical.choice declarations; `Money := Nat`; Nat lemmas sound | PASS |
| 6a | wrong strictness/amount | 以下 = ≤ inclusive; `at_limit : inScope 1_000_000`, `above_limit : ¬ inScope 1_000_001`, `threshold_decoded := rfl` | PASS |
| 6b | scope over-approximation | needle is one of five items defining `法第五十九条第二項ただし書に規定する財務省令で定める契約`; declared scope (only the surrender-value ceiling; surrounding definition, other items/paragraphs, computation, other articles NOT MODELLED) matches source structure | PASS |
| 6c/d | kind/decide inappropriate | queue kind=CONDITION appropriate; `decide` on closed Nat-≤ kernel-sound | PASS |

## F1 — false law-number label (FIXED)

- **H:** `InheritanceRegSurrenderValueCondition.lean:9` asserted `Law number: 昭和二十五年大蔵省令第十号`; authoritative sources give **第十七号** (No. 17, with 七 U+4E03).
- **T:** INVENTORY `law_num` and raw `law_info.law_num` both `\u662d\u548c\u4e8c\u5341\u4e94\u5e74\u5927\u8535\u7701\u4ee4\u7b2c\u5341\u4e03\u53f7`; raw `law_info.law_num_num = "017"`; law id suffix `…0017` corroborates. Lean line 9 had `…第十号` (no U+4E03). Author reproduced via codepoint census.
- **D: FAIL** on label fidelity. **Fix applied:** replaced `第十号` with the byte-exact authoritative `第十七号` in the impl header, unit doc, and PR body (from INVENTORY `law_num`). Spec/tests contained neither form — unaffected. Rebuilt (`GATES_OK`), impl hash refreshed `32f0ff7c…` → `532ef428…`.
- **C:** the wrong number likely originated upstream in the task brief; the author was instructed to verify law_num via INVENTORY + raw and did not catch it initially. No competing valid interpretation — raw + INVENTORY + `law_num_num="017"` are definitive.
- **U:** negligible on facts; label-only defect — kernel proofs and audit unaffected.

## Closing

F1 reproduced and fixed; all substantive checks PASS. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
