# Independent adversarial review — 地方税法 第七十六条(1)（ゴルフ場利用税の標準税率: 一人一日につき八百円）

Reviewer: an independent agent session (no shared working context with the
author). Temp scripts written and deleted; no repository file modified by the
reviewer; `lake build` not run by reviewer.

## Verdict: NO FINDINGS. Every testable claim holds; no fixes required.

| H (refutable hypothesis) | T (reproduction) | D (decision) |
|---|---|---|
| sha256 fabricated / wrong snapshot | independent `hashlib.sha256(raw.read_bytes())` | **PASS** — `3dd29e00…68d53`, 12,181,725 B; matches INVENTORY `source_sha256` |
| byte-level CJK defect / false quote / false needle | codepoint-by-codepoint compare of queue `text`, raw `Sentence#1`, Lean quote (`:20`), decoded audit `\u` literal (`:1311`) | **PASS** — all 28 codepoints identical (ゴ…場…標準…八百円…。); whole-law count 1; no 場/塲, 円/圆, 八/入, 百/白 confusions |
| fabricated revision / false law identity | INVENTORY `current_revision`, revisions.json (1 of 230), raw `revision_info`/`law_info` | **PASS** — revision current/enforced in all four sources; Act, 地方税法, 昭和二十五年法律第二百二十六号, law_id 325AC0000000226 |
| wrong article label / paragraph / sentence | structural walk of `law_full_text` | **PASS** — Article Num=76, ArticleTitle 第七十六条, Paragraph 1, Sentence 1; source path matches. Three articles titled 第七十六条 exist (1 main + 2 附則); main-provision one is first and `find_article_text` returns it correctly |
| article-kind-locator claim false | imported `transcription_audit.py`, called `find_article_text("325AC0000000226","第七十六条")` | **PASS** — non-None, len 173, needle present; matches `:1306` claim |
| Lean unsound / circular spec / false boundary | read 3 Lean files + `TaxFinance.lean` (`Money := Nat:29`); hand-check `mul_eq_accumulate` (base `rfl`, step `rw [Nat.mul_succ, ih]`), `agree_standard_tax` (unfold + exact); token scan for sorry/admit/axiom/Classical.choice | **PASS** — `specTaxYen` = `Nat.rec` repeated addition over person-days, genuinely distinct from multiplication; induction kernel-checked; universal & axiom-free; boundaries 1×1=800 (`rfl`), 2×3=4800 (`by decide`); no forbidden constructs |
| interpretive (a) 八百円=800/person/day | 八=8, 百=100, 一人一日につき | **PASS** |
| interpretive (b) kind EFFECT | queue `kind="EFFECT"`; rate-setting norm | **PASS** |
| interpretive (c) 標準税率 benchmark / local variation out of scope | raw article paras 2–3 | **PASS, strongly corroborated** — the same article lets prefectures levy ABOVE the standard rate up to ¥1,200 and set differential rates (差等); the scope note (`GolfCourseUseTaxStandardRate.lean:25-31`, `Spec:16-18`) is accurate and does not claim ¥800 is the actual municipal rate |
| interpretive (d) labels Act / 第七十六条 | H3/H4 | **PASS** |
| interpretive (e) multiplication model faithful | `800 * (people * days)` natural linear reading; no cap/differential smuggled in | **PASS** |
| interpretive (f) 標準税率 as rate table | Article 76 para 1 single flat ¥800, no table | **PASS** |

## C (competing interpretation)

The spec reuses `standardRateYenPerPersonPerDay = 800`, so the proof verifies arithmetic equivalence, not the statutory number; transcription of 800 is separately guaranteed by the CI audit (byte-fidelity). This is a scope property, not an error.

## Closing

No concrete findings; no fixes required. No claim of legal correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
