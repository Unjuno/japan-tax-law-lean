# Independent adversarial review — 関税定率法 第十七条(5)（第十三条第七項ただし書の準用）EXCEPTION

Unit: NORM|13bac8bcfa07d6e3fcf0861aea41480df8ba7093311535bdf2e8e81a95a78304
Verbatim (injected from the authoritative queue task, not hand-typed):
  「第十三条第七項ただし書の規定は、前項の規定により関税を徴収する場合について準用する。」

## Verdict: NO FINDINGS (independent adversarial review + programmatic cross-check)

The independent adversarial reviewer returned NO FINDINGS with all 17 mandated checks
independently reproduced against authoritative sources, never from the author's prose.
A separate 29-point programmatic cross-check from the authoritative queue needle, raw
JSON and INVENTORY also passed with 0 fails.

Checks reproduced (all PASS):

1. Raw SHA-256 `924a01d3…986ae9c` exact match with the raw file and INVENTORY.
2. Needle occurs exactly once in the whole law text.
3. Needle present in `find_article_text(...,"第十七条")`; article len 1032.
4. `source_path` independently rebuilt from the raw JSON (iter_articles + text
   units): Article 第十七条 → Paragraph#5 → Sentence#1, sentence text byte-for-byte
   equal to the needle; caption （再輸出免税） verified.
5. Law identity 関税定率法 (NOT 関税法), 明治四十三年法律第五十四号, law_type Act,
   revision = INVENTORY current revision.
6. kind EXCEPTION, unhandled_conditions = [].
7. Source fidelity: needle contains `第十三条第七項ただし書の規定` and
   `前項の規定により関税を徴収する場合`; impl sets `sourceArticle = 13`,
   `sourceParagraph = 7`, `sourceIsProviso = true`, `withinException` true only for
   `prevParaCollection`; `agree_within_exception` axiom-free.
8. Needle verbatim (byte-for-byte, count 1) in impl, spec, tests and both docs.
9. Audit literal ASCII-only `\u`-escaped, decodes exactly to the needle; unique name;
   audit total 410, run 410/410 passed.
10. Imports wired in `JapanTaxLaw.lean` (impl/spec/tests) exactly once each.
11. No forbidden placeholders in code bodies (comments stripped):
    `sorry`/`admit`/`axiom`/`Classical.choice`/`sorryAx`/`omega`/`simp` all 0.
12. `#print axioms` on all six theorems: *"does not depend on any axioms"*; no
    `sorryAx`/`Classical.choice`.
13. Independent spec representationally distinct: `SpecWithinException : CollectionCase → Prop`
    vs `withinException : CollectionCase → Bool`; agreement proof uses only
    cases/constructor/intro/rfl — no `decide`/`simp`/`propext`.
14. Full `lake build` succeeded (1288 jobs).
15. Source correspondence independent of Lean (covered by 1–8, 11).
16. Dependency honesty: single `law_article` dependency on 前項 is
    `unresolved_underdetermined` / `sufficient=false`; no cross-law constant claimed,
    no bare 15-digit ID treated as resolved; UNIT doc acknowledges it; queue id
    independently recomputed with `make_normative_id` — exact match.
17. Legal-review axis separate and pending (`LEGAL_REVIEW_PENDING`,
    `completion_claim=false`); docs state legal correctness not modelled; no
    completion/legal-correctness claim made.

The reviewer's only observations were non-blocking pre-finalization bookkeeping (queue
`status = NOT_STARTED` with empty `evidence`, and the adversarial doc still a draft at
review time) — finalization updates both. No concrete H/T/D/C/U finding was reproduced.
Human legal review remains `LEGAL_REVIEW_PENDING`.
