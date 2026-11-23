# Independent adversarial review — 租税特別措置法 第七十条の三 PRESUMPTION

Unit: NORM|d775175c5fdefe03cb113c17eb692261fc30ceac82464eae2afd408b64095615
Verbatim source text (injected from the queue, not hand-typed): 「住宅取得等資金の贈与をした者の直系卑属である推定相続人（孫を含む。）であること。」

## Reviewer verdict: 2 FINDINGS (source-fidelity + doc corruption) — FIXED & CONFIRMED

The reviewer reproduced all 15 mandated checks; the mechanical/proof checks pass, but
two concrete defects were found and fixed.

### F-1 (HIGH, reproduced, fixed) — invented "fetus" instead of source "grandchild"
The authoritative raw law says 孫を含む (grandchild, U+5B6B), count 1; 胎を含む
(fetus, U+80CE), count 0. The initial model had mistranslated 孫 → 胎 and built a
fabricated `includesFetus` flag and `fetus_included` theorem, while claiming the facts
were "extracted structurally, never hand-typed" — false. Fixed by replacing 胎→孫
throughout and renaming `includesFetus`→`includesGrandchild`,
`fetus_included`→`grandchild_included`, with English prose corrected to
"grandchild". The proof structure is unchanged (flag = true); the *interpretation*
now matches the source. Confirmed: no 胎/includesFetus in any deliverable.

### F-2 (MEDIUM, reproduced, fixed) — corrupted verbatim line in this doc
Line 5 contained 居住取得等資金…胎を含む (居住 U+5C45 U+4F4F and 胎 U+80CE),
which occurs 0 times in the authoritative law; the correct needle is 住宅 (U+4F4F
U+5B85) … 孫. This corruption was propagated by the review brief itself. Fixed by
removing the duplicate corrupted line; the sole verbatim line is the authoritative
needle injected from the queue.

### Checks reproduced (all PASS after fixes)
Raw sha256 e6e6013b…c8d5ee; needle whole-law count 1; source_path resolved in raw
JSON (Article 70_3 len 6672); law identity 租税特別措置法 / Act / INVENTORY revision;
kind PRESUMPTION, unhandled_conditions=[]; presumptive-heir/grandchild-inclusion facts
faithful with no invented tax consequences (docs mark NOT MODELLED); needle verbatim
in impl/spec/tests/UNIT doc/audit literal (`\u`-escaped); audit name unique and
468/468; imports wired once each; no forbidden placeholders or `simp` in proof bodies;
all four theorems axiom-free; spec Prop conjunction vs Bool function+flag with
axiom-free agreement; build 1528 jobs; dependencies empty; `LEGAL_REVIEW_PENDING`.

Regression guards added for the 孫/胎 distinction and the 住宅/居住 distinction
(28/28 cross-check, 0 fails). No gate weakened; no remaining findings. Human legal
review remains `LEGAL_REVIEW_PENDING`.
