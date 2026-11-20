# Independent adversarial review — 相続税法 art.1_2(1) cross-law reference

Reviewer: an independent agent session (no shared working context with the
author). Read-only: it recomputed the pinned sha256, walked the raw JSON tree,
decoded structural context, and read the three Lean files plus the audit check.
No repository files were modified.

## Verdict: NO CONCRETE FINDINGS

All falsifiable hypotheses were tested and passed. The formalization is
transcription-faithful, the reference-target identities are literally verified
in the pinned raw text, the spec is genuinely independent, and no unsound
constructs are present. The concerns about `other` and the omitted 民法877
substance are declared, honest scope choices, not falsifications.

## Reproduction tests (T) — all PASS

| # | Test | Result |
|---|------|--------|
| T1 | `hashlib.sha256(raw_bytes)` | `c01bb9be…275043a7` — matches claimed hash and INVENTORY (uppercase); size 856,326 bytes. |
| T2 | needle count | 1 in whole raw (and normalized). |
| T3 | structural walk | `LawBody[3]→MainProvision→Chapter→Section→Article(Num=1_2)→Paragraph(1)→Item(1)→ItemSentence→Column(2)→Sentence(1)` — exactly the declared path. |
| T4 | article context | `ArticleCaption = （定義）`; Item 1 Column#1 = `扶養義務者` (defined term), Column#2 = needle (definition body, ends 「をいう。」). Definition clause confirmed. |
| T5 | cross-law tokens | `民法（明治二十九年法律第八十九号）第八百七十七条（扶養義務者）` present verbatim → law 89, article 877, caption 扶養義務者; 明治29年 = 1896. |
| T6 | law identity | `325AC0000000073` = 相続税法; revision and raw snapshot path match INVENTORY; raw `law_info` / `revision_info` agree. |
| T7 | audit check | `transcription_audit.py:1211-1216` resolves 第一条の二 and finds the needle. |
| T8 | forbidden constructs | Only the descriptive comment; no actual `sorry`/`admit`/`axiom`/`Classical.choice`. |

## Findings register (H/T/D/C/U)

- **F1 (hash wrong):** REFUTED — hash matches. **D: PASS.**
- **F2 (needle/mislocation):** REFUTED — count 1, exact path, definition confirmed, cross-ref verified. **D: PASS.**
- **F3 (spec circular):** REFUTED — spec uses structural pattern match while implementation uses `==` disjunction; spec never calls implementation; `agree_in_defined_term` is `cases p <;> rfl`, universal over all 3 inhabitants. **D: PASS.**
- **F4 (interpretive: wrong law/article):** REFUTED — law id, revision, art.1_2 definition article all confirmed. **D: PASS.**
- **F5 (unsound bounds/theorems):** REFUTED — `spouse_in_term`, `civil_relative_in_term`, `other_not_in_term`, `reference_law_number=89`, `reference_article=877` correct; finite `rfl` tests separated from universal proof. **D: PASS.**

## Competing interpretations (C) and uncertainty (U) — not findings

- **C1:** the statute defines the term 扶養義務者 (Column 1), which the model does not name; it models membership in the defined class only. Declared abstraction; does not over-/under-approximate the class (`inDefinedTerm` true exactly for spouse ∪ civilCode877Relative).
- **C2:** substantive 民法877 content (直系血族・兄弟姉妹・家庭裁判所指定) collapsed into one label; honestly declared NOT MODELLED. The model asserts nothing about which real persons qualify — only the cross-reference and target identity.
- **C3:** the `other` constructor is explicitly labelled "outside the defined class (boundary probe only)", never asserted as a statutory category, and evaluates false. Does not distort the statute.
- **U1:** no Lean build was run by the reviewer (per instruction); kernel acceptance inferred from inspection. Author recorded full build + axiom probe: 593 jobs, all 6 theorems axiom-free.
- **U2:** the defined-term name 扶養義務者 is not recorded in the model — a documentation-level scope tradeoff, not a falsifiable error.

## Closing

No soundness break, wrong pin, transcription error or circular proof. The only
weaknesses are honestly-declared scope limits (C1/C2/U2). No claim of legal
correctness; human legal review remains `LEGAL_REVIEW_PENDING`.
