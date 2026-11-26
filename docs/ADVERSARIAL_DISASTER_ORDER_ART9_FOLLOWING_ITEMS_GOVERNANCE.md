# Independent adversarial review — 災害政令 第9条(3) DELEGATION

Unit: `NORM|d0cb856a57842506990aec41a0c757458ed28f8db7c4057f954c919440bd54f0`
Law: `322CO0000000268` (CabinetOrder), snapshot `322CO0000000268_20251201_507CO0000000120.law.json`.

Verbatim source text (injected from the authoritative queue task): 「前二項の規定を適用する場合においては、次の各号の定めるところによる。」

## Verdict: NO FINDINGS

All 14 mandated checks were re-derived independently from the pinned raw source;
no concrete defect found. Details below.

## Reproduced checks

1. **SHA-256** — `sha256(data/raw/322CO0000000268_20251201_507CO0000000120.law.json)`
   = `f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c`
   (191,809 bytes); matches INVENTORY `raw_snapshot.source_sha256` (`F6FE…A21C`).
2. **Needle** — extracted the authoritative string directly from the JSON tree
   (`law_full_text/children[1]/children[1]/children[9]/children[3]/children[1]/children[0]/children[0]`),
   never hand-typed. Codepoints: `524D 4E8C 9805 306E 898F 5B9A 3092 9069 7528
   3059 308B 5834 5408 306B 304A 3044 3066 306F 3001 6B21 306E 5404 53F7 306E
   5B9A 3081 308B 3068 3053 308D 306B 3088 308B 3002`. Whole-file count = 1.
   Structure verified: `Article attr.Num=9`, `Paragraph attr.Num=3`,
   `ParagraphSentence`, `Sentence attr.Num=1`. The following items 一〜四 live in
   the same paragraph after the lead sentence; the model does **not** transcribe them.
3. **Semantics** — 前二項 = the preceding two paragraphs (Art.9(1),(2) verified in
   raw); 次の各号の定めるところによる = govern as provided by the following items.
   The `followingItems` selection is faithful; `other` is documented as an
   unspecified alternative, not an asserted legal category.
4. **source_path** — `LawBody[1]/MainProvision/MainProvision[9]/Article:9/Article#9/Paragraph#3/ParagraphSentence/Sentence#1`
   appears verbatim in both the impl docstring (line 14) and the unit doc (line 9).
5. **Law identity** — INVENTORY: `law_id=322CO0000000268`, `law_type=CabinetOrder`,
   `current_revision.law_revision_id=322CO0000000268_20251201_507CO0000000120`;
   raw `law_info`/`revision_info` agree. Official title in impl line 8 equals raw
   `revision_info.law_title` byte-for-byte (incl. 徴収 U+53CE; wrong 徴税 U+7A0E absent).
6. **Kind / deps** — DELEGATION (impl: "DELEGATION (with CONDITION aspect)");
   no `unhandled_conditions`, no `dependencies` asserted; no cross-law constant.
   No persisted queue record for this UID was found under `data/` or `docs/TASK_QUEUE.md`
   — consistent with the expected NOT_STARTED/empty bookkeeping at review time, not a defect.
7. **Codepoints** — the 「…」 quote in impl, spec, tests, unit doc and this doc was
   compared codepoint-by-codepoint with the raw JSON sentence: exact match in all.
   Audit literal (decoded from `\u` escapes via `checks()`) also equals the needle.
8. **Audit** — name `disaster relief order art.9 following-items governance - DisasterReliefOrderArt9FollowingItemsGovernance.lean`
   unique (1 occurrence); law_id `322CO0000000268`, kind `file` (whole-law locator via
   `load_law_text`, not article-limited). `checks()` length = 747; running the audit
   printed `transcription audit: 747/747 checks passed` with the unit check PASSing.
9. **Imports** — `JapanTaxLaw.lean` lines 668/669/670: each of the three governance
   imports occurs exactly once as an exact line. Impl imports only `JapanTaxLaw.TaxFinance`;
   spec imports impl; tests import spec.
10. **Proof bodies** — no `sorry`, `admit`, `axiom`, `Classical.choice`, or `simp`
    in any proof. (`sorry`/`admit`/`axiom`/`Classical.choice` occur only in the
    impl docstring's negative claim; "Not modelled" in the spec is a case variant
    of "NOT MODELLED" and is present.)
11. **Axioms** — `set PATH=C:\Users\user\.elan\bin;%PATH% && lake env lean _adv_ax.lean`
    reported for all four theorems: "does not depend on any axioms"
    (`source_is_following_items`, `other_not_selected`,
    `implementation_satisfies_spec`, `other_not_satisfying`).
12. **Spec independence** — `GoverningSource` is an inductive `Type`;
    `SpecGoverningSource` is a `Prop` equality predicate (representationally
    distinct). Agreement theorems proved by `rfl` / `cases`; boundary theorems use
    `unfold` + `intro` + `cases`.
13. **Build** — `lake build` completed: `Build completed successfully (2494 jobs)`,
    zero errors (only pre-existing unused-`simp` linter warnings elsewhere).
14. **Scope** — impl/spec/unit doc explicitly document that the content of the
    following items and legal correctness are NOT MODELLED; no following-item
    content is encoded. Unit doc records `LEGAL_REVIEW_PENDING` and makes no
    completion / legal-correctness claim.

## Note

Scratch files created for this review (`_adv_*`) were removed. All unit modules,
evidence files, audit script, umbrella and pre-existing scratch files were left
untouched.
