# Adversarial review — 相続税法施行規則 art.30（百万円）

Normative unit: `NORM|6b83a747a7e86cb520e53a9ba162dd0beda902d06616239281a19e2cb5460f75`
Law: `325M50000040017` / `325M50000040017_20260901_506M60000040016`, `MinisterialOrdinance`.

**Verdict: NO FINDINGS.** The unit's source pin, verbatim transcription, amount
fidelity, proof scaffolding, scope honesty and completion status all survive
independent reproduction. Verdict covers transcription/model fidelity only, not
legal correctness (`LEGAL_REVIEW_PENDING`).

All scratch probes used for this review were created with a leading `_` and
deleted afterwards; no evidence JSON, Lean module, audit script, umbrella or
existing documentation was modified.

| # | H (refutable hypothesis) | T (reproduction / evidence) | D (decision) | C (competing interpretation) | U (uncertainty) |
|---|---|---|---|---|---|
| 1 | Raw sha256 or needle/codepoints wrong | `data/raw/325M50000040017_20260901_506M60000040016.law.json`: 443929 bytes, sha256 `a4e46e6e…b552f` (matches pin); needle full-text count = 1. Codepoints: 百 `0x767E`, 万 `0x4E07`, 円 `0x5186`, comma `0x3001`, period `0x3002`. | PASS | A visually similar 百萬/圓 variant would still hash differently; byte hash excludes it. | Hash proves identity of the pinned bytes, not legal force. |
| 2 | Needle not at stated Article 30(3) Sentence#1, or not unique | Direct tree walk: only hit at `LawBody[2]/MainProvision/MainProvision[44]/Article:30 (Num=30, ArticleTitle 第三十条)/Paragraph Num=3/Sentence Num=1`; text equals needle exactly. Whole-file needle count 1; other 百万円 occurrences are art.13 and art.30(5), not this needle. `build/task_queue.json` task 7437 `source_path` equals the stated path verbatim. | PASS | A mis-indexed path could still land in art.30; here Num attrs and ArticleTitle agree with the label. | Path convention is queue-generated; verified against raw Num attrs, not assumed. |
| 3 | Law identity wrong / wrong-law pin | `data/INVENTORY.json` entry `325M50000040017`: `official_title=相続税法施行規則`, `law_num=昭和二十五年大蔵省令第十七号`, `law_type=MinisterialOrdinance`, `current_revision=…20260901_506M60000040016`, `raw_snapshot.source_sha256=A4E46E…552F`, current enforced. Raw `law_info`/`revision_info` agree. Live e-Gov API `law_data/325M50000040017_20260901_506M60000040016` returned 443929 bytes, sha256 identical to local raw, needle count 1, Art.30 ¶3 S1 identical. | PASS | A different law with the same title could be substituted; law_id, revision id and live API bytes all agree. | Live fetch confirms current API state as of review date. |
| 4 | Kind / unhandled conditions / dependencies dishonest | Queue task 7437: `kind=EXCEPTION` (`norm_type=EXCEPTION`), `decomposed=true`, `unhandled_conditions=[]`, dependency `law_article 第五十九条` with `resolution=unresolved_underdetermined`, `sufficient=false`. `SPEC_SCOPE_MAP.json` decision marks `EXPLICIT_SCOPE_MATCH`. | PASS | Declaring EXCEPTION while modelling a different norm would be dishonest; the only dependency is explicitly marked insufficient. | Classification schema is project-defined; no independent legal classification performed. |
| 5 | Model fidelity defective (amount, predicate, boundaries, invented proviso) | `Money = Nat` (`TaxFinance.lean:29`). `InheritanceRegPrescribedAmount.lean:42` `prescribedAmountYen : Money := 1_000_000` = 百万; `:45-46` `isPrescribedAmount a := a = prescribedAmountYen`. `Spec.lean:29-30` degenerate interval `[1M,1M]`, `:33-41` universal `agree_prescribed_amount`, `:44-59` `at_prescribed`/`below_prescribed`/`above_prescribed`/`amount_is_one_million`. `Tests.lean:13-26` kernel-decided 999,999=false, 1,000,000=true, 1,000,001=false. No art.59(1) proviso or applicability condition is defined; NOT MODELLED documented at impl `:30-32`, spec `:20-21`, unit doc `:38-40`. | PASS | Equality vs interval could diverge; `Nat.le_antisymm` proof makes them extensionally equal, as claimed. | No semantics of the substantive proviso is claimed or checked. |
| 6 | Mistranslated needle in impl/spec/tests/unit doc | Full needle occurs verbatim in `InheritanceRegPrescribedAmount.lean:22` (inside 「」), `docs/UNIT_INHERITANCE_REG_PRESCRIBED_AMOUNT_30.md:15`, and audit literal `scripts/ci/transcription_audit.py:1333`, all with identical 36 codepoints. Spec/tests carry only the prose token 百万円 (`0x767E 0x4E07 0x5186`), not a full quote; no 百萬円/百万圓 variants anywhere in the four artifacts. | PASS | Spec/tests might have been expected to quote the sentence; they do not, and make no verbatim-quote claim. | Prose descriptions in spec use abbreviated 法59条1項; not asserted as verbatim. |
| 7 | Audit literal wrong or check fails | AST decode of `transcription_audit.py:1330-1333`: name contains `InheritanceRegPrescribedAmount.lean`, law `325M50000040017`, kind `article`, locator `第三十条`, needle byte-identical to source. Full run: `PASS 相続税法施行規則 art.30…` and `transcription audit: 692/692 checks passed` (exit 0). | PASS | `find_article_text` matches by ArticleTitle; verified ArticleTitle `第三十条` and that it contains the needle. | Audit is transcription-only by its own docstring (`:2-9`). |
| 8 | Imports missing/duplicated | `JapanTaxLaw.lean:954-956` imports impl, spec, tests exactly once each; chain `Spec.lean:1` → impl, `Tests.lean:1` → spec. | PASS | Duplicate imports would still build; counted repo-wide, no duplicates. | None. |
| 9 | Forbidden placeholders / `simp` in proof bodies | Scanned all three Lean modules: no `sorry`, `admit`, `axiom`, `Classical.choice`, `simp`/`simpa`/`native_decide` in any proof body; proofs are `rfl`, `by decide`, `constructor`, `subst`, `Nat.le_antisymm`. Only prose mentions of those words occur in docstrings (impl `:34`, unit doc `:36`). | PASS | A forbidden token hidden in a comment would be harmless; none in code. | Linter warnings elsewhere in the build are unrelated pre-existing warnings. |
| 10 | The five theorems depend on axioms | `lake env lean _adv_axioms.lean` with `#print axioms` on all five: each line reports `'…' does not depend on any axioms`. | PASS | #print axioms reports only direct axioms; no `sorryAx` present (check 9). | None. |
| 11 | Build failure / hidden pre-existing failures | `lake build`: `Build completed successfully (2299 jobs)`; warnings only in unrelated modules (e.g. `ClampedSubtraction.lean:53`, `DependentAgeSupport.lean:69`). No error and no warning in any of the three unit modules. | PASS | A stale `.lake` cache could mask errors; axiom probe compiled the modules independently. | Concurrent agents added modules mid-session, so job count drifted (see observation). |
| 12 | Completion claim / legal review status misreported | `build/task_queue.json` task 7437: `status=PROVED_SCOPE`, `status_errors=["scope / boundary / cross-law / audit evidence incomplete"]`, `completion_claim=false`, `legal_review=LEGAL_REVIEW_PENDING`; `data/task_state.json:18000-18005` same status and `LEGAL_REVIEW_PENDING`. Unit doc `:40` explicitly denies article-level completion. | PASS | No artifact asserts legal correctness or completion. | Human legal review remains pending by design. |

## Observation (not a finding; concurrent workspace drift)

The unit doc (`docs/UNIT_INHERITANCE_REG_PRESCRIBED_AMOUNT_30.md:26-27,36`) and
`data/verification_evidence.json:5849,5851` state `188/188 checks passed` and
`614 jobs`. At review time the shared audit script had grown (mtime 15:41 vs doc
mtime 14:12) and the current run reports **692/692** with **2299** build jobs.
Both counts are stale environment statistics, not defects in this norm unit; the
unit's own check passes in both states. Evidence hashes in
`verification_evidence.json:5847-5853` match the three Lean files under the
repo's LF-normalized hash convention (raw CRLF bytes differ only by line endings).
